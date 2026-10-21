// An engine global that is a function AND carries members - FogOfWar, FindTarget, WeightedTypeList and
// the rest. Written as `function FogOfWar() end` plus `function FogOfWar.Reveal(...) end`, the analyzer
// attaches no member to a function value, so every `FogOfWar.Reveal(...)` in a script was an undefined
// field (938 of them over vanilla FoC, emmylua_ls 0.25.1). Declared as a class with the call as its
// overload, the members attach and the call keeps its signature (measured with the same analyzer).
'use strict';

/** The globals the measured surface declares as a function and also gives members. */
function engineTableNames(lines) {
    const functions = new Set();
    const owners = new Set();
    for (const line of lines) {
        const plain = /^function\s+([A-Za-z_]\w*)\s*\(/.exec(line);
        if (plain) functions.add(plain[1]);
        const member = /^function\s+([A-Za-z_]\w*)\.\w+\s*\(/.exec(line);
        if (member) owners.add(member[1]);
    }
    return new Set([...functions].filter((name) => owners.has(name)));
}

/**
 * The declaration of one such global: its prose, the class, the call as an overload and the table.
 * `docLines` are the declaration's `---` lines as the generator built them.
 */
function engineTable(name, docLines) {
    const prose = [];
    const params = [];
    let vararg = null;
    let returns = null;
    for (const line of docLines) {
        const param = /^---@param\s+(\S+)\s+(\S+)/.exec(line);
        const varargs = /^---@vararg\s+(\S+)/.exec(line);
        const ret = /^---@return\s+(\S+)/.exec(line);
        // every line stays above the class: the server reads a call's parameters and reference tags
        // from them, and the analyzer still attaches the members (measured, emmylua_ls 0.25.1)
        prose.push(line);
        if (param) {
            const optional = param[1].endsWith('?');
            params.push(`${param[1].replace(/\?$/, '')}${optional ? '?' : ''}: ${param[2]}`);
        } else if (varargs) {
            vararg = varargs[1];
        } else if (ret) {
            returns = ret[1];
        }
    }
    if (vararg) params.push(`...: ${vararg}`);
    return [
        ...prose,
        `---@class ${name}`,
        `---@overload fun(${params.join(', ')})${returns ? `: ${returns}` : ''}`,
        `${name} = {}`,
    ];
}

module.exports = {engineTable, engineTableNames};
