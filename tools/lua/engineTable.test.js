// Run with: node --test tools/lua/*.test.js
'use strict';
const assert = require('node:assert/strict');
const {describe, it} = require('node:test');

const {engineTable, engineTableNames} = require('./engineTable');

describe('engineTableNames', () => {
    it('names the functions that also carry members', () => {
        const lines = [
            'function FogOfWar() end',
            'function FogOfWar.Reveal(p1) end',
            'function Story_Event(name) end',
            'function GameObject.Get_Owner() end',
        ];
        assert.deepEqual([...engineTableNames(lines)], ['FogOfWar']);
    });
});

describe('engineTable', () => {
    it('declares a class with the call as its overload, so its members attach', () => {
        assert.deepEqual(
            engineTable('FindTarget', [
                '--- Finds a target.',
                '---@vararg any',
                '---@return AITargetLocation|GameObject',
            ]),
            [
                '--- Finds a target.',
                '---@vararg any',
                '---@return AITargetLocation|GameObject',
                '---@class FindTarget',
                '---@overload fun(...: any): AITargetLocation|GameObject',
                'FindTarget = {}',
            ],
        );
    });

    it('keeps named parameters and drops a return the call has none of', () => {
        assert.deepEqual(
            engineTable('FindPlanet', ['---@param name string The planet']),
            ['---@param name string The planet', '---@class FindPlanet', '---@overload fun(name: string)', 'FindPlanet = {}'],
        );
    });

    it('carries an optional parameter as optional', () => {
        assert.deepEqual(
            engineTable('Create_Thread', ['---@param fn string', '---@param data? any']),
            ['---@param fn string', '---@param data? any', '---@class Create_Thread', '---@overload fun(fn: string, data?: any)', 'Create_Thread = {}'],
        );
    });

    // The server reads a call's parameters and their reference tags from the @param and @aetref lines
    // (Find_First_Object("X") names a GameObjectType); emmylua still attaches the members with them
    // above the class (measured, emmylua_ls 0.25.1).
    it('keeps the parameter and reference lines above the class', () => {
        assert.deepEqual(
            engineTable('Find_First_Object', ['--- Finds.', '---@param type_name string', '---@aetref XmlObject:GameObjectType', '---@return GameObject']),
            [
                '--- Finds.',
                '---@param type_name string',
                '---@aetref XmlObject:GameObjectType',
                '---@return GameObject',
                '---@class Find_First_Object',
                '---@overload fun(type_name: string): GameObject',
                'Find_First_Object = {}',
            ],
        );
    });
});
