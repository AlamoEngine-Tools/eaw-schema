---@meta
--- Alamo engine Lua API, Forces of Corruption, October 2024 release (generated 2026-10-04).
--- Generated from the engine's own bindings: argument counts, types and returns are what each
--- binding checks, casts and constructs. Lua 5.0 dialect: the engine opens base (which registers
--- the coroutine table: create, wrap, resume, yield, status), string, table and its own `security`
--- library; no math, io, os or debug table exists.

--- Engine global functions (registered into every script state)

--- argument count checked against 3.
---@param p1 Player
---@param p2 GameObjectType|string
---@param p3 GameObject
---@return GameObjectType
function _ProduceObject(p1, p2, p3) end

--- argument count checked against 0.
---@param p1 string
---@return GameObject
function FindPlanet(p1) end

--- arguments handled by a helper the binding calls; types not measured here.
---@vararg any
---@return AITargetLocation|GameObject
function FindTarget(...) end

--- no parameters.
function BlockForever() end

---@param player Player
---@param p2 AITargetLocation|GameObject
---@param p3 TaskForce
---@return AITargetLocation|GameObject
function _FindStageArea(player, p2, p3) end

--- arity: 2.
---@param p1 string
---@param player Player
---@param p3 AITargetLocation|GameObject
---@return number
function EvaluatePerception(p1, player, p3) end

--- arity: 4.
---@param player Player
---@param p2 string
---@param p3 AITargetLocation|GameObject
---@param time_limit number
---@param p5 number
function GiveDesireBonus(player, p2, p3, time_limit, p5) end

--- arity: 1.
---@param p1 GameObject
---@return GameObjectType
function GetNextStarbaseType(p1) end

--- arity: 1.
---@param p1 GameObject
---@return GameObjectType
function GetNextGroundbaseType(p1) end

--- argument count checked against 2.
---@param planet_game GameObject
---@param base_level number
function WaitForGroundbase(planet_game, base_level) end

--- argument count checked against 2.
---@param planet_game GameObject
---@param base_level number
function WaitForStarbase(planet_game, base_level) end

--- arity: 3.
---@param p1 Player
---@param p2 AITargetLocation
function EvaluateTypeList(p1, p2) end

--- Binding body not measured.
function WeightedTypeList() end

--- arity: 1.
---@param p1 TaskForce|AITargetLocation|GameObject
---@param p2 number
---@param player Player
---@return GameObject
function FindDeadlyEnemy(p1, p2, player) end

--- argument count checked against 0.
---@param p1 string
---@return GameObject
function Find_First_Object(p1) end

--- arity: 1.
---@param player Player
function Purge_Goals(player) end

--- arity: 3.
---@param player Player
---@param p2 GameObject|AITargetLocation|Player|table
---@param p3 number
function Apply_Markup(player, p2, p3) end

--- Galactic only.
--- arity: 3.
---@param player Player
---@param p2 AITargetLocation|GameObject
---@param p3 AITargetLocation|GameObject
---@return GameObject
function Find_Path(player, p2, p3) end

--- arity: 1.
---@param param1 string
---@param game GameObject
function Story_Event(param1, game) end

--- Tactical only.
--- arity: 2.
---@param p1 string
---@param player Player
---@return number
function Evaluate_In_Galactic_Context(p1, player) end

--- no parameters.
---@return boolean
function Is_Campaign_Game() end

--- Tactical only.
--- argument count checked against 0, 1, 4.
---@param game GameObject|AITargetLocation|TaskForce
---@param find_object_name string
---@vararg Player|boolean
---@return GameObject
function Find_Nearest(game, find_object_name, ...) end

--- Tactical only.
--- arity: 2.
---@param p1 AITargetLocation
---@param player Player
---@return Position
function Get_Most_Defended_Position(p1, player) end

--- arity: 2.
---@param game GameObject
---@return Position
function Project_By_Unit_Range(game) end

--- argument count checked against 3, 4.
---@param p1 GameObjectType
---@param p2 boolean
---@param p3 Player
---@param p4 boolean
---@param p5 boolean
function Reinforce_Unit(p1, p2, p3, p4, p5) end

--- argument count checked against 0.
---@param find_object_name string
---@return GameObjectType
function Find_Object_Type(find_object_name) end

--- argument count checked against 3.
---@param p1 GameObjectType
---@param p2 any
---@param p3 Player
---@return GameObject
function Spawn_Unit(p1, p2, p3) end

--- argument count checked against 0, 1.
---@param find_object_name GameObjectType|string
---@param p2 string
---@return GameObject
function Find_Hint(find_object_name, p2) end

--- argument count checked against 0.
--- reads its arguments; types not measurable from the binding.
function Point_Camera_At() end

--- arity: 1.
---@param p1 string
---@return StoryPlot
function Get_Story_Plot(p1) end

--- argument count checked against 4.
---@param player Player
---@param target string
---@param p3 GameObject|AITargetLocation
---@param p4 boolean
---@return boolean
function Check_Story_Flag(player, target, p3, p4) end

--- no parameters.
function Activate_Retry_Dialog() end

--- arity: 1.
---@param get_unicode_string string
function Game_Message(get_unicode_string) end

--- Binding body not measured.
function DiscreteDistribution() end

--- arity: 2.
---@param p1 GameObject
---@param p2 GameObject
---@param player Player
---@param friendly boolean
---@return boolean
function Are_On_Opposite_Sides_Of_Shield(p1, p2, player, friendly) end

--- no parameters.
function Fade_On() end

--- no parameters.
function Fade_Off() end

--- no parameters.
function Letter_Box_On() end

--- no parameters.
function Letter_Box_Off() end

--- argument count checked against 0.
---@param time number
function Letter_Box_In(time) end

--- argument count checked against 0.
---@param time number
function Letter_Box_Out(time) end

--- argument count checked against 0.
---@param time number
function Fade_Screen_In(time) end

--- argument count checked against 0.
---@param time number
function Fade_Screen_Out(time) end

--- argument count checked against 0, 1.
---@param p1 any
---@param p2 GameObject
function Scroll_Camera_To(p1, p2) end

--- argument count checked against 0, 1.
---@param p1 GameObject
---@param immediate number
function Camera_To_Follow(p1, immediate) end

--- argument count checked against 2.
---@param delta number
---@param immediate number
function Zoom_Camera(delta, immediate) end

--- argument count checked against 2.
---@param angle number
---@param time number
function Rotate_Camera_By(angle, time) end

--- argument count checked against 2.
---@param angle number
---@param time number
---@param shortest number
function Rotate_Camera_To(angle, time, shortest) end

--- argument count checked against 0.
---@param state number
function Lock_Controls(state) end

--- argument count checked against 0.
---@param state number
function Suspend_AI(state) end

--- argument count checked against 0.
---@vararg string|GameObjectType|Player
---@return GameObject
function Find_All_Objects_Of_Type(...) end

--- arity: 1.
---@param p1 string
---@return Player
function Find_Player(p1) end

--- arguments handled by a helper the binding calls; types not measured here.
---@vararg any
---@return boolean
function Is_Point_In_Nebula(...) end

--- arguments handled by a helper the binding calls; types not measured here.
---@vararg any
---@return boolean
function Is_Point_In_Ion_Storm(...) end

--- arguments handled by a helper the binding calls; types not measured here.
---@vararg any
---@return boolean
function Is_Point_In_Asteroid_Field(...) end

--- no parameters.
function FogOfWar() end

--- arity: 3.
---@param effect_name string
function Play_Lightning_Effect(effect_name) end

--- arity: 1.
---@param lua_units table
---@return GameObject
function Assemble_Fleet(lua_units) end

--- arity: 1.
---@param p1 string
---@return GameObject
function Find_All_Objects_With_Hint(p1) end

--- argument count checked against 0.
---@param resume_sound boolean
function Start_Cinematic_Camera(resume_sound) end

--- no parameters.
function End_Cinematic_Camera() end

--- arity: 8.
---@param p1 any
---@param x_dist number
---@param y_pitch number
---@param z_yaw number
---@param euler number
---@param p6 GameObject
---@param use_object_rotation number
---@param cinematic_animation number
function Set_Cinematic_Target_Key(p1, x_dist, y_pitch, z_yaw, euler, p6, use_object_rotation, cinematic_animation) end

--- arity: 9.
---@param p1 any
---@param time number
---@param x_dist number
---@param y_pitch number
---@param z_yaw number
---@param euler number
---@param p7 GameObject
---@param use_object_rotation number
---@param cinematic_animation number
function Transition_Cinematic_Target_Key(p1, time, x_dist, y_pitch, z_yaw, euler, p7, use_object_rotation, cinematic_animation) end

--- arity: 8.
---@param p1 any
---@param x_dist number
---@param y_pitch number
---@param z_yaw number
---@param euler number
---@param p6 GameObject
---@param use_object_rotation number
---@param cinematic_animation number
function Set_Cinematic_Camera_Key(p1, x_dist, y_pitch, z_yaw, euler, p6, use_object_rotation, cinematic_animation) end

--- arity: 9.
---@param p1 any
---@param time number
---@param x_dist number
---@param y_pitch number
---@param z_yaw number
---@param euler number
---@param p7 GameObject
---@param use_object_rotation number
---@param cinematic_animation number
function Transition_Cinematic_Camera_Key(p1, time, x_dist, y_pitch, z_yaw, euler, p7, use_object_rotation, cinematic_animation) end

--- argument count checked against 0.
---@param time number
function Transition_To_Tactical_Camera(time) end

--- argument count checked against 2.
---@param time number
---@param dist number
function Cinematic_Zoom(time, dist) end

--- arity: 8.
---@param shuttle_type_name string
---@param player_id number
---@param p3 any
---@param zangle number
---@param mode number
---@param delta number
---@param idle_time number
---@param persist number
---@param p9 string
---@return GameObject
function Create_Cinematic_Transport(shuttle_type_name, player_id, p3, zangle, mode, delta, idle_time, persist, p9) end

--- argument count checked against 2.
---@param gameobject_pointer GameObject
---@param hide number
function Hide_Object(gameobject_pointer, hide) end

--- argument count checked against 3.
---@param gameobject_pointer GameObject
---@param hide number
---@param sub_object_name string
function Hide_Sub_Object(gameobject_pointer, hide, sub_object_name) end

--- arity: 1.
---@param p1 any
---@param p2 string
---@return GameObject
function Find_Nearest_Space_Field(p1, p2) end

--- argument count checked against 0.
---@param state boolean
function Enable_Fog(state) end

--- argument count checked against 0.
---@param gameobject GameObject
function Promote_To_Space_Cinematic_Layer(gameobject) end

--- argument count checked against 0.
---@param name string
function Play_Bink_Movie(name) end

--- no parameters.
function Stop_Bink_Movie() end

--- arity: 1.
---@param music_mode string
function Play_Music(music_mode) end

--- no parameters.
function Stop_All_Music() end

--- no parameters.
function Resume_Mode_Based_Music() end

--- no parameters.
function Force_Weather() end

--- arity: 1; 2.
---@param planet GameObject
---@param string string
function Add_Radar_Blip(planet, string) end

--- arity: 1.
---@param planet GameObject|string
function Remove_Radar_Blip(planet) end

--- arity: 2.
---@param game GameObject
---@param tag string
function Add_Planet_Highlight(game, tag) end

--- arity: 1.
---@param tag string
function Remove_Planet_Highlight(tag) end

--- no parameters.
function Resume_Hyperspace_In() end

--- no parameters.
function Stop_All_Speech() end

--- no parameters.
function Remove_All_Text() end

--- argument count checked against 0.
---@param system_allowing boolean
function Allow_Localized_SFX(system_allowing) end

--- no parameters.
function Master_Volume_Restore() end

--- no parameters.
function Get_Game_Mode() end

--- argument count checked against 0.
---@param enabled boolean
function Set_Cinematic_Environment(enabled) end

--- argument count checked against 0.
---@param p1 number
function Set_New_Environment(p1) end

--- no parameters.
function Start_Cinematic_Mode() end

--- no parameters.
function End_Cinematic_Mode() end

--- arity: 3.
---@param find_object_name string|GameObjectType
---@param p2 any
---@param player Player
---@return GameObject
function Create_Generic_Object(find_object_name, p2, player) end

--- argument count checked against 0.
---@param p1 boolean
function Weather_Audio_Pause(p1) end

--- argument count checked against 0, 1.
---@param id number
---@param delay_time number
function Start_Cinematic_Space_Retreat(id, delay_time) end

--- no parameters.
function Do_End_Cinematic_Cleanup() end

--- arity: 2.
---@param p1 table
---@param p2 number
---@return Position|number
function Find_Best_Local_Threat_Center(p1, p2) end

--- no parameters.
function SFXManager() end

--- arity: 2.
---@param display_text string
---@param index boolean
function Add_Objective(display_text, index) end

--- no parameters.
---@return boolean
function Is_Multiplayer_Mode() end

--- no parameters.
function Cancel_Fast_Forward() end

--- no parameters.
---@return number
function GetCurrentTime() end

--- argument count checked against 0, 1.
---@param high number
---@param p2 number
---@return number
function GameRandom(high, p2) end

--- arity: 3.
---@param p1 GameObjectType
---@param p2 any
---@param p3 Player
---@return GameObject
function Spawn_From_Reinforcement_Pool(p1, p2, p3) end

--- arity: 2.
---@param find_object_name string
---@param player Player
---@return GameObject
function Spawn_Special_Weapon(find_object_name, player) end

--- arity: 1.
---@param environment boolean
function Enable_Distance_Fog(environment) end

--- arity: 3.
---@param that number
---@param p2 number
---@param p3 number
---@return Position
function Create_Position(that, p2, p3) end

--- arity: 2.
---@param id string
---@param p2 boolean
function GUI_Component_Visibility(id, p2) end

--- arity: 2.
---@param id string
---@param p2 boolean
function GUI_Component_Enable(id, p2) end

--- arity: 2.
---@param id string
---@param text_identifier string
function GUI_Component_Text(id, text_identifier) end

--- arity: 4.
---@param id string
---@param animation_name string
---@param anim_subindex number
---@param is_looping boolean
function GUI_Component_Play_Anim(id, animation_name, anim_subindex, is_looping) end

--- arity: 1.
---@param id string
function GUI_Component_Stop_Anim(id) end

--- arity: 5.
---@param id string
---@param red number
---@param green number
---@param blue number
---@param alpha number
function GUI_Component_Color(id, red, green, blue, alpha) end

--- arity: 4.
---@param id string
---@param p2 boolean
---@param p3 boolean
---@param p4 boolean
function GUI_Component_Blink(id, p2, p3, p4) end

--- arity: 4.
---@param id string
---@param p2 boolean
---@param p3 number
---@param p4 number
function GUI_Component_Flash(id, p2, p3, p4) end

--- arity: 1.
---@param id string
function GUI_Component_Stop_Flash(id) end

--- arity: 5.
---@param id string
---@param red number
---@param green number
---@param blue number
---@param alpha number
function GUI_Text_Color(id, red, green, blue, alpha) end

--- arity: 6.
---@param id string
---@param p2 string
---@param red number
---@param green number
---@param blue number
---@param alpha number
function GUI_Button_Icon(id, p2, red, green, blue, alpha) end

--- Utility commands (registered into every script state)

--- Starts a coroutine for a function value or the name of a global function; one resume per service tick.
---@param fn function|string
---@vararg any
---@return thread
function Create_Thread(fn, ...) end

--- Same as Create_Thread.
---@param fn function|string
---@vararg any
---@return thread
function Thread(fn, ...) end

--- Per-thread key-value store; ThreadValue.Set(key, value) writes.
---@param key string
---@return any
function ThreadValue(key) end

--- Process-wide key-value store shared by every script; GlobalValue.Set(key, value) writes.
---@param key string
---@return any
function GlobalValue(key) end

--- The current thread's id.
---@return number
function GetThreadID() end

--- Pops the next queued event for this script; nil when none. GetEvent.Params(...) reads its parameters.
---@return any
function GetEvent() end

---@param a string
---@param b string
---@return number
function StringCompare(a, b) end

--- Writes the Lua call stack to the AI log.
function DumpCallStack() end

--- Sets the script's exit flag; no thread is pumped afterwards.
function _ScriptExit() end

---@param fmt string
---@vararg any
function _ScriptMessage(fmt, ...) end

--- Engine spelling.
---@param fmt string
---@vararg any
function _OuputDebug(fmt, ...) end

function _DebugBreak() end

---@param fmt string
---@vararg any
function _MessagePopup(fmt, ...) end

---@param fmt string
---@vararg any
function _CustomScriptMessage(fmt, ...) end

--- The `security` library

---@class securitylib
---@field crcstate fun(...): any
---@field crc fun(...): any
---@field dumpstrtable fun(...): any
---@field md5 fun(...): any
security = {}

--- Globals every script state has

---@type Script
Script = nil
---@type string
LUA_PATH = nil

---@class GameObject
GameObject = {}

--- Binding body not measured.
function GameObject.Release() end

--- no parameters.
---@return boolean
function GameObject.Is_Transport() end

--- Tactical only.
--- no parameters.
---@return number
function GameObject.Get_Hull() end

--- Tactical only.
--- no parameters.
---@return number
function GameObject.Get_Health() end

--- Tactical only.
--- no parameters.
---@return number
function GameObject.Get_Shield() end

--- Tactical only.
--- no parameters.
---@return number
function GameObject.Get_Energy() end

--- arity: 1.
---@param p1 string
---@return boolean
function GameObject.Is_Category(p1) end

--- no parameters.
---@return number
function GameObject.Get_Object_ID() end

--- no parameters.
function GameObject.Get_Parent_Object() end

--- no parameters.
function GameObject.Get_Parent_Mode_Object() end

--- no parameters.
---@return number
function GameObject.Get_Parent_Mode_Object_ID() end

--- Tactical only.
--- arity: %d; at least 1.
---@param p1 table
---@vararg AITargetLocation|GameObject
function GameObject.Attack_Target(p1, ...) end

--- no parameters.
---@return boolean
function GameObject.Is_Valid() end

--- no parameters.
---@return GameObjectType
function GameObject.Get_Type() end

--- no parameters.
---@return GameObjectType
function GameObject.Get_Game_Scoring_Type() end

--- argument count checked against 0.
---@param p1 boolean
function GameObject.Set_Prefer_Ground_Over_Space(p1) end

--- arity: 1.
---@param p1 string
function GameObject.Set_Targeting_Priorities(p1) end

--- arity: 1.
---@param seconds number
function GameObject.Set_Targeting_Stickiness_Time_Threshold(seconds) end

--- no parameters.
---@return number
function GameObject.Get_Time_Till_Dead() end

--- no parameters.
---@return number
function GameObject.Get_Rate_Of_Damage_Taken() end

--- arguments handled by a helper the binding calls; types not measured here.
---@vararg any
function GameObject.Move_To(...) end

--- arguments handled by a helper the binding calls; types not measured here.
---@vararg any
function GameObject.Guard_Target(...) end

--- arguments handled by a helper the binding calls; types not measured here.
---@vararg any
function GameObject.Attack_Move(...) end

--- arity: 2.
---@param p1 AITargetLocation|GameObject
---@param player Player
function GameObject.Fire_Special_Weapon(p1, player) end

--- no parameters.
---@return boolean
function GameObject.Contains_Hero() end

--- no parameters.
function GameObject.Get_Contained_Heroes() end

--- no parameters.
---@return boolean
function GameObject.Are_Engines_Online() end

--- argument count checked against 1.
--- reads its arguments; types not measurable from the binding.
---@return number
function GameObject.Get_Distance() end

--- no parameters.
function GameObject.Get_Build_Pad_Contents() end

--- no parameters.
function GameObject.Sell() end

--- no parameters.
---@return Player
function GameObject.Get_Owner() end

--- no parameters.
---@return number
function GameObject.Get_Starbase_Level() end

--- no parameters.
---@return Player
function GameObject.Get_Final_Blow_Player() end

--- no parameters.
function GameObject.Lock_Current_Orders() end

--- argument count checked against 2, 3.
---@param p1 any
---@param p2 number
---@param p3 GameObjectType|Player
---@param p4 GameObjectType|Player
---@return boolean
function GameObject.Event_Object_In_Range(p1, p2, p3, p4) end

--- Binding body not measured.
function GameObject.Service_Wrapper() end

--- argument count checked against 0.
--- reads its arguments; types not measurable from the binding.
function GameObject.Cancel_Event_Object_In_Range() end

--- no parameters.
function GameObject.Get_Position() end

--- argument count checked against 0.
---@param p1 boolean
function GameObject.Prevent_AI_Usage(p1) end

--- arity: 1.
---@param importance number
function GameObject.Set_Importance(importance) end

--- arity: 1.
---@param original_damage_amount number
---@param hard_point_data_name string
function GameObject.Take_Damage(original_damage_amount, hard_point_data_name) end

--- no parameters.
function GameObject.Despawn() end

--- no parameters.
function GameObject.Mark_Parent_Mode_Object_For_Death() end

--- arity: 1.
---@param p1 boolean
function GameObject.Set_Selectable(p1) end

--- no parameters.
---@return GameObjectType
function GameObject.Get_Next_Starbase_Type() end

--- arity: 1.
---@param p1 Player
function GameObject.Change_Owner(p1) end

--- arity: 1.
---@param p1 any
---@param p2 number
---@return boolean
function GameObject.Divert(p1, p2) end

--- arity: 1.
---@param ai_target GameObject|AITargetLocation
---@return number
function GameObject.Get_AI_Power_Vs_Unit(ai_target) end

--- no parameters.
---@return boolean
function GameObject.Has_Active_Orders() end

--- no parameters.
---@return number
function GameObject.Get_Contained_Object_Count() end

--- arity: 1.
---@param game GameObjectType
---@return boolean
function GameObject.Contains_Object_Type(game) end

--- arity: 1.
---@param p1 number
function GameObject.Destroy_Contained_Objects(p1) end

--- arity: 1.
---@param ability string
---@return boolean
function GameObject.Is_Ability_Ready(ability) end

--- arity: 1.
---@param ability string
---@return boolean
function GameObject.Has_Ability(ability) end

--- arguments handled by a helper the binding calls; types not measured here.
---@vararg any
function GameObject.Activate_Ability(...) end

--- arity: 2.
---@param ability string
---@param id boolean
function GameObject.Set_Single_Ability_Autofire(ability, id) end

--- arity: 1.
---@param id boolean
function GameObject.Set_All_Abilities_Autofire(id) end

--- arity: 1.
---@param p1 string
---@return boolean
function GameObject.Has_Property(p1) end

--- no parameters.
function GameObject.Unlock_Current_Orders() end

--- arity: 2.
---@param p1 string
---@param blend_seconds boolean
---@param is_looping number
function GameObject.Play_Animation(p1, blend_seconds, is_looping) end

--- no parameters.
---@return boolean
function GameObject.Is_On_Diversion() end

--- arity: 1.
---@param player Player
---@return GameObjectType
function GameObject.Get_Affiliated_Indigenous_Type(player) end

--- no parameters.
---@return boolean
function GameObject.Is_Planet_Destroyed() end

--- arity: 1.
--- reads its arguments; types not measurable from the binding.
function GameObject.Turn_To_Face() end

--- arity: 1.
---@param p1 string
---@return boolean
function GameObject.Is_Ability_Active(p1) end

--- no parameters.
---@return boolean
function GameObject.Is_In_Nebula() end

--- no parameters.
---@return boolean
function GameObject.Is_In_Ion_Storm() end

--- no parameters.
---@return boolean
function GameObject.Is_In_Asteroid_Field() end

--- arity: 1.
---@param p1 string
---@return boolean
function GameObject.Is_Under_Effects_Of_Ability(p1) end

--- arity: 1.
---@param find_object_name string|GameObjectType
---@param p2 boolean
---@return boolean
function GameObject.Build(find_object_name, p2) end

--- Tactical only.
--- arity: 1.
---@param p1 boolean
function GameObject.Make_Invulnerable(p1) end

--- Tactical only.
--- arity: 1.
--- reads its arguments; types not measurable from the binding.
function GameObject.Teleport() end

--- Tactical only.
--- arity: 1.
---@param game Position|GameObject
function GameObject.Teleport_And_Face(game) end

--- arity: 0.
---@param p1 boolean
function GameObject.Hyperspace_Away(p1) end

--- argument count checked against 0.
---@param delay_frames number
function GameObject.Cinematic_Hyperspace_In(delay_frames) end

--- no parameters.
function GameObject.Cancel_Hyperspace() end

--- arity: 1.
---@param locked boolean
function GameObject.Lock_Build_Pad_Contents(locked) end

--- arity: 1.
---@param name string
---@return Position
function GameObject.Get_Bone_Position(name) end

--- no parameters.
---@return boolean
function GameObject.Is_Tactical_Superweapon_Ready() end

--- no parameters.
---@return boolean
function GameObject.Fire_Tactical_Superweapon() end

--- arity: 1.
---@param on_off boolean
function GameObject.Set_Garrison_Spawn(on_off) end

--- arity: 1.
---@param onoff boolean
function GameObject.Prevent_Opportunity_Fire(onoff) end

--- no parameters.
function GameObject.Get_Hint() end

--- arity: 1.
---@param cannot_kill boolean
function GameObject.Set_Cannot_Be_Killed(cannot_kill) end

--- arity: 1.
---@param fade_in_seconds string
---@param p2 number
function GameObject.Play_SFX_Event(fade_in_seconds, p2) end

--- no parameters.
function GameObject.Force_Test_Space_Conflict() end

--- argument count checked against 0.
---@param onoff boolean
function GameObject.Hide(onoff) end

--- argument count checked against 0.
--- reads its arguments; types not measurable from the binding.
function GameObject.Face_Immediate() end

--- no parameters.
function GameObject.Reset_Ability_Counter() end

--- arity: 1.
---@param p1 boolean
function GameObject.Prevent_All_Fire(p1) end

--- arity: 1.
---@param p1 boolean
function GameObject.Disable_Capture(p1) end

--- arity: 1.
---@param p1 boolean
function GameObject.Suspend_Locomotor(p1) end

--- arity: 1.
---@param ai_target_location AITargetLocation
function GameObject.Explore_Area(ai_target_location) end

--- arity: 1.
---@param p1 boolean
---@param z number
function GameObject.Highlight(p1, z) end

--- arity: 1.
---@param p1 boolean
---@param z number
function GameObject.Highlight_Small(p1, z) end

--- arity: 2.
---@param p1 string
---@param onoff boolean
function GameObject.Show_Emitter(p1, onoff) end

--- no parameters.
---@return boolean
function GameObject.Has_Attack_Target() end

--- Tactical only.
--- no parameters.
function GameObject.Stop() end

--- argument count checked against 0.
---@param p1 boolean|number
function GameObject.Override_Max_Speed(p1) end

--- arity: 1.
---@param find_object_name GameObjectType|string
---@param bone_name string
function GameObject.Attach_Particle_Effect(find_object_name, bone_name) end

--- Galactic only.
--- no parameters.
function GameObject.Get_Planet_Location() end

--- argument count checked against 0.
---@param state boolean
function GameObject.In_End_Cinematic(state) end

--- arity: 1.
---@param sfx_event_name string
---@param fade_out_seconds number
function GameObject.Stop_SFX_Event(sfx_event_name, fade_out_seconds) end

--- no parameters.
function GameObject.Play_Cinematic_Engine_Flyby() end

--- no parameters.
---@return boolean
function GameObject.Get_Is_Planet_AI_Usable() end

--- arity: 2.
---@param behavior number
---@param state boolean
function GameObject.Enable_Behavior(behavior, state) end

--- arity: 2.
---@param ability string
function GameObject.Cancel_Ability(ability) end

--- arity: 1.
---@param game GameObject
---@return boolean
function GameObject.Can_Land_On_Planet(game) end

--- arity: 1.
---@param onoff boolean
function GameObject.Set_Check_Contested_Space(onoff) end

--- no parameters.
function GameObject.Get_Attack_Target() end

--- arity: 1.
---@param p1 GameObject|AITargetLocation
function GameObject.Garrison(p1) end

--- arity: 1.
---@param p1 GameObject|AITargetLocation
---@return boolean
function GameObject.Can_Garrison(p1) end

--- no parameters.
---@return boolean
function GameObject.Can_Garrison_Fire() end

--- no parameters.
function GameObject.Leave_Garrison() end

--- no parameters.
function GameObject.Eject_Garrison() end

--- no parameters.
---@return boolean
function GameObject.Has_Garrison() end

--- no parameters.
function GameObject.Get_Garrisoned_Units() end

---@param ai_target GameObject|AITargetLocation
---@return boolean
function GameObject.Is_Good_Against(ai_target) end

--- arity: 1.
---@param ai_target GameObject|AITargetLocation
---@return boolean
function GameObject.Should_Switch_Weapons(ai_target) end

--- no parameters.
---@return GameObjectType
function GameObject.Get_Current_Projectile_Type() end

--- no parameters.
---@return boolean
function GameObject.Is_Selectable() end

--- arity: 1.
---@param p1 string
---@return boolean
function GameObject.Is_Ability_Autofire(p1) end

--- no parameters.
---@return GameObjectType
function GameObject.Get_All_Projectile_Types() end

--- arity: 1.
---@param in_limbo boolean
function GameObject.Set_In_Limbo(in_limbo) end

--- no parameters.
---@return boolean
function GameObject.Is_In_Garrison() end

--- arity: 0.
--- reads its arguments; types not measurable from the binding.
function GameObject.Invade() end

--- no parameters.
---@return boolean
function GameObject.Can_Move() end

--- argument count checked against 1.
---@param onoff boolean
function GameObject.Enable_Dynamic_LOD(onoff) end

--- arity: 1.
---@param p1 string
---@param seconds_to_countdown number
function GameObject.Force_Ability_Recharge(p1, seconds_to_countdown) end

--- no parameters.
---@return boolean
function GameObject.Is_Corrupted() end

--- no parameters.
function GameObject.Get_Name() end

---@class Player
Player = {}

--- no parameters.
---@return boolean
function Player.Is_Neutral() end

--- no parameters.
---@return number
function Player.Get_ID() end

--- no parameters.
function Player.Get_Name() end

--- no parameters.
---@return boolean
function Player.Is_Valid() end

--- argument count checked against 0.
---@param credits_to_add number
function Player.Give_Money(credits_to_add) end

--- argument count checked against 0.
---@param new_tech_level number
function Player.Set_Tech_Level(new_tech_level) end

--- arity: 0.
---@param resources number
function Player.Release_Credits_For_Tactical(resources) end

--- no parameters.
---@return number
function Player.Get_Credits() end

--- no parameters.
---@return number
function Player.Get_GameSpy_Stats_Player_ID() end

--- no parameters.
function Player.Get_Enemy() end

--- no parameters.
function Player.Get_Faction_Name() end

--- no parameters.
---@return number
function Player.Get_Tech_Level() end

--- no parameters.
---@return boolean
function Player.Retreat() end

--- arguments handled by a helper the binding calls; types not measured here.
---@vararg any
---@return GameObjectType
function Player.Give_Random_Sliceable_Tech(...) end

--- arity: 1.
---@param game GameObjectType
function Player.Unlock_Tech(game) end

--- arity: 1.
---@param game GameObjectType
function Player.Lock_Tech(game) end

--- no parameters.
---@return boolean
function Player.Is_Human() end

--- no parameters.
function Player.Enable_As_Actor() end

--- arity: 1.
---@param player Player
---@return boolean
function Player.Is_Enemy(player) end

--- arity: 1.
---@param player Player
---@return boolean
function Player.Is_Ally(player) end

--- arity: 1.
---@param game GameObject
function Player.Select_Object(game) end

--- arity: 1.
---@param p1 boolean
function Player.Disable_Bombing_Run(p1) end

--- arity: 2.
---@param p1 string
---@param mode boolean
function Player.Enable_Advisor_Hints(p1, mode) end

--- no parameters.
function Player.Get_Difficulty() end

--- argument count checked against 0.
---@param toggle boolean
function Player.Set_Black_Market_Tutorial(toggle) end

--- argument count checked against 0.
---@param toggle boolean
function Player.Set_Sabotage_Tutorial(toggle) end

--- arity: 1.
---@param player Player
function Player.Make_Ally(player) end

--- arity: 1.
---@param player Player
function Player.Make_Enemy(player) end

--- arity: 1.
---@param p1 boolean
function Player.Disable_Orbital_Bombardment(p1) end

--- arity: 1.
---@param p1 boolean
function Player.Remove_Orbital_Bombardment(p1) end

--- no parameters.
---@return number
function Player.Get_Clan_ID() end

--- no parameters.
---@return number
function Player.Get_Team() end

--- no parameters.
---@return GameObject
function Player.Get_Space_Station() end

---@class GameObjectType
GameObjectType = {}

--- no parameters.
---@return number
function GameObjectType.Get_Build_Cost() end

--- no parameters.
---@return number
function GameObjectType.Get_Combat_Rating() end

--- no parameters.
---@return boolean
function GameObjectType.Is_Valid() end

--- no parameters.
---@return boolean
function GameObjectType.Is_Hero() end

--- no parameters.
function GameObjectType.Get_Name() end

--- no parameters.
---@return number
function GameObjectType.Get_Base_Level() end

--- no parameters.
---@return number
function GameObjectType.Get_Tech_Level() end

--- arity: 1.
---@param player Player
---@return boolean
function GameObjectType.Is_Affiliated_With(player) end

--- arity: 1.
---@param player Player
---@return boolean
function GameObjectType.Is_Build_Locked(player) end

--- arity: 1.
---@param player Player
---@return boolean
function GameObjectType.Is_Obsolete(player) end

--- no parameters.
---@return number
function GameObjectType.Get_Tactical_Build_Cost() end

--- no parameters.
---@return number
function GameObjectType.Get_Score_Cost_Credits() end

--- no parameters.
---@return number
function GameObjectType.Get_Max_Range() end

--- no parameters.
---@return number
function GameObjectType.Get_Min_Range() end

--- argument count checked against 0.
---@param game_wrapper GameObject
---@return number
function GameObjectType.Get_Bribe_Cost(game_wrapper) end

--- no parameters.
---@return boolean
function GameObjectType.Is_Affected_By_Missile_Shield() end

--- no parameters.
---@return boolean
function GameObjectType.Is_Affected_By_Laser_Defense() end

---@class Script
Script = {}

--- no parameters.
---@return boolean
function Script.Is_Valid() end

--- arity: at least 1.
---@param p1 string
function Script.Call_Function(p1) end

--- arity: 2.
---@param p1 string
function Script.Set_Variable(p1) end

--- arity: 1.
---@param p1 string
function Script.Get_Variable(p1) end

---@class AITargetLocation
AITargetLocation = {}

--- no parameters.
---@return GameObject
function AITargetLocation.Get_Game_Object() end

--- no parameters.
---@return boolean
function AITargetLocation.Is_Valid() end

--- argument count checked against 1.
--- reads its arguments; types not measurable from the binding.
---@return number
function AITargetLocation.Get_Distance() end

---@class Budget
Budget = {}

--- no parameters.
---@return number
function Budget.Get_Unallocated_Resources() end

--- no parameters.
---@return number
function Budget.Get_Spendable_Resources() end

--- argument count checked against 1.
---@param p1 number
function Budget.Allocate_Resources(p1) end

--- argument count checked against 1.
---@param resources_to_wait_for number
function Budget.Wait_For_Spendable_Resources(resources_to_wait_for) end

--- argument count checked against 1.
---@param resources_to_wait_for number
function Budget.Wait_For_Unallocated_Resources(resources_to_wait_for) end

--- argument count checked against 2.
---@param resources number
---@param p2 string
---@return boolean
function Budget.Give_Resources_To_Goal(resources, p2) end

--- argument count checked against 2.
---@param resources number
---@param p2 string
---@return boolean
function Budget.Take_Resources_From_Goal(resources, p2) end

--- argument count checked against 0.
--- reads its arguments; types not measurable from the binding.
function Budget.Flush_Unallocated_Resources() end

--- argument count checked against 0.
--- reads its arguments; types not measurable from the binding.
function Budget.Flush_All_Resources() end

--- arity: 1.
---@param p1 string
function Budget.Flush_Category(p1) end

---@class StoryEvent
StoryEvent = {}

--- no parameters.
---@return boolean
function StoryEvent.Is_Valid() end

--- arity: 2.
---@param p1 number
function StoryEvent.Set_Event_Parameter(p1) end

--- arity: 2.
---@param p1 number
function StoryEvent.Set_Reward_Parameter(p1) end

--- arity: 2.
---@param get_unicode_string string
---@vararg GameObject|GameObjectType|string|number
function StoryEvent.Add_Dialog_Text(get_unicode_string, ...) end

--- no parameters.
function StoryEvent.Clear_Dialog_Text() end

--- arity: 1.
---@param p1 string
function StoryEvent.Set_Dialog(p1) end

--- arity: 1.
---@param text string
function StoryEvent.Set_Reward_Type(text) end

---@class StoryPlot
StoryPlot = {}

--- no parameters.
---@return boolean
function StoryPlot.Is_Valid() end

--- arity: 1.
---@param event string
---@return StoryEvent
function StoryPlot.Get_Event(event) end

--- no parameters.
function StoryPlot.Activate() end

--- no parameters.
function StoryPlot.Suspend() end

--- no parameters.
function StoryPlot.Reset() end

---@class Position
Position = {}

--- no parameters.
---@return boolean
function Position.Is_Valid() end

--- no parameters.
---@return number
function Position.Get_XYZ() end

---@class TaskForce
TaskForce = {}

---@param index number
function TaskForce.Get_Type_Of_Unit(index) end

---@param p1 GameObject
function TaskForce.Add_Force(p1) end

--- no parameters.
function TaskForce.Form_Units() end

--- no parameters.
function TaskForce.Move_To() end

--- argument count checked against 0, 1.
---@param planet AITargetLocation|GameObject
---@param sync_stage boolean
function TaskForce.Produce_Force(planet, sync_stage) end

--- no parameters.
---@return number
function TaskForce.Get_Force_Count() end

--- argument count checked against 0.
---@param p1 boolean
function TaskForce.Set_As_Goal_System_Removable(p1) end

--- arity: 1.
---@param p1 number
function TaskForce.Release_Forces(p1) end

--- no parameters.
function TaskForce.Withdraw_Units() end

--- arity: 1.
---@param p1 GameObject
function TaskForce.Release_Unit(p1) end

--- arity: 0.
---@param p1 string
function TaskForce.Collect_All_Free_Units(p1) end

--- no parameters.
function TaskForce.Block_Goal_Proposal() end

--- no parameters.
function TaskForce.Unblock_Goal_Proposal() end

--- no parameters.
---@return AITargetLocation
function TaskForce.Get_Stage() end

--- no parameters.
---@return boolean
function TaskForce.Are_All_Units_On_Free_Store() end

--- arity: 1.
---@param result boolean
function TaskForce.Set_Plan_Result(result) end

--- arity: 1.
---@param p1 string
---@param find_object_name string
function TaskForce.Set_Targeting_Priorities(p1, find_object_name) end

--- arity: 1.
---@param seconds number
---@param find_object_name string
function TaskForce.Set_Targeting_Stickiness_Time_Threshold(seconds, find_object_name) end

--- no parameters.
---@return boolean
function TaskForce.Is_Valid() end

--- arity: 1.
---@param p1 string
function TaskForce.Add_Opportunity_Fire_Event_Subscription(p1) end

--- arity: 1.
---@param p1 string
function TaskForce.Remove_Opportunity_Fire_Event_Subscription(p1) end

--- no parameters.
function TaskForce.Clear_Opportunity_Fire_Event_Subscriptions() end

--- Tactical only.
--- arity: 1.
---@param ai_target GameObject|AITargetLocation
---@return number
function TaskForce.Get_AI_Power_Vs_Unit(ai_target) end

--- arguments handled by a helper the binding calls; types not measured here.
---@vararg any
function TaskForce.Activate_Ability(...) end

--- arguments handled by a helper the binding calls; types not measured here.
---@vararg any
function TaskForce.Set_Single_Ability_Autofire(...) end

--- arguments handled by a helper the binding calls; types not measured here.
---@vararg any
function TaskForce.Set_All_Abilities_Autofire(...) end

--- no parameters.
function TaskForce.Get_Unit_Table() end

--- no parameters.
---@return number
function TaskForce.Get_Self_Threat_Max() end

--- no parameters.
---@return number
function TaskForce.Get_Self_Threat_Sum() end

--- arity: 1.
---@param p1 boolean
function TaskForce.Test_Target_Contrast(p1) end

--- arguments handled by a helper the binding calls; types not measured here.
---@vararg any
function TaskForce.Garrison(...) end

--- arity: 1.
---@param p1 GameObject|AITargetLocation
---@return boolean
function TaskForce.Can_Garrison(p1) end

--- arguments handled by a helper the binding calls; types not measured here.
---@vararg any
function TaskForce.Leave_Garrison(...) end

--- no parameters.
function TaskForce.Get_Goal_Type_Name() end

--- argument count checked against 0, 1, 2.
---@param p1 AITargetLocation|GameObject
---@param threat_tolerance number
---@vararg boolean
function TaskForce.Attack_Target(p1, threat_tolerance, ...) end

--- arity: 1.
---@param on_off boolean
function TaskForce.Enable_Attack_Positioning(on_off) end

--- arity: 1.
---@param p1 string
---@return GameObject
function TaskForce.Find_Closest_Enemy(p1) end

--- arity: 4.
---@param p1 AITargetLocation|GameObject
---@param p2 string
---@param do_zone_path number
---@param p4 number
---@param attack boolean
function TaskForce.Prepare_Ambush(p1, p2, do_zone_path, p4, attack) end

--- arity: 1.
--- reads its arguments; types not measurable from the binding.
---@return number
function TaskForce.Get_Distance() end

--- arity: 1.
---@param p1 GameObject|AITargetLocation|TaskForce
---@param p2 number|lightuserdata
function TaskForce.Reinforce(p1, p2) end

--- argument count checked against 0, 1.
---@param p1 AITargetLocation|GameObject|Position|TaskForce
---@param do_zone_path number
---@vararg boolean
function TaskForce.Guard_Target(p1, do_zone_path, ...) end

--- argument count checked against 0, 1.
---@param p1 AITargetLocation|GameObject|TaskForce|Position
---@param do_zone_path number
---@vararg boolean
function TaskForce.Attack_Move(p1, do_zone_path, ...) end

--- arity: 1.
---@param p1 GameObject|AITargetLocation
function TaskForce.Bombing_Run(p1) end

--- arity: 2.
---@param find_object_name string
---@param p2 AITargetLocation|GameObject
---@return GameObject|boolean
function TaskForce.Fire_Special_Weapon(find_object_name, p2) end

--- no parameters.
function TaskForce.Build_All() end

--- arity: 1.
---@param find_object_name string
---@param game_ai_target GameObject|AITargetLocation
function TaskForce.Build(find_object_name, game_ai_target) end

--- no parameters.
---@return GameObject
function TaskForce.Get_Reserved_Build_Pads() end

--- no parameters.
function TaskForce.Release_Reinforcements() end

--- arity: 1.
---@param ai_target_location AITargetLocation
function TaskForce.Explore_Area(ai_target_location) end

--- arity: 1.
--- reads its arguments; types not measurable from the binding.
function TaskForce.Fire_Orbital_Bombardment() end

--- no parameters.
function TaskForce.Invade() end

--- no parameters.
function TaskForce.Land_Units() end

--- no parameters.
function TaskForce.Launch_Units() end

--- arity: 2.
---@param planet GameObject
---@param p2 number
function TaskForce.Refit_To_Definition(planet, p2) end

--- no parameters.
function TaskForce.Force_Test_Space_Conflict() end

--- no parameters.
---@return boolean
function TaskForce.Is_Raid_Capable() end

--- argument count checked against 0.
---@param p1 GameObject
function TaskForce.Raid(p1) end

---@class FreeStore
FreeStore = {}

--- argument count checked against 0.
---@param p1 GameObject
---@return boolean
function FreeStore.Is_Object_On_Free_Store(p1) end

--- argument count checked against 0.
---@param p1 boolean
---@return number
function FreeStore.Get_Object_Count(p1) end

---@class GlobalValueStore
GlobalValueStore = {}

--- argument count checked against 1.
---@param p1 string
function GlobalValueStore.Get(p1) end

--- argument count checked against 2.
---@param p1 string
function GlobalValueStore.Set(p1) end

---@class ThreadValueStore
ThreadValueStore = {}

--- argument count checked against 1.
---@param p1 string
function ThreadValueStore.Get(p1) end

--- argument count checked against 2.
---@param p1 string
function ThreadValueStore.Set(p1) end

--- no parameters.
function ThreadValueStore.Reset() end

--- Host globals of the plan and free-store scripts (data/lua-contexts.md, the hosts table)

---@type FreeStore
FreeStore = nil
---@type GlobalValueStore
GlobalValue = nil
---@type ThreadValueStore
ThreadValue = nil

