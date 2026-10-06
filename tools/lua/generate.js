// Generates lua/api.d.lua from two inputs that must stay separate:
//
//   tools/lua/api.measured.d.lua  the engine surface as measured from the game's own bindings
//                                 (names, arity, positional types, returns, mode notes); it is
//                                 regenerated from the measurement and never edited here
//   tools/lua/overlay.json        what a measurement cannot know: prose, readable parameter
//                                 names, reference tags (---@aetref <ReferenceKind>[:<type>]) and
//                                 enum-typed parameters, keyed by function and parameter position
//
// plus ---@alias string unions built from the schema's own enum files, so an enum-typed string
// parameter completes and validates in any LuaCATS-aware analyzer without server code.
//
// Usage: node tools/lua/generate.js   (from the schema repository root)
'use strict';
const fs = require('node:fs');
const path = require('node:path');

const ROOT = path.resolve(__dirname, '..', '..');
const MEASURED = path.join(__dirname, 'api.measured.d.lua');
const OVERLAY = path.join(__dirname, 'overlay.json');
const OUTPUT = path.join(ROOT, 'lua', 'api.d.lua');

const overlay = JSON.parse(fs.readFileSync(OVERLAY, 'utf8'));
const measured = fs.readFileSync(MEASURED, 'utf8').split(/\r?\n/);
const warnings = [];

// ── enum aliases ─────────────────────────────────────────────────────────────
// The enum files are one `values:` list of `- name: X` entries; nothing else is read.
function enumValues(relativeYaml) {
    const lines = fs.readFileSync(path.join(ROOT, 'eaw', relativeYaml), 'utf8').split(/\r?\n/);
    const values = [];
    let inValues = false;
    for (const line of lines) {
        if (/^values:\s*$/.test(line)) {
            inValues = true;
            continue;
        }
        if (inValues && /^\S/.test(line)) inValues = false;
        if (!inValues) continue;
        const m = /^\s*-\s*name:\s*(.+?)\s*$/.exec(line);
        if (m) values.push(m[1].replace(/^"(.*)"$/, '$1').replace(/^'(.*)'$/, '$1'));
    }
    if (values.length === 0) warnings.push(`no values read from ${relativeYaml}`);
    return values;
}

const aliasLines = [];
for (const [alias, source] of Object.entries(overlay.aliases || {})) {
    const values = enumValues(source.file);
    aliasLines.push(`--- ${source.description || `Values of the schema enum ${alias}`} (${values.length} values, from eaw/${source.file}).`);
    aliasLines.push(`---@alias ${alias} ${values.map((v) => JSON.stringify(v)).join('|')}`);
    aliasLines.push('');
}

function referenceTag(ref) {
    return '---@aetref ' + ref;
}

// ── merge ────────────────────────────────────────────────────────────────────
const used = new Set();
const output = [];
let block = []; // the `---` lines gathered before a declaration

function flushBlock() {
    output.push(...block);
    block = [];
}

// The measured file names a parameter p<N> when the binding gave no name. Where the type is one
// of the engine's own classes the name follows from it; a primitive keeps a type word until the
// measurement supplies the binding's own name. The result is what hover shows, so a placeholder
// is the last resort.
const NAME_BY_TYPE = {
    GameObject: 'object', GameObjectType: 'objectType', Player: 'player', AITargetLocation: 'location',
    TaskForce: 'taskForce', Budget: 'budget', Position: 'position', StoryEvent: 'event', StoryPlot: 'plot',
    Script: 'script', FreeStore: 'freeStore', string: 'name', number: 'value', boolean: 'flag',
    table: 'list', function: 'callback', thread: 'thread', userdata: 'value', lightuserdata: 'value', any: 'value'
};
const NAME_BY_UNION = [
    [['GameObject', 'AITargetLocation'], 'target'],
    [['GameObject', 'Position'], 'target'],
    [['GameObjectType', 'string'], 'objectType'],
    [['GameObjectType', 'Player'], 'filter'],
];

function nameFromType(type) {
    const parts = type.replace(/\?$/, '').split('|');
    for (const [members, name] of NAME_BY_UNION)
        if (members.every((m) => parts.includes(m))) return name;
    return NAME_BY_TYPE[parts[0]] || 'value';
}

function rewrite(name, signatureLine) {
    const entry = overlay.functions[name] || {};
    if (overlay.functions[name]) used.add(name);

    const params = entry.params || {};
    const sig = /^function\s+([\w.:]+)\s*\(([^)]*)\)\s*end\s*$/.exec(signatureLine);
    const sigParams = sig ? sig[2].split(',').map((s) => s.trim()).filter(Boolean) : [];
    const renamed = [...sigParams];
    const taken = new Map(); // derived names used in this signature so far -> count

    const rebuilt = [];
    if (entry.description) for (const d of entry.description) rebuilt.push(`--- ${d}`);
    let position = 0;
    for (const line of block) {
        const pm = /^---@param\s+(\S+)\s+(\S+)(.*)$/.exec(line);
        if (!pm) {
            rebuilt.push(line);
            continue;
        }
        position++;
        const p = params[String(position)] || {};
        const type = p.type || pm[2];
        let paramName = p.name || pm[1];
        if (!p.name && /^p\d+$/.test(pm[1])) {
            const base = nameFromType(type);
            const n = (taken.get(base) || 0) + 1;
            taken.set(base, n);
            paramName = n === 1 ? base : `${base}${n}`;
        }
        const doc = p.doc ? ` ${p.doc}` : pm[3];
        rebuilt.push(`---@param ${paramName} ${type}${doc}`);
        if (p.ref) rebuilt.push(referenceTag(p.ref));
        if (position - 1 < renamed.length) renamed[position - 1] = paramName;
    }
    // Parameters the overlay knows beyond the measured positions: the bindings cast only what
    // they read, so a trailing argument the engine passes through untouched, or a variadic
    // binding, has no measured position. The curated name and type fill the gap, placed before
    // any ---@vararg line so the declaration stays well-formed.
    const extra = Object.keys(params).map(Number).filter((k) => k > position).sort((a, b) => a - b);
    if (extra.length) {
        const varargAt = rebuilt.findIndex((l) => l.startsWith('---@vararg'));
        const lines = [];
        for (const k of extra) {
            if (k !== position + lines.filter((l) => l.startsWith('---@param')).length + 1) {
                warnings.push(`${name}: overlay parameter ${k} leaves a gap after measured position ${position}`);
                break;
            }
            const p = params[String(k)];
            if (!p.name) {
                warnings.push(`${name}: overlay parameter ${k} has no name`);
                break;
            }
            lines.push(`---@param ${p.name} ${p.type || p.curatedType || 'any'}${p.doc ? ` ${p.doc}` : ''}`);
            if (p.ref) lines.push(referenceTag(p.ref));
            renamed.splice(k - 1, 0, p.name);
        }
        rebuilt.splice(varargAt < 0 ? rebuilt.length : varargAt, 0, ...lines);
        // A variadic signature keeps its `...` last.
        const dots = renamed.indexOf('...');
        if (dots >= 0 && dots !== renamed.length - 1) renamed.push(...renamed.splice(dots, 1));
    }

    block = [];
    output.push(...rebuilt);
    output.push(sig ? `function ${sig[1]}(${renamed.join(', ')}) end` : signatureLine);
}

for (const line of measured) {
    if (line.startsWith('---')) {
        block.push(line);
        continue;
    }
    const fm = /^function\s+([\w.:]+)\s*\(/.exec(line);
    if (fm) {
        rewrite(fm[1], line);
        continue;
    }
    flushBlock();
    output.push(line);
}
flushBlock();

for (const name of Object.keys(overlay.functions))
    if (!used.has(name)) warnings.push(`${name}: in the overlay but not in the measured surface`);

// ── header ───────────────────────────────────────────────────────────────────
// The measured file's own header stays; this one says what was merged in and names the tag.
const header = [
    '---@meta',
    '--- GENERATED by tools/lua/generate.js - do not edit. Measured surface: tools/lua/api.measured.d.lua;',
    '--- curated prose, parameter names and reference tags: tools/lua/overlay.json.',
    '---',
    '--- Custom annotation: ---@aetref <ReferenceKind>[:<referenceType>], placed after the ---@param it',
    '--- describes. It says what the string names - an XML object of a type, a localisation key, a',
    '--- bone, an enum value - so the editor can complete and check it.',
    ''
];

// The measured file starts with its own ---@meta; drop that one line so the file has one.
const body = output[0] === '---@meta' ? output.slice(1) : output;
fs.writeFileSync(OUTPUT, [...header, ...aliasLines, ...body].join('\n').replace(/\n{3,}/g, '\n\n'));

for (const w of warnings) console.warn('warning:', w);
console.log(`wrote ${path.relative(ROOT, OUTPUT)}: ${used.size} of ${Object.keys(overlay.functions).length} overlay entries applied, ${aliasLines.length / 3} aliases`);
if (warnings.length) process.exitCode = 1;
