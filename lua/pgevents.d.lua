---@meta
--- PGEvents.lua, the vanilla library (Data/Scripts/Library/PGEvents.lua). Hand-maintained; the prose was
--- migrated from the documentation site's library page on 2026-10-14; a type the page did not
--- give was inferred from how the library source uses the value (tools/docsync/infer_types.py),
--- and `any` is one the source does not settle. Every name here is a
--- global the library defines when a script requires it.
--- Requires: PGTaskForce.

--- Functions

--- Not documented on the site; see the library source.
---@param tf TaskForce
---@param unit GameObject
---@param healer GameObject
---@param release? any
function GoHeal(tf, unit, healer, release) end

--- Not documented on the site; see the library source.
---@param tf TaskForce
---@param unit GameObject
---@param kite_pos GameObject
---@param release? boolean
function GoKite(tf, unit, kite_pos, release) end

--- Not documented on the site; see the library source.
---@param tf TaskForce
---@param unit GameObject
---@return boolean
function Try_Good_Ground(tf, unit) end

--- This should be useful for getting units within the minimum attack range
--- or outside the maximum attack range on opponents who behave like artillery
---@param tf TaskForce
---@param unit AITargetLocation|GameObject|TaskForce
---@return boolean
function Respond_To_MinRange_Attacks(tf, unit) end

--- Not documented on the site; see the library source.
---@param unit_type any
---@param type_name_list table
---@return boolean
function Is_Type_In_List(unit_type, type_name_list) end

--- Check if the passed ability is one of the type that the AI wants to turn back on when cancelled
---@param ability? any
---@return boolean
function IsAbilityAllowedToRecover(ability) end

--- Not documented on the site; see the library source.
function Default_Space_Conflict_Begin() end

--- Not documented on the site; see the library source.
function Default_Space_Conflict_End() end

--- Not documented on the site; see the library source.
function Default_Unit_Destroyed() end

--- Not documented on the site; see the library source.
---@param tf TaskForce
---@param unit GameObject
---@param attacker GameObject
---@param deliberate? any
function Default_Unit_Damaged(tf, unit, attacker, deliberate) end

--- Not documented on the site; see the library source.
function Default_Original_Target_Destroyed() end

--- Not documented on the site; see the library source.
---@param tf GameObject|TaskForce
function Default_Current_Target_Destroyed(tf) end

--- Not documented on the site; see the library source.
---@param tf TaskForce
---@param old_player any
---@param new_player any
function Default_Original_Target_Owner_Changed(tf, old_player, new_player) end

--- Not documented on the site; see the library source.
---@param tf TaskForce
---@param unit GameObject
function Default_Unit_Move_Finished(tf, unit) end

--- Not documented on the site; see the library source.
---@param unit GameObject
---@param target GameObject
---@return boolean
function Should_Crush(unit, target) end

--- Not documented on the site; see the library source.
---@param tf TaskForce
---@param unit GameObject
---@param target GameObject
function Default_Target_In_Range(tf, unit, target) end

--- Not documented on the site; see the library source.
---@param tf TaskForce
---@param unit GameObject
---@param target GameObject
function Default_Hardpoint_Target_In_Range(tf, unit, target) end

--- Not documented on the site; see the library source.
function Default_No_Units_Remaining() end

--- Not documented on the site; see the library source.
---@param tf TaskForce
---@param unit GameObject|TaskForce
function Default_Unit_Diversion_Finished(tf, unit) end

--- This fires if the countdown was going and it is now refreshed or if you come out of a nebula
---@param tf TaskForce
---@param unit GameObject|TaskForce
---@param ability any
function Default_Unit_Ability_Ready(tf, unit, ability) end

--- An ability was interrupted before naturally finishing.
---@param tf TaskForce
---@param unit any
---@param ability any
function Default_Unit_Ability_Cancelled(tf, unit, ability) end

--- An ability finished naturally by its duration running out or by being turned off.
---@param tf TaskForce
---@param unit GameObject
function Default_Unit_Ability_Finished(tf, unit) end
