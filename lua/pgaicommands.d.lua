---@meta
--- PGAICommands.lua, the vanilla library (Data/Scripts/Library/PGAICommands.lua). Hand-maintained; the prose was
--- migrated from the documentation site's library page on 2026-10-14; a type the page did not
--- give was inferred from how the library source uses the value (tools/docsync/infer_types.py),
--- and `any` is one the source does not settle. Every name here is a
--- global the library defines when a script requires it.
--- Requires: PGCommands.

--- Engine-set globals the library resets in its definitions (declared by the engine API):
--- `PlanDefinitionLoad`

--- Globals the library assigns (at load time or in its definitions function)

--- Assigned `false` by the library.
---@type boolean
InSpaceConflict = nil

--- Assigned `false` by the library.
---@type boolean
MagicPlan = nil

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

--- Assigned `{}` by the library.
---@type table
lib_cancelled_abilities = nil

--- Functions

--- Declares several AI related variables and calls additional setup functionality. Replaces the `Base_Definitions()` of `PGBaseDefinitions.lua`. In order it sets `InSpaceConflict`, `MagicPlan`, `MinContrastScale`, `MaxContrastScale`, `PerFailureContrastAdjust` and the contrast tables, calls `Common_Base_Definitions()`, sets every global named in the plan's `TaskForce` table to `nil`, calls `Set_Contrast_Values()` only while the engine is loading the plan definition (the global `PlanDefinitionLoad` is set), clears `PlanDefinitionLoad`, and finally calls `Definitions()` if present.
--- Calls `Common_Base_Definitions`, sets some AI plan variables, resets taskforce variables and calls `Definitions` if it exists. See `Base_Definitions()` for when it calls `Set_Contrast_Values`.
function Base_Definitions() end

--- Sets the AI contrast value by category types. A change to the game's categories or to how categories affect each other requires a matching update of this function.
--- The contrast describes how a unit of a given category approaches units of other categories, and how many objects of a given category the AI should bring along to encounter an object of a given category.
--- The weights differ between the EaW and FoC copies of the library for the enemy categories `Corvette`, `Frigate` and `Capital`.
--- Tells the AI how effective unit categories are against others.
function Set_Contrast_Values() end
