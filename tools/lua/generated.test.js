// Run with: node --test tools/lua/*.test.js
// Checks lua/api.d.lua as generate.js wrote it: what a Lua analyzer reads must be valid Lua.
'use strict';
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const {describe, it} = require('node:test');

const lines = fs.readFileSync(path.join(__dirname, '..', '..', 'lua', 'api.d.lua'), 'utf8').split(/\r?\n/);

describe('lua/api.d.lua', () => {
    it('declares every parameter of a function as a plain Lua name', () => {
        const bad = lines.filter((l) => {
            const m = /^function [\w.:]+\(([^)]*)\) end$/.exec(l);
            return m && m[1].split(',').map((p) => p.trim()).some((p) => p && p !== '...' && !/^[A-Za-z_]\w*$/.test(p));
        });
        assert.deepEqual(bad, []);
    });

    it('declares as many parameters as the binding demands', () => {
        const short = [];
        let arity = null;
        for (const l of lines) {
            const a = /^--- arity: (\d+)\.$/.exec(l);
            if (a) arity = Number(a[1]);
            const f = /^function ([\w.:]+)\(([^)]*)\) end$/.exec(l);
            if (!f) continue;
            const params = f[2].split(',').map((p) => p.trim()).filter(Boolean);
            if (arity !== null && !params.includes('...') && params.length < arity) short.push(`${f[1]}: ${params.length} of ${arity}`);
            arity = null;
        }
        assert.deepEqual(short, []);
    });

    it('takes a parameter past the fewest arguments the binding accepts as optional, and names it rather than a vararg', () => {
        const wrong = [];
        let arity = null;
        const params = [];
        for (const l of lines) {
            const a = /^--- arity: (.*)\.$/.exec(l);
            if (a) arity = a[1];
            const p = /^---@param (\S+)/.exec(l);
            if (p) params.push(p[1]);
            const f = /^function ([\w.:]+)\(([^)]*)\) end$/.exec(l);
            if (f && arity) {
                const counts = arity === 'any' ? [0] : (arity.match(/\d+/g) || []).map(Number);
                const fewest = Math.min(...counts);
                const most = /^at least|^any$/.test(arity) ? Infinity : Math.max(...counts);
                params.forEach((name, i) => {
                    if (i >= fewest && !name.endsWith('?')) wrong.push(`${f[1]}: ${name} required past ${fewest}`);
                });
                if (f[2].includes('...') && params.length >= most) wrong.push(`${f[1]}: vararg past ${most}`);
            }
            if (!l.startsWith('---')) {
                arity = null;
                params.length = 0;
            }
        }
        assert.deepEqual(wrong, []);
    });

    it('lists the call forms a binding dispatches between as overloads, each returning what the call returns', () => {
        const at = lines.findIndex((l) => l.startsWith('function Find_Nearest('));
        let start = at;
        while (lines[start - 1].startsWith('---')) start--;
        const overloads = lines.slice(start, at).filter((l) => l.startsWith('---@overload'));
        assert.deepEqual(overloads, [
            '---@overload fun(origin: GameObject|AITargetLocation|TaskForce): GameObject',
            '---@overload fun(origin: GameObject|AITargetLocation|TaskForce, filter: string): GameObject',
            '---@overload fun(origin: GameObject|AITargetLocation|TaskForce, player: Player, match_allegiance: boolean): GameObject',
            '---@overload fun(origin: GameObject|AITargetLocation|TaskForce, filter: string, player: Player, match_allegiance: boolean): GameObject',
        ]);
    });

    it('names a measured position after its type even when it is optional', () => {
        assert.deepEqual(lines.filter((l) => /^---@param p\d+\?/.test(l)), []);
    });

    /** The `---@param` lines directly above a declaration line. */
    function paramsAbove(declaration) {
        const at = lines.indexOf(declaration);
        assert.ok(at >= 0, declaration);
        let start = at;
        while (start > 0 && lines[start - 1].startsWith('---')) start--;
        return lines.slice(start, at).filter((l) => l.startsWith('---@param'));
    }

    // The binding tests its count against 3 and 4 and reads a fifth; vanilla Markertrigger.lua
    // calls it with three.
    it('takes a position past the binding\'s own count test as optional', () => {
        assert.deepEqual(paramsAbove('function Reinforce_Unit(unit_type, flag, player, flag2, flag3) end').map((l) => l.split(' ')[1]),
            ['unit_type', 'flag', 'player', 'flag2?', 'flag3?']);
    });

    // Vanilla reads ThreadValue("x") and writes ThreadValue.Set("x", v).
    it('declares a value store the host also calls as a callable table with the store\'s members', () => {
        for (const [name, store] of [['GlobalValue', 'GlobalValueStore'], ['ThreadValue', 'ThreadValueStore']]) {
            assert.ok(lines.includes(`---@class ${name}: ${store}`), name);
            assert.ok(!lines.includes(`function ${name}(key) end`), name);
            assert.ok(!lines.includes(`${name} = nil`), name);
        }
    });

    // A global declared both as a class table and as a typed nil loses its members: emmylua_ls 0.25.1
    // hovers `Script` as unknown and calls Script.Debug_Should_Issue_Event_Alert an undefined field.
    it('declares a class table global once, never again as a typed nil', () => {
        const tables = new Set(lines.map((l) => /^([A-Za-z_]\w*) = \{\}$/.exec(l)).filter(Boolean).map((m) => m[1]));
        assert.deepEqual(lines.filter((l) => {
            const m = /^([A-Za-z_]\w*) = nil$/.exec(l);
            return m && tables.has(m[1]);
        }), []);
    });

    // Every argument is a filter in any position (measured); vanilla passes a lone player.
    it('takes a player as Find_All_Objects_Of_Type\'s first filter', () => {
        assert.ok(paramsAbove('function Find_All_Objects_Of_Type(filter, ...) end')
            .some((l) => l.startsWith('---@param filter string|GameObjectType|Player')));
    });
});
