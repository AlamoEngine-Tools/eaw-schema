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
            if (f) {
                arity = null;
                params.length = 0;
            }
        }
        assert.deepEqual(wrong, []);
    });

    it('names a measured position after its type even when it is optional', () => {
        assert.deepEqual(lines.filter((l) => /^---@param p\d+\?/.test(l)), []);
    });
});
