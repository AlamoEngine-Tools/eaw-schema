---@meta
--- Globals a host maps into a script before it runs, measured per host on the game's own binary.
--- Every kind of script gets Script and LUA_PATH (declared with the engine API); the rest depend
--- on what owns the script. Declared together because one meta file cannot be scoped to a
--- directory; which kind a file is remains the server's own classification.

-- object scripts (a GameObjectType's Lua_Script)

--- The game object the script belongs to.
---@type GameObject
Object = nil

-- every script state

--- The one metatable shared by every wrapper userdata of the state, created by the engine when
--- it maps the first value in and stored under this name. Engine-owned; scripts never read it.
---@type table
LuaWrapperMetaTable = nil

-- free-store scripts: FreeStore is declared with the engine API (a FreeStore wrapper)

-- plan scripts (AI goal plans), evaluators and free-store scripts

--- The AI player the plan, evaluator or free store runs for.
---@type Player
PlayerObject = nil

--- The goal's object; nil when the goal has no object.
---@type GameObject|nil
Target = nil

--- The goal's target as the AI sees it.
---@type AITargetLocation
AITarget = nil

--- The plan's budget; resources are drawn through it.
---@type Budget
Budget = nil

--- Plan events reach a plan through functions it defines, not through a global: for each of the
--- engine's plan events the plan looks up <TaskForceName>_<Event>, then Default_<Event>.

-- scripts the engine services on a timer

--- Seconds between two service calls; a script may set its own rate.
---@type number
ServiceRate = nil

--- The game time of the last service call, written back by the engine.
---@type number
LastService = nil

--- The game time of the last unit-service call of a free-store script.
---@type number
LastUnitService = nil

-- plan definition load

--- True while the plan definition manager loads the file to read its definition globals.
---@type boolean
PlanDefinitionLoad = nil
