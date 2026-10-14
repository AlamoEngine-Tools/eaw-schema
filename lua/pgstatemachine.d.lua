---@meta
--- PGStateMachine.lua, the vanilla library (Data/Scripts/Library/PGStateMachine.lua). Hand-maintained; the prose was
--- migrated from the documentation site's library page on 2026-10-14; a type the page did not
--- give was inferred from how the library source uses the value (tools/docsync/infer_types.py),
--- and `any` is one the source does not settle. Every name here is a
--- global the library defines when a script requires it.
--- Requires: pgcommands.

--- Engine-set globals the library resets in its definitions (declared by the engine API):
--- `ServiceRate`

--- Globals the library assigns (at load time or in its definitions function)

--- Declares the state machine's base table.
--- Assigned `{}` by the library.
---@type table
StateMachine = nil

--- Declares the state machine's index holder table.
--- Assigned `{}` by the library.
---@type table
StateMachineIndexes = nil

--- Declares the state machine's lookup table.
--- Assigned `{}` by the library.
---@type table
StateMachineIndexLookup = nil

--- The `OnEnter` message that is received when an object enters a state.
--- Assigned `1` by the library.
---@type number
OnEnter = nil

--- The `OnUpdate` message that is received when an object is in a state.
--- Assigned `2` by the library.
---@type number
OnUpdate = nil

--- The `OnExit` message an object receives when it leaves a state.
--- Assigned `3` by the library.
---@type number
OnExit = nil

--- The state machine's bookkeeping.
--- Assigned `1` by the library.
---@type number
CurrentStateIndex = nil

--- The state machine's bookkeeping.
--- Assigned `1` by the library.
---@type number
DefineStateIndex = nil

--- The state machine's bookkeeping.
--- Assigned `nil` by the library.
---@type any
NextState = nil

--- The state machine's bookkeeping.
--- Assigned `nil` by the library.
---@type any
CurrentState = nil

--- The state machine's bookkeeping.
--- Assigned `nil` by the library.
---@type any
_curproc = nil

--- The state machine's bookkeeping.
--- Assigned `nil` by the library.
---@type any
StoryModeEvents = nil

--- Functions

--- Defines a new state in the state machine table. The first state defined becomes the initial state. Defining an existing state again replaces its function and keeps its position in the order.
---@param state string This is the tag used to identify the state.
---@param function_value function The function that will process all messages associated with the given state
function Define_State(state, function_value) end

--- Advances to the next state, based on the order of state definition.
function Advance_State() end

--- Sets the next state to transition to. A state that has not been defined is ignored silently; `nil` ends the state machine after the current state exits.
---@param state string This is the tag used to identify the next state.
function Set_Next_State(state) end

--- Returns the current state.
---@return string The current state tag.
function Get_Current_State() end

--- Returns the next state.
---@return string The next state tag.
function Get_Next_State() end

--- This function is called to advance the state machine through its states. For each state it calls the state function with `OnEnter`, then repeatedly with `OnUpdate`, calling `PumpEvents()` after each `OnUpdate` while no transition is pending, and finally with `OnExit` once the next state differs. It returns when the next state is `nil`. An undefined state raises a script error.
function Process_States() end

--- The engine calls this function when the script state is created and again, after `Flush_G()`, each time a pooled state is released; see Script setup for the exact timing.
--- Defines the basic variables required for the state machine. It first calls `Common_Base_Definitions()`, then sets the globals below, then calls `Definitions()` and `PG_Story_Mode_Init()` if they are defined.
--- Globals:
--- - `StateMachine = {}`: Declares the state machine's base table.
--- - `StateMachineIndexes = {}`: Declares the state machine's index holder table.
--- - `StateMachineIndexLookup = {}`: Declares the state machine's lookup table.
--- - `OnEnter = 1`: The `OnEnter` message that is received when an object enters a state.
--- - `OnUpdate = 2`: The `OnUpdate` message that is received when an object is in a state.
--- - `OnExit = 3`: The `OnExit` message an object receives when it leaves a state.
--- - `CurrentStateIndex = 1`, `DefineStateIndex = 1`, `NextState = nil`, `CurrentState = nil`, `_curproc = nil`, `StoryModeEvents = nil`: The state machine's bookkeeping.
--- - `ServiceRate = 0.2`: The service rate: `1.0` services once a second, `0.2` services five times a second. The engine reads this global from the script; a unit or structure script whose `ServiceRate` is nil or not a number is never serviced, so the library sets it to 0.2 before `Definitions` runs (service rule).
function Base_Definitions() end

--- This is the main thread function for this script.
--- Upon return from this function the script will finish.
--- It runs `Process_States()` and then calls `ScriptExit()`, which stops every thread of the script, not only the main thread. The script state itself stays loaded until the object or plot it belongs to releases it.
function main() end
