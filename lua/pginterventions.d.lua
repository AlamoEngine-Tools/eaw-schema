---@meta
--- PGInterventions.lua, the vanilla library (Data/Scripts/Library/PGInterventions.lua). Hand-maintained; the prose was
--- migrated from the documentation site's library page on 2026-10-14; a type the page did not
--- give was inferred from how the library source uses the value (tools/docsync/infer_types.py),
--- and `any` is one the source does not settle. Every name here is a
--- global the library defines when a script requires it.
--- Requires: PGBaseDefinitions.

--- Engine-set globals the library resets in its definitions (declared by the engine API):
--- `TaskForce`

--- Globals the library assigns (at load time or in its definitions function)

--- Assigned `GetCurrentTime()` by the library.
---@type number
StartTime = nil

--- Assigned `120.0` by the library.
---@type number
InterventionExclusionPeriod = nil

--- Assigned `1.1` by the library.
---@type number
MinContrastScale = nil

--- Assigned `1.5` by the library.
---@type number
MaxContrastScale = nil

--- Assigned `0.1` by the library.
---@type number
PerFailureContrastAdjust = nil

--- Assigned `{}` by the library.
---@type table
EnemyContrastTypes = nil

--- Assigned `{}` by the library.
---@type table
FriendlyContrastTypes = nil

--- Assigned `{}` by the library.
---@type table
ContrastTypeScale = nil

--- Functions

--- Not documented on the site; see the library source.
function Definitions() end

--- Not documented on the site; see the library source.
---@param flag_name string
---@param location AITargetLocation|GameObject
function Wait_On_Flag(flag_name, location) end

--- Not documented on the site; see the library source.
function Begin_Intervention() end

--- Not documented on the site; see the library source.
function End_Intervention() end

--- Not documented on the site; see the library source.
---@param reward_table table
---@param player Player
---@param min_value number
---@return GameObjectType?
---@return number?
function Select_Reward_Unit(reward_table, player, min_value) end
