---@meta
--- PGStoryMode.lua, the vanilla library (Data/Scripts/Library/PGStoryMode.lua). Hand-maintained; the prose was
--- migrated from the documentation site's library page on 2026-10-14; a type the page did not
--- give was inferred from how the library source uses the value (tools/docsync/infer_types.py),
--- and `any` is one the source does not settle. Every name here is a
--- global the library defines when a script requires it.
--- Requires: PGStateMachine, PGSpawnUnits, PGMoveUnits.

--- ## Defined globals
--- These values are valid throughout every script that is importing `PGStoryMode.lua`. Changing them is not advised without a specific reason.
--- This assignment turns pooling off for every script that requires `PGStoryMode.lua`, directly or indirectly, so its globals never carry over to another plot or object; see Story plot scripts.

--- Engine-set globals the library resets in its definitions (declared by the engine API):
--- `ScriptPoolCount`

--- Functions

--- Initialises the story mode. It is a wrapper around the `Define_State(...)` function that ensures a valid setup for story scripts. It will use the `StoryModeEvents` table that has to be defined in every story script to initialise valid states.
--- It is called from `Base_Definitions()` of `PGStateMachine.lua`, after `Definitions()`, so `StoryModeEvents` has to be set in `Definitions()`. It first defines `PG_Story_State_Init` as the initial state, then one state per `StoryModeEvents` entry, keyed by the event name. A missing `StoryModeEvents` table is skipped; an entry that is not a function produces a message box.
function PG_Story_Mode_Init() end

--- Advances the story state if a given event has been triggered. The engine calls this function by name to pass a story event to the script. If `StoryModeEvents[name]` is a function and no other transition is pending, the state machine's next state becomes `name`; a trigger that arrives while another transition is still pending is dropped.
---@param name string The story event name.
function Story_Event_Trigger(name) end

--- The initial state of every story script. It only writes a debug message on `OnEnter` and otherwise does nothing; the script stays in this state until a new state is set, normally by `Story_Event_Trigger(...)`.
---@param message? number The state machine's message: `OnEnter`, `OnUpdate` or `OnExit` (PGStateMachine calls every state function with one of the three).
function PG_Story_State_Init(message) end
