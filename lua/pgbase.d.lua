---@meta
--- PGBase.lua, the vanilla library (Data/Scripts/Library/PGBase.lua). Hand-maintained; the prose was
--- migrated from the documentation site's library page on 2026-10-14; a type the page did not
--- give was inferred from how the library source uses the value (tools/docsync/infer_types.py),
--- and `any` is one the source does not settle. Every name here is a
--- global the library defines when a script requires it.
--- Requires: PGDebug.

--- Globals the library assigns (at load time or in its definitions function)

--- Assigned `0` by the library.
---@type number
YieldCount = nil

--- Functions

--- Sets a flag in `C++` that terminates the script the function has been called from. From then on the engine resumes none of the script's threads. When called inside a thread, the function also ends that thread immediately (`coroutine.yield(false)`); when called outside a thread (e.g. from `Base_Definitions`) it returns and execution continues.
--- Sets the engine's exit flag for the whole script; from then on the engine resumes none of the script's threads. See `ScriptExit()` for the behaviour inside and outside a thread.
function ScriptExit() end

--- Pauses the execution of the calling thread for a certain amount of game time. The engine has no sleep of its own: the function stores the start time in `ThreadValue` and calls `PumpEvents()` until `GetCurrentTime()` has advanced by `time`, so event handlers, timers and proximity callbacks keep running while it waits, and the wait ends on the first service after the time has passed.
--- A galactic script gets no service while a tactical battle is running or while the galactic game is paused, so it cannot resume during that time (see the service rule).
--- Continue pumping events without doing anything else until the given game time has passed.
---@param time number The time to pause the script in seconds.
function Sleep(time) end

--- Blocks the execution until the execution of `block` has been finished or `max_duration` has expired. If `alternate_break_func` is provided, `block` will stop being serviced, once `alternate_break_func` returns `true`.
--- Calls `PumpEvents()` while waiting. Returns `block.Result()` when the block has finished, and `nil` when `block` is `nil`, the time ran out, `alternate_break_func` returned `true` or `BreakBlock()` was called.
--- Waits until `block.IsFinished()` returns true, `alternate_break_func()` returns true or the given time runs out. If the block has finished, this returns `block.Result()`. Mainly used for unit movement commands and the reinforce command.
---@param block BlockingStatus An object with the methods `IsFinished()` and `Result()`, as returned by movement commands and `Reinforce_Unit`. It is not a function.
---@param max_duration number The time `block` is allowed to run for. Set to `-1` to only use `alternate_break_func` to stop the execution of `block`.
---@param alternate_break_func? function If this function returns `true`, execution of `block` will stop. **Required** if `max_duration` is set to `-1`.
function BlockOnCommand(block, max_duration, alternate_break_func) end

--- Default function to call, if a `block` should be terminated. It sets the global flag `break_block`; the next loop of a running `BlockOnCommand(...)` returns `nil`. The flag is global to the script, so it affects whichever thread's `BlockOnCommand(...)` checks it first.
--- Breaks a BlockOnCommand (may have unexpected effects if a BlockOnCommand is running in multiple threads)
function BreakBlock() end

--- Runs `PumpEvents()` once and returns `block.IsFinished()`; returns `nil` when `block` is `nil`.
---@param block BlockingStatus An object with the method `IsFinished()`, as returned by movement commands and `Reinforce_Unit`.
function TestCommand(block) end

--- Services chained events. In order: calls `Object.Service_Wrapper()` when the script has an `Object`, calls `Pump_Service()` when it is defined (PGCommands: timers, death, proximity and attacked events), then yields to the engine. On the next service it takes every queued event from `GetEvent()` and calls each handler with the parameters from `GetEvent.Params()`. Calling it again while it is already running in the same thread raises a script error.
--- Implements threading and calls event handlers. Returns control to 'C' and continues on next service (i.e. after `ServiceRate` seconds).
function PumpEvents() end

--- Tests if a provided `GameObjectWrapper wrapper` is a valid `GameObject`. This function should always be called when working with native functions on any `GameObject`.
--- Returns `false` when `wrapper` is `nil` or has no `Is_Valid` member, otherwise `wrapper.Is_Valid()`.
--- Used to check validity of game objects. Returns `false` if `wrapper` is nil, doesn't have a function `Is_Valid` or `wrapper.Is_Valid()` is false.
---@param wrapper any
function TestValid(wrapper) end

--- Clamps a given value.
---@param value number The value to clamp.
---@param min number The minimum value.
---@param max number The maximum value.
---@return number
function Clamp(value, min, max) end

--- A workaround to simulate a floor function. It returns `string.format("%d", val)`, a string, and relies on Lua converting that string back to a number when it is used in arithmetic. The workaround exists because the game does not open Lua's `math` library, so `math.floor` is not available.
--- Returns `val` as string. Requires implicit string to int conversion of the return value.
---@param val number The value to floor.
---@return string
function Dirty_Floor(val) end

--- A simple modulus function.
---@param a number Dividend.
---@param b number Divisor.
function Simple_Mod(a, b) end

--- Returns if something happened, given a % chance. The result is `(seed + 1) mod 100 < percent`; it is deterministic for a given seed.
--- Requires a random `seed` between 0 and 99. Under those conditions it returns true with `percent` chance.
---@param seed number Random seed.
---@param percent number The chance of the event to happen.
---@return boolean `true` if the event should happen, `false` else.
function Chance(seed, percent) end

--- Returns the current minute.
---@return number The current minute.
function GetCurrentMinute() end

--- === "Forces of Corruption"
--- Returns the current time in seconds.
--- === "Empire at War"
--- Returns `Dirty_Floor(GetCurrentTime()/10) + 9`.
--- Just the current game time in seconds. The EaW copy of the library returns `Dirty_Floor(GetCurrentTime()/10) + 9` instead.
---@return number The current time in seconds.
function GetAbilityChanceSeed() end

--- Returns a chance based on difficulty.
--- === "Forces of Corruption"
--- === "Empire at War"
--- Returns 20 for `"Easy"`, 100 for `"Hard"` and 60 otherwise.
--- warning:
--- The function does not work as indicated and always returns a chance of 100%.
--- Supposed to be difficulty dependent but always returns 100. The EaW copy of the library returns 20 for "Easy", 100 for "Hard" and 60 otherwise.
---@param difficulty string The current difficulty.
---@return number The chance for an event based on difficulty. Currently returns 100.
function GetChanceAllowed(difficulty) end

--- Creates a player-specific name for a given variable: `"PLAYER" .. player_object.Get_ID() .. "_" .. var_name`.
--- Returns `var_name` with a player specific prefix
---@param player_object Player The `PlayerObject` to create a specific variable name for.
---@param var_name string The base name of the variable.
---@return string The player-specific variable name.
function PlayerSpecificName(player_object, var_name) end

--- Flushes `_G`. Deletes every global table except `_LOADED`, `coroutine`, `string`, `table`, `security`, `LuaWrapperMetaTable` and `_G`, and every global userdata whose `Is_Pool_Safe()` returns `false` (all game objects, players, object types, AI targets, budgets, task forces, story plots and story events). Engine commands are kept, and global numbers, strings, booleans and functions are not touched.
--- The engine calls `Flush_G()` and then `Base_Definitions()` when a pooled script state is released; see Lifecycle of one script state.
--- warning:
--- Do not call this function without understanding what `_G` is in Lua.
--- Resets a pooled script state: deletes global tables and engine object references and keeps numbers, strings, booleans and functions. See `Flush_G()` and what a released state keeps.
function Flush_G() end
