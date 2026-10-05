---@meta
--- Globals a host maps into a script before it runs, measured per host on the game's own binary.
--- Every kind of script gets Script and LUA_PATH (declared with the engine API); the rest depend
--- on what owns the script. Declared together because one meta file cannot be scoped to a
--- directory; which kind a file is remains the server's own classification.

-- ── object scripts (a GameObjectType's Lua_Script) ───────────────────────────

--- The game object the script belongs to.
---@type GameObject
Object = nil

-- ── free-store scripts ───────────────────────────────────────────────────────

--- The AI free store the script services.
---@type any
FreeStore = nil

-- ── plan scripts (AI goal plans), evaluators and free-store scripts ──────────

--- The AI player the plan, evaluator or free store runs for.
---@type Player
PlayerObject = nil

--- The plan's target as a game object or location; set by the planning system.
---@type GameObject|AITargetLocation
Target = nil

--- The plan's target as the AI sees it.
---@type AITargetLocation
AITarget = nil

--- The plan's budget; resources are drawn through it.
---@type Budget
Budget = nil

--- The planning system's event manager for the plan.
---@type any
EventManager = nil

-- ── scripts the engine services on a timer ───────────────────────────────────

--- Seconds between two service calls; a script may set its own rate.
---@type number
ServiceRate = nil

--- The game time of the last service call, written back by the engine.
---@type number
LastService = nil

--- The game time of the last unit-service call of a free-store script.
---@type number
LastUnitService = nil

-- ── plan definition load ─────────────────────────────────────────────────────

--- True while the plan definition manager loads the file to read its definition globals.
---@type boolean
PlanDefinitionLoad = nil
