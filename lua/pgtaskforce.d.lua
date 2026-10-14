---@meta
--- PGTaskForce.lua, the vanilla library (Data/Scripts/Library/PGTaskForce.lua). Hand-maintained; the prose was
--- migrated from the documentation site's library page on 2026-10-14; a type the page did not
--- give was inferred from how the library source uses the value (tools/docsync/infer_types.py),
--- and `any` is one the source does not settle. Every name here is a
--- global the library defines when a script requires it.
--- Requires: PGAICommands.

--- Functions

--- Not documented on the site; see the library source.
---@param _target AITargetLocation|GameObject
---@param taskforce TaskForce
---@return AITargetLocation|GameObject
function FindStageArea(_target, taskforce) end

--- Not documented on the site; see the library source.
---@param taskforce TaskForce
---@param stage_at_strongest_space any
function AssembleForce(taskforce, stage_at_strongest_space) end

--- Not documented on the site; see the library source.
---@param taskforce TaskForce
---@param stage_at_strongest_space any
function SynchronizedAssemble(taskforce, stage_at_strongest_space) end

--- Not documented on the site; see the library source.
---@param taskforce GameObject|TaskForce
---@param planet string
function WaitMoveForce(taskforce, planet) end

--- Not documented on the site; see the library source.
---@param taskforce TaskForce
function LandUnits(taskforce) end

--- Not documented on the site; see the library source.
---@param taskforce TaskForce
---@return boolean
function LaunchUnits(taskforce) end

--- Not documented on the site; see the library source.
---@param taskforce TaskForce
---@return boolean
function Invade(taskforce) end

--- Not documented on the site; see the library source.
---@param player Player
---@param target AITargetLocation|GameObject
function FundBases(player, target) end

--- Generally follow the task force we're escorting and attack it's attackers.
--- Conservative style will avoid confrontation with non fighters/bombers
---@param taskforce GameObject|TaskForce
---@param target AITargetLocation|GameObject|TaskForce
---@param conservative_style boolean
function Escort(taskforce, target, conservative_style) end

--- Does any member of the given task force have an attack target?
---@param tf TaskForce
---@return boolean
function Tf_Has_Attack_Target(tf) end

--- Not documented on the site; see the library source.
---@param tf GameObject|TaskForce
---@param enemy GameObject
function Weave(tf, enemy) end

--- Not documented on the site; see the library source.
---@param taskforce TaskForce
---@param target any
function WaitForAllReinforcements(taskforce, target) end

--- Keep a task force from being idle
--- expects lib_tf_to_anti_idle and lib_enemy_to_avoid to be defined before use
function Anti_Idle_Taskforce() end

--- Try to get units on the map in the most reasonable manner.
--- Passing an escort_force is optional
---@param player any
---@param target any
---@param tf_to_reinforce TaskForce
---@param second_try_tf TaskForce
function QuickReinforce(player, target, tf_to_reinforce, second_try_tf) end

--- Not documented on the site; see the library source.
---@param tf GameObject|TaskForce
---@param priority_set_type string
function SetClassPriorities(tf, priority_set_type) end

--- Move task force to asteroids or nebulae if within range and the asteroids aren't near an enemy
--- Returns true if the task force is already obscured or this function obscured it
---@param tf TaskForce
---@param range number
---@param use_nebulae boolean
---@param path_through_fields string
---@return boolean
function Obscure(tf, range, use_nebulae, path_through_fields) end

--- Fix the unit or hide if appropriate.
--- Return true if the unit was fixed.
---@param unit GameObject
---@return boolean
function ConsiderHeal(unit) end

--- Fix the unit or hide if appropriate.
--- Return true if the unit was fixed.
---@param unit GameObject
---@return boolean
function ConsiderRepair(unit) end

--- Note, this is safe for event response (because it doesn't block)
---@param tf TaskForce
---@param unit GameObject
---@return boolean
function Release_To_Hide(tf, unit) end

--- This is for some give and take pacing.  The AI is allowed to attack without difficulty-based pause
--- 1 to N times, then it must wait for the player to win 1 to N times before attacking without pause.
---@param difficulty string
---@param ai_territories_just_gained number
---@return boolean
function GalacticAttackAllowed(difficulty, ai_territories_just_gained) end

--- Not documented on the site; see the library source.
---@param difficulty string
function DifficultyBasedMinPause(difficulty) end

--- Not documented on the site; see the library source.
---@param player Player
---@param value_name string
function GetGlobalValueOrZero(player, value_name) end
