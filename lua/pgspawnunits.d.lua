---@meta
--- PGSpawnUnits.lua, the vanilla library (Data/Scripts/Library/PGSpawnUnits.lua). Hand-maintained; the prose was
--- migrated from the documentation site's library page on 2026-10-14; a type the page did not
--- give was inferred from how the library source uses the value (tools/docsync/infer_types.py),
--- and `any` is one the source does not settle. Every name here is a
--- global the library defines when a script requires it.
--- Requires: PGBaseDefinitions.

--- Functions

--- Processes all reinforcements received. Do not call it manually. It is called by `Pump_Service()` (PGCommands), i.e. on every `PumpEvents()`, and issues the pending `Reinforce_Unit(...)` commands queued by `ReinforceList(...)`. A script that does not pump events never gets its `ReinforceList(...)` units.
function Process_Reinforcements() end

--- Adds a given object to the player's reinforcement pool.
---@param object_type GameObjectType The object type to reinforce. A type name (string) is accepted too and converted with `Find_Object_Type(...)`.
---@param player Player The player to reinforce.
function Add_Reinforcement(object_type, player) end

--- Adds a list of reinforcements to a given player's reinforcement pool.
--- The function only queues the requests and returns at once; `Process_Reinforcements()` issues one `Reinforce_Unit(...)` per type on the following `PumpEvents()` calls and collects the arriving units.
---@param type_list table
---@param entry_marker GameObject|Position|AITargetLocation The position to spawn the reinforcements at.
---@param player Player The player to reinforce. Required; with `nil` the function shows a message box and returns.
---@param allow_ai_usage boolean Whether the AI may use the reinforcements. If `true`, `Prevent_AI_Usage(false)` is called on each arriving unit.
---@param delete_after_scenario boolean If `true`, `Mark_Parent_Mode_Object_For_Death()` is called on each arriving unit, so the player does not keep it after the scenario; if `false`, the player may keep the reinforcements.
---@param ignore_reinforcement_rules boolean Whether the reinforcements ignore the reinforcement rules and are spawned regardless. Passed to `Reinforce_Unit(...)` inverted, as its last (obey zones) argument. * `[optional] function callback`: A function to call once the `ReinforceList(...)` has finished. It receives the list of arrived units.
---@param callback boolean
function ReinforceList(type_list, entry_marker, player, allow_ai_usage, delete_after_scenario, ignore_reinforcement_rules, callback) end

--- Spawns a given list of units simultaneously with `Spawn_Unit(...)` and returns the list of all spawned units.
---@param type_list table
---@param entry_marker GameObject|Position|AITargetLocation The position to spawn the reinforcements at.
---@param player Player The player to reinforce.
---@param allow_ai_usage boolean Whether the AI may use the spawned units. `Prevent_AI_Usage(...)` is called on every spawned unit either way: with `false` when `allow_ai_usage` is `true`, with `true` otherwise.
---@param delete_after_scenario boolean If `true`, `Mark_Parent_Mode_Object_For_Death()` is called on each spawned unit, so the player does not keep it after the scenario; if `false`, the player may keep the units.
function SpawnList(type_list, entry_marker, player, allow_ai_usage, delete_after_scenario) end
