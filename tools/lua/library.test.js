// Run with: node --test tools/lua/*.test.js
// Checks the hand-kept library stubs (lua/pg*.d.lua) against what emmylua_ls was measured to honour.
'use strict';
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const {describe, it} = require('node:test');

const LUA = path.join(__dirname, '..', '..', 'lua');

/** The annotation lines directly above `function <name>(`, in the stub that declares it. */
function annotations(name) {
    for (const file of fs.readdirSync(LUA).filter((f) => f.endsWith('.d.lua'))) {
        const lines = fs.readFileSync(path.join(LUA, file), 'utf8').split(/\r?\n/);
        const at = lines.findIndex((l) => l.startsWith(`function ${name}(`));
        if (at < 0) continue;
        let start = at;
        while (start > 0 && lines[start - 1].startsWith('---')) start--;
        return lines.slice(start, at).filter((l) => l.startsWith('---@'));
    }
    throw new Error(`${name} is declared in no stub`);
}

describe('library stubs', () => {
    // `---@return_cast p -?` strips nil and keeps the rest: a guarded TaskForce stays a TaskForce. A
    // cast to GameObject or TypeGuard<GameObject> would turn it into a GameObject; no @return makes
    // the call nil, so everything after `TestValid(x) and` is unreachable and `x` is `never`
    it('TestValid narrows its argument to non-nil, whatever it is', () => {
        const a = annotations('TestValid');
        assert.ok(a.includes('---@return boolean'), a.join('\n'));
        assert.ok(a.includes('---@return_cast wrapper -?'), a.join('\n'));
    });
});
