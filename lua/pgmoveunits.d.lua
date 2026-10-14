---@meta
--- PGMoveUnits.lua, the vanilla library (Data/Scripts/Library/PGMoveUnits.lua). Hand-maintained; the prose was
--- migrated from the documentation site's library page on 2026-10-14; a type the page did not
--- give was inferred from how the library source uses the value (tools/docsync/infer_types.py),
--- and `any` is one the source does not settle. Every name here is a
--- global the library defines when a script requires it.
--- Requires: PGBaseDefinitions.

--- Functions

--- This will move an entire unit list with simultaneous orders.
--- They will block as a whole and pass when the last unit's move is complete.
---@param unit_list table The list of units.
---@param target GameObject|Position|AITargetLocation The movement target location.
function Formation_Move(unit_list, target) end

--- This will order an entire unit list to attack a target simultaneously.
--- They will block as a whole and pass when the last unit's attack is complete.
--- When `unit_list` is a single object rather than a table, the function issues `Attack_Move(target)` instead of an attack order.
---@param unit_list table The list of units.
---@param target GameObject The attack target.
function Formation_Attack(unit_list, target) end

--- This will order an entire unit list to perform an attack move towards a target location simultaneously.
--- They will block as a whole and pass when the last unit's move is complete.
---@param unit_list table The list of units.
---@param target GameObject|Position|AITargetLocation The movement target location.
function Formation_Attack_Move(unit_list, target) end

--- This will order an entire unit list to guard a target location.
--- They will block as a whole and pass when the last unit's guard move is complete.
---@param unit_list table The list of units.
---@param target GameObject The target to defend.
function Formation_Guard(unit_list, target) end
