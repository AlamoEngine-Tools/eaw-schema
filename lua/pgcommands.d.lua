---@meta
--- PGCommands.lua, the vanilla library (Data/Scripts/Library/PGCommands.lua). Hand-maintained; the prose was
--- migrated from the documentation site's library page on 2026-10-14; a type the page did not
--- give was inferred from how the library source uses the value (tools/docsync/infer_types.py),
--- and `any` is one the source does not settle. Every name here is a
--- global the library defines when a script requires it.
--- Requires: PGBaseDefinitions.

--- Functions

--- Waits forever.
function WaitForever() end

--- Registers a function for delayed execution. The function is called once, as `func(param)`, from the first `PumpEvents()` after `timeout` seconds of game time have passed. The same function can be registered several times; each registration fires once.
--- Sets up a callback `func(param)` after `timeout` (in seconds) has expired.
---@param func function The function to execute.
---@param timeout number The time in seconds to wait.
---@param param any The value handed to `func` when the timer fires.
function Register_Timer(func, timeout, param) end

--- Processes the timers.
--- Internal function to manage timers.
function Process_Timers() end

--- Cancels a function that has been registered for delayed execution. All pending registrations of `func` are cancelled.
--- Cancel timer for a given function.
---@param func? function The function to cancel.
function Cancel_Timer(func) end

--- Registers a death event for a given object. `func` is called once, without arguments, on the first `PumpEvents()` after the object is no longer valid. An object can only be registered once.
--- Sets up a call to `func` when the given object dies.
---@param obj GameObject The object that triggers the function by dying.
---@param func function The function to execute.
function Register_Death_Event(obj, func) end

--- Processes death events.
--- Internal function to manage death callbacks.
function Process_Death_Events() end

--- Registers an attacked event for a given object.
--- === "Forces of Corruption"
--- When `FindDeadlyEnemy(obj)` first returns an enemy, `func(true, enemy, obj)` is called; when it returns nothing again, `func(false, nil, obj)` is called.
--- === "Empire at War"
--- The EaW copy of the library calls `func(true, enemy)` and `func(false)`, without `obj`.
--- This repeats for every new attack. The registration ends only when the object becomes invalid or `Cancel_Attacked_Event(obj)` is called.
--- Sets up a call to `func` when the given object is first attacked and when it is no longer under attack. See `Register_Attacked_Event()` for the arguments, which differ between the EaW and FoC copies of the library.
---@param obj GameObject The object that triggers the function by being attacked.
---@param func function The function to execute.
function Register_Attacked_Event(obj, func) end

--- Processes attacked events.
--- Internal function to manage attack callbacks.
function Process_Attacked_Events() end

--- Cancels a registered attacked event for a given object.
---@param obj? GameObject The registered object to remove.
function Cancel_Attacked_Event(obj) end

--- Sets up a proximity callback through `obj.Event_Object_In_Range(func, range, player_filter)`. `func(obj, trigger_object)` is called for objects in range on every service until it is cancelled with `obj.Cancel_Event_Object_In_Range(func)` or `obj` becomes invalid. Does nothing in galactic mode. In the FoC copy of the library an invalid `obj` raises a script error, which stops the script.
--- Sets up a callback to `func(obj, trigger)`. The callback is executed continuously if not cancelled. Cancel by calling `obj.Cancel_Event_Object_In_Range(func)`. Does nothing in galactic mode.
---@param obj GameObject The object around which the proximity is checked.
---@param func function The function to execute.
---@param range number The proximity in game units.
---@param player_filter? Player Only objects owned by the player trigger a proximity event.
function Register_Prox(obj, func, range, player_filter) end

--- Processes proximity events.
--- Internal function that calls `Service_Wrapper` on units registered for proximity callbacks.
function Process_Proximities() end

--- Calls all `Process_...` functions. Called by `PumpEvents()`. In order: `Process_Timers()`, `Process_Death_Events()`, `Process_Proximities()`, `Process_Attacked_Events()`, then `Process_Reinforcements()` (PGSpawnUnits) and `Story_Mode_Service()` if they are defined.
--- Internal function that runs processing functions and `Story_Mode_Service` if it exists. Is called by `PumpEvents`.
function Pump_Service() end

--- Tries to fire a given ability if the difficulty allows it, using `Chance(GetAbilityChanceSeed(), GetChanceAllowed(difficulty))` (PGBase).
--- === "Forces of Corruption"
--- In the FoC copy of the library that chance is always 100%.
--- === "Empire at War"
--- In the EaW copy it depends on the owner's difficulty.
--- Then calls `Use_Ability_If_Able(...)`.
--- `thing` can be a unit or taskforce. Activates ability if possible. Only activates ability if a difficulty dependent chance is successful (see `GetChanceAllowed`). In the FoC library that chance is always 100%; in the EaW library it depends on the owner's difficulty.
---@param thing GameObject The thing that should activate the ability (a unit or a task force).
---@param ability_name string The name of the ability to activate.
---@param target? GameObject The ability's target if applicable.
---@return boolean `true` if ability was activated, `false` if not.
function Try_Ability(thing, ability_name, target) end

--- Activates the ability for a unit or a taskforce's units if able. Optionally uses ability on a target. For a unit, the ability must exist, be ready and not be active; a task force is not checked. With a target that is no longer valid nothing is activated, but the function still returns `true`.
--- `thing` can be a unit or taskforce. Activates ability if possible.
---@param thing GameObject The thing that should activate the ability.
---@param ability_name string The name of the ability to activate.
---@param target? GameObject The ability's target if applicable.
---@return boolean `true` if ability was activated, `false` if not.
function Use_Ability_If_Able(thing, ability_name, target) end

--- Tests whether a thing is a Taskforce.
---@param thing? GameObject|TaskForce The object to test.
---@return any `thing.Get_Unit_Table` (a function, truthy) for a task force, else `nil` or `false`; test it for truth, not for `true`.
function Is_A_Taskforce(thing) end

--- This will consider diverting the passed object in order to use an area of effect ability centered on the unit.
---@param object GameObject The game object to use the ability.
---@param ability_name string The ability to use.
---@param area_of_effect number The area of effect. * `table<GameObject> recent_enemy_units`: The list of recently tracked enemy units (passed to `Find_Best_Local_Threat_Center`).
---@param recent_enemy_units table
---@param min_threat_to_use_ability number The minimum threat level.
function ConsiderDivertAndAOE(object, ability_name, area_of_effect, recent_enemy_units, min_threat_to_use_ability) end

--- Tests whether at least one of the given objects is in range.
--- Returns true if at least one of `target_unit_list` is inside the given range of `origin_unit`
---@param origin_unit GameObject The unit that wants to know the range. * `table<GameObject> table_unit_list`: the objects that should be in range.
---@param target_unit_list table
---@param range number The range to test.
---@return boolean `true` if at least one object is in range, `false` else.
function OneOrMoreInRange(origin_unit, target_unit_list, range) end

--- Cleans a table of all friendly objects, i.e. all objects owned by `PlayerObject`. The result is a new list; `obj_table` itself is not changed.
--- Returns a new list with the objects of `obj_table` that do not belong to `PlayerObject`, i.e. it removes the friendly objects. `obj_table` itself is not changed.
---@param obj_table table
---@return GameObject[]
function PruneFriendlyObjects(obj_table) end

--- Tries to garrison a unit from a given task force.
--- Forces of Corruption only:
--- This function and all functions below it on this page exist only in the FoC copy of the library.
--- Tries to garrison `unit`. Prefers places from which the unit can fire but will also find others if `offensive_only` is false. If `tf` is given, releases `unit` from `tf`.
---@param tf? TaskForce The task force the unit belongs to. If valid, the unit is released from it and its orders are locked.
---@param unit GameObject The unit to garrison.
---@param offensive_only? boolean Whether to use only offensive objects, i.e. objects the garrisoned units can fire from.
---@param range number The maximum distance to the target garrison.
---@return boolean `true` if successfully garrisoned, `false` else.
function Try_Garrison(tf, unit, offensive_only, range) end

--- Tries to deploy the units garrisoned in `object`. Every garrisoned unit whose `Get_Hull()` is above `health_threshold` leaves the garrison if `target` is not valid or the unit `Is_Good_Against(target)`.
--- Deploys units garrisoned in `object` if their health is high enough and there is no `target` or the garrisoned unit is good against the target.
---@param object GameObject The garrison (container) whose units should deploy.
---@param target? GameObject The target the deployed units should be good against.
---@param health_threshold number Minimum health (as returned by `Get_Hull()`) for a garrisoned unit to deploy.
---@return boolean `true` if at least one unit was deployed, `false` else.
function Try_Deploy_Garrison(object, target, health_threshold) end

--- Gets the proper property flag for certain special units.
--- warning:
--- The reason this is done in a script function instead of the corresponding XML tag is unknown.
--- The assumed reason is that those objects are teams.
--- Defines which heroes are healed by which type of healer. Also done for some special units. Used in free store and PGEvents.
---@param unit GameObject
---@return string? The property flag (`"HealsInfantry"` or `"HealsVehicles"`, looked up by the unit's type name) or `nil`.
function Get_Special_Healer_Property_Flag(unit) end

--- Sets up the AI Targeting priorities for ground units in a given task force.
--- Sets targeting priorities for the given taskforce.
---@param tf TaskForce The task force to set the priorities for.
function Set_Land_AI_Targeting_Priorities(tf) end

--- Tries to swap weapons for a given unit, if it's a good idea to use the alternate weapons against another unit.
--- Switches weapons if they are more effective against the given target. Requires a custom entry for each unit type that can switch weapons.
---@param object GameObject The object to attempt the weapon switch for.
---@param target GameObject The target to use the weapons against.
function Try_Weapon_Switch(object, target) end

--- Generates a magic number to wait for: 2400 minus the current game time in seconds, but at least 60.
--- Returns a wait duration for magic plans: 2400 minus the current game time in seconds, but at least 60.
---@return number The magic wait time.
function Determine_Magic_Wait_Duration() end

--- Produces a taskforce.
--- Deprecated: The function is commented out in both the EaW and the FoC copy of the library and is therefore not defined. Calling it raises a Lua error.
--- Not defined by the library as shipped (the definition is commented out), so a call raises a Lua error.
---@deprecated
---@param taskforce TaskForce The taskforce to produce.
function ProduceForce(taskforce) end

--- Starts the production of an object.
--- Deprecated: The function is commented out in both the EaW and the FoC copy of the library and is therefore not defined. Calling it raises a Lua error. The engine command it wrapped, `_ProduceObject(player, object_type, object)`, is still registered.
--- Not defined by the library as shipped (the definition is commented out), so a call raises a Lua error.
---@deprecated
---@param player Player The player to produce the object for.
---@param objecttype GameObjectType The type of the object to produce.
---@param where GameObject The facility to produce the object.
---@return GameObject The produced object.
function ProduceObject(player, objecttype, where) end

--- Waits for the object to be produced.
--- Deprecated: The function is commented out in both the EaW and the FoC copy of the library and is therefore not defined. Calling it raises a Lua error.
--- Not defined by the library as shipped (the definition is commented out), so a call raises a Lua error.
---@deprecated
---@param objecttype GameObjectType The type of the object to produce.
---@param where GameObject The facility to produce the object.
---@return GameObject The produced object.
function WaitProduceObject(objecttype, where) end
