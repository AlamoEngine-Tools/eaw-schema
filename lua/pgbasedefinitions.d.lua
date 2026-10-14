---@meta
--- PGBaseDefinitions.lua, the vanilla library (Data/Scripts/Library/PGBaseDefinitions.lua). Hand-maintained; the prose was
--- migrated from the documentation site's library page on 2026-10-14; a type the page did not
--- give was inferred from how the library source uses the value (tools/docsync/infer_types.py),
--- and `any` is one the source does not settle. Every name here is a
--- global the library defines when a script requires it.
--- Requires: PGBase.

--- `PGBaseDefinitions.lua` is used by nearly every script in the game and introduces a wide array of generic variables that are used throughout the scripts.
--- ## Defined globals
--- These values are valid throughout every script. Changing them is not advised without a specific reason.

--- Engine-set globals the library resets in its definitions (declared by the engine API):
--- `AITarget`, `Object`, `Target`, `FreeStore`, `PlayerObject`, `LastService`, `Budget`

--- Globals the library assigns (at load time or in its definitions function)

--- Assigned `-1000000000000000000.0` by the library.
---@type number
BAD_WEIGHT = nil

--- Assigned `1000000000000000000.0` by the library.
---@type number
BIG_FLOAT = nil

--- Creates the table used to register timer events.
--- Assigned `{}` by the library.
---@type table
TimerTable = nil

--- Creates the table used to keep track of death events.
--- Assigned `{}` by the library.
---@type table
DeathTable = nil

--- Creates the table used to keep track of proximity events.
--- Assigned `{}` by the library.
---@type table
ProxTable = nil

--- Creates the table used to keep track of attack events.
--- Assigned `{}` by the library.
---@type table
AttackedTable = nil

--- Reference to the currently fired event.
--- Assigned `nil` by the library.
---@type any
CurrentEvent = nil

--- Reference to the event's parameters.
--- Assigned `nil` by the library.
---@type any
EventParams = nil

--- Reference to the current block object (a command result with `IsFinished()` and `Result()`) to block on.
--- Assigned `nil` by the library.
---@type any
block = nil

--- Flag set by `BreakBlock()`; `BlockOnCommand(...)` returns early when it is `true`.
--- Assigned `false` by the library.
---@type boolean
break_block = nil

--- Counter that `PumpEvents()` increments on every yield. The library only uses it in commented-out debug messages.
--- Assigned `0` by the library.
---@type number
YieldCount = nil

--- Usually used to store the reference to the current enemy.
--- Assigned `nil` by the library.
---@type any
enemy = nil

--- The current task force.
--- Assigned `nil` by the library.
---@type any
taskforce = nil

--- Only used in a commented-out block of PGCommands, where it held a unit produced by
--- WaitProduceObject before it was added to the task force.
--- Assigned `nil` by the library.
---@type any
tfObj = nil

--- Assigned `nil` by the library.
---@type any
stage = nil

--- Assigned `nil` by the library.
---@type any
UnitType = nil

--- Assigned `nil` by the library.
---@type any
invade_status = nil

--- Assigned `nil` by the library.
---@type any
path = nil

--- Assigned `false` by the library.
---@type boolean
InvasionActive = nil

--- Assigned `nil` by the library.
---@type any
unit = nil

--- Assigned `nil` by the library.
---@type any
hide_target = nil

--- Assigned `nil` by the library.
---@type GameObject
healer = nil

--- Assigned `nil` by the library.
---@type Position
xfire_pos = nil

--- Assigned `nil` by the library.
---@type Position
kite_pos = nil

--- Assigned `nil` by the library.
---@type GameObject
friendly = nil

--- Assigned `{}` by the library.
---@type table
block_table = nil

--- Holds the blocking command of the anti-idle move order that PGTaskForce issues; it is polled
--- with IsFinished.
--- Assigned `nil` by the library.
---@type BlockingStatus|nil
lib_anti_idle_block = nil

--- Functions

--- This function declares the variables that are commonly used throughout scripts and sometimes referenced in evaluations. Usually variables are either initialised with `nil` or as empty tables. `Object`, `Target`, `AITarget`, `FreeStore`, `PlayerObject`, `LastService` and `Budget` are set by the engine for the script kinds that use them, after `Base_Definitions()` has run, so changing them is not advised. Clearing them keeps the next owner of a reused pooled state from inheriting the previous owner's values; see Lifecycle of one script state.
--- * `stage = nil`
--- *[UNKNOWN]*
--- * `UnitType = nil`
--- *[UNKNOWN]*
--- * `invade_status = nil`
--- *[UNKNOWN]*
--- * `path = nil`
--- *[UNKNOWN]*
--- * `InvasionActive = false`
--- *[UNKNOWN]*
--- * `unit = nil`
--- *[UNKNOWN]*
--- * `hide_target = nil`
--- Reference to a nearby Nebula/Ion Storm/Asteroid field.
--- * `healer = nil`
--- Reference to an object that can heal the unit.
--- * `xfire_pos = nil`
--- *[UNKNOWN]*
--- * `kite_pos = nil`
--- *[UNKNOWN]*
--- * `friendly = nil`
--- Reference to the friendly player.
--- * `block_table = {}`
--- The pending reinforcement requests of `ReinforceList(...)` (PGSpawnUnits) are stored here.
--- * `lib_anti_idle_block = nil`
--- Definitions:
--- - `ThreadValue.Reset()`
--- Clears the values stored with `ThreadValue.Set(...)`. The store belongs to the script state and survives reuse of a pooled state, so without this call the next owner would see the previous owner's thread values.
--- - `GetEvent.Reset()`
--- Clears the script's whole event queue, for all of its threads. Like the thread values, the queue survives reuse of a pooled state.
--- - `TimerTable = {}` Creates the table used to register timer events.
--- - `DeathTable = {}` Creates the table used to keep track of death events.
--- - `ProxTable = {}` Creates the table used to keep track of proximity events.
--- - `AttackedTable = {}` Creates the table used to keep track of attack events.
--- - `CurrentEvent = nil` Reference to the currently fired event.
--- - `EventParams = nil` Reference to the event's parameters.
--- - `block = nil` Reference to the current block object (a command result with `IsFinished()` and `Result()`) to block on.
--- - `break_block = false` Flag set by `BreakBlock()`; `BlockOnCommand(...)` returns early when it is `true`.
--- - `YieldCount = 0` Counter that `PumpEvents()` increments on every yield. The library only uses it in commented-out debug messages.
--- - `AITarget = nil` The current AI target. Set by the engine for AI plan scripts.
--- - `Object = nil` Reference to the object the script is attached to. Set by the engine for unit scripts.
--- - `Target = nil` Reference to the current target is usually stored here. Set by the engine for AI plan and evaluator scripts.
--- - `FreeStore = nil` Object free store. Generally used for AI. Set by the engine for free store scripts.
--- - `PlayerObject = nil` Reference to the current player object is usually stored here. Set by the engine for AI plan, free store and evaluator scripts.
--- - `LastService = nil` Game time of the script's last service, compared with `ServiceRate` by the engine (service rule). By that rule, if a reused pooled state kept the previous owner's `LastService`, its next owner would not be serviced until the new game time passed that value.
--- - `Budget = nil` The AI budget of the plan. Set by the engine for AI plan scripts.
--- - `enemy = nil` Usually used to store the reference to the current enemy.
--- - `taskforce = nil` The current task force.
--- - `tfObj = nil`
--- Unverified:
--- Reference to the current taskforce object.
--- Unverified:
--- Anti-idle actions for the AI are stored here.
--- (Re)Sets all kinds of global variables. Only used in Base_Definitions()
function Common_Base_Definitions() end

--- The base constructor for every script. It is called from `C++` and subsequently calls `Common_Base_Definitions()` and `Definitions()` if present in the script.
--- The engine calls it when a script state is created and again, after `Flush_G()`, each time a pooled state is released, before the engine-set globals (`Object`, `PlayerObject`, `Target`, ...) are available, so `Definitions()` cannot use them; Script setup gives the exact timing, including reuse and save games.
--- Calls `Common_Base_Definitions()` and `Definitions()` if it exists.
function Base_Definitions() end

--- The engine calls this function by name for evaluator scripts. Cleans out the `Target` and `PlayerObject` references. Subsequently calls `Clean_Up()` if present in the script.
--- Basic clean up function for evaluator scripts. Calls `Clean_Up()`.
function Evaluator_Clean_Up() end

--- Tests whether the entire list of units is in an obscuring field, with obscuring fields being nebulae, asteroid fields and ion storms.
--- Returns true if all given units are obscured by some space field.
---@param unit_list table The list of ships to test.
---@return boolean `true` if the entire unit list is concealed, `false` else.
function UnitListIsObscured(unit_list) end

--- Removes all invalid references from a unit list and returns that list.
--- Removes all dead or otherwise invalid units from a list and returns it.
---@param unit_list table The list to clean.
---@return table The cleaned unit list.
function Cull_Unit_List(unit_list) end
