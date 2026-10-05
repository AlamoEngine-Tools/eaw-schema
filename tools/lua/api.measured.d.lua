---@meta
--- Alamo engine Lua API, Forces of Corruption, October 2024 release (generated 2026-10-04).
--- Generated from the engine's own bindings: argument counts, types and returns are what each
--- binding checks, casts and constructs. Lua 5.0 dialect: the engine opens base, string, table
--- and its own `security` library only; no math, io, os or coroutine tables exist.

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

---@param p1 Player
---@param p2 AITargetLocation|GameObject
---@param p3 TaskForce
---@return AITargetLocation|GameObject
function _FindStageArea(p1, p2, p3) end

--- arity: 2.
---@param p1 string
---@param p2 Player
---@param p3 AITargetLocation|GameObject
---@return number
function EvaluatePerception(p1, p2, p3) end

--- arity: 4.
---@param p1 Player
---@param p2 string
---@param p3 AITargetLocation|GameObject
---@param p4 number
---@param p5 number
function GiveDesireBonus(p1, p2, p3, p4, p5) end

--- arity: 1.
---@param p1 GameObject
---@return GameObjectType
function GetNextStarbaseType(p1) end

--- arity: 1.
---@param p1 GameObject
---@return GameObjectType
function GetNextGroundbaseType(p1) end

--- argument count checked against 2.
---@param p1 GameObject
---@param p2 number
function WaitForGroundbase(p1, p2) end

--- argument count checked against 2.
---@param p1 GameObject
---@param p2 number
function WaitForStarbase(p1, p2) end

--- arity: 3.
---@param p1 Player
---@param p2 AITargetLocation
function EvaluateTypeList(p1, p2) end

--- Binding body not measured.
function WeightedTypeList() end

--- arity: 1.
---@param p1 TaskForce|AITargetLocation|GameObject
---@param p2 number
---@param p3 Player
---@return GameObject
function FindDeadlyEnemy(p1, p2, p3) end

--- argument count checked against 0.
---@param p1 string
---@return GameObject
function Find_First_Object(p1) end

--- arity: 1.
---@param p1 Player
function Purge_Goals(p1) end

--- arity: 3.
---@param p1 Player
---@param p2 GameObject|AITargetLocation|Player|table
---@param p3 number
function Apply_Markup(p1, p2, p3) end

--- Galactic only.
--- arity: 3.
---@param p1 Player
---@param p2 AITargetLocation|GameObject
---@param p3 AITargetLocation|GameObject
---@return GameObject
function Find_Path(p1, p2, p3) end

--- arity: 1.
---@param p1 string
---@param p2 GameObject
function Story_Event(p1, p2) end

--- Tactical only.
--- arity: 2.
---@param p1 string
---@param p2 Player
---@return number
function Evaluate_In_Galactic_Context(p1, p2) end

--- no parameters.
---@return boolean
function Is_Campaign_Game() end

--- Tactical only.
--- argument count checked against 0, 1, 4.
---@param p1 GameObject|AITargetLocation|TaskForce
---@param p2 string
---@vararg Player|boolean
---@return GameObject
function Find_Nearest(p1, p2, ...) end

--- Tactical only.
--- arity: 2.
---@param p1 AITargetLocation
---@param p2 Player
---@return Position
function Get_Most_Defended_Position(p1, p2) end

--- arity: 2.
---@param p1 GameObject
---@return Position
function Project_By_Unit_Range(p1) end

--- argument count checked against 3, 4.
---@param p1 GameObjectType
---@param p2 boolean
---@param p3 Player
---@param p4 boolean
---@param p5 boolean
function Reinforce_Unit(p1, p2, p3, p4, p5) end

--- argument count checked against 0.
---@param p1 string
---@return GameObjectType
function Find_Object_Type(p1) end

--- argument count checked against 3.
---@param p1 GameObjectType
---@param p2 any
---@param p3 Player
---@return GameObject
function Spawn_Unit(p1, p2, p3) end

--- argument count checked against 0, 1.
---@param p1 GameObjectType|string
---@param p2 string
---@return GameObject
function Find_Hint(p1, p2) end

--- argument count checked against 0.
--- reads its arguments; types not measurable from the binding.
function Point_Camera_At() end

--- arity: 1.
---@param p1 string
---@return StoryPlot
function Get_Story_Plot(p1) end

--- argument count checked against 4.
---@param p1 Player
---@param p2 string
---@param p3 GameObject|AITargetLocation
---@param p4 boolean
---@return boolean
function Check_Story_Flag(p1, p2, p3, p4) end

--- no parameters.
function Activate_Retry_Dialog() end

--- arity: 1.
---@param p1 string
function Game_Message(p1) end

--- Binding body not measured.
function DiscreteDistribution() end

--- arity: 2.
---@param p1 GameObject
---@param p2 GameObject
---@param p3 Player
---@param p4 boolean
---@return boolean
function Are_On_Opposite_Sides_Of_Shield(p1, p2, p3, p4) end

--- no parameters.
function Fade_On() end

--- no parameters.
function Fade_Off() end

--- no parameters.
function Letter_Box_On() end

--- no parameters.
function Letter_Box_Off() end

--- argument count checked against 0.
---@param p1 number
function Letter_Box_In(p1) end

--- argument count checked against 0.
---@param p1 number
function Letter_Box_Out(p1) end

--- argument count checked against 0.
---@param p1 number
function Fade_Screen_In(p1) end

--- argument count checked against 0.
---@param p1 number
function Fade_Screen_Out(p1) end

--- argument count checked against 0, 1.
---@param p1 any
---@param p2 GameObject
function Scroll_Camera_To(p1, p2) end

--- argument count checked against 0, 1.
---@param p1 GameObject
---@param p2 number
function Camera_To_Follow(p1, p2) end

--- argument count checked against 2.
---@param p1 number
---@param p2 number
function Zoom_Camera(p1, p2) end

--- argument count checked against 2.
---@param p1 number
---@param p2 number
function Rotate_Camera_By(p1, p2) end

--- argument count checked against 2.
---@param p1 number
---@param p2 number
---@param p3 number
function Rotate_Camera_To(p1, p2, p3) end

--- argument count checked against 0.
---@param p1 number
function Lock_Controls(p1) end

--- argument count checked against 0.
---@param p1 number
function Suspend_AI(p1) end

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
---@param p1 string
function Play_Lightning_Effect(p1) end

--- arity: 1.
---@param p1 table
---@return GameObject
function Assemble_Fleet(p1) end

--- arity: 1.
---@param p1 string
---@return GameObject
function Find_All_Objects_With_Hint(p1) end

--- argument count checked against 0.
---@param p1 boolean
function Start_Cinematic_Camera(p1) end

--- no parameters.
function End_Cinematic_Camera() end

--- arity: 8.
---@param p1 any
---@param p2 number
---@param p3 number
---@param p4 number
---@param p5 number
---@param p6 GameObject
---@param p7 number
---@param p8 number
function Set_Cinematic_Target_Key(p1, p2, p3, p4, p5, p6, p7, p8) end

--- arity: 9.
---@param p1 any
---@param p2 number
---@param p3 number
---@param p4 number
---@param p5 number
---@param p6 number
---@param p7 GameObject
---@param p8 number
---@param p9 number
function Transition_Cinematic_Target_Key(p1, p2, p3, p4, p5, p6, p7, p8, p9) end

--- arity: 8.
---@param p1 any
---@param p2 number
---@param p3 number
---@param p4 number
---@param p5 number
---@param p6 GameObject
---@param p7 number
---@param p8 number
function Set_Cinematic_Camera_Key(p1, p2, p3, p4, p5, p6, p7, p8) end

--- arity: 9.
---@param p1 any
---@param p2 number
---@param p3 number
---@param p4 number
---@param p5 number
---@param p6 number
---@param p7 GameObject
---@param p8 number
---@param p9 number
function Transition_Cinematic_Camera_Key(p1, p2, p3, p4, p5, p6, p7, p8, p9) end

--- argument count checked against 0.
---@param p1 number
function Transition_To_Tactical_Camera(p1) end

--- argument count checked against 2.
---@param p1 number
---@param p2 number
function Cinematic_Zoom(p1, p2) end

--- arity: 8.
---@param p1 string
---@param p2 number
---@param p3 any
---@param p4 number
---@param p5 number
---@param p6 number
---@param p7 number
---@param p8 number
---@param p9 string
---@return GameObject
function Create_Cinematic_Transport(p1, p2, p3, p4, p5, p6, p7, p8, p9) end

--- argument count checked against 2.
---@param p1 GameObject
---@param p2 number
function Hide_Object(p1, p2) end

--- argument count checked against 3.
---@param p1 GameObject
---@param p2 number
---@param p3 string
function Hide_Sub_Object(p1, p2, p3) end

--- arity: 1.
---@param p1 any
---@param p2 string
---@return GameObject
function Find_Nearest_Space_Field(p1, p2) end

--- argument count checked against 0.
---@param p1 boolean
function Enable_Fog(p1) end

--- argument count checked against 0.
---@param p1 GameObject
function Promote_To_Space_Cinematic_Layer(p1) end

--- argument count checked against 0.
---@param p1 string
function Play_Bink_Movie(p1) end

--- no parameters.
function Stop_Bink_Movie() end

--- arity: 1.
---@param p1 string
function Play_Music(p1) end

--- no parameters.
function Stop_All_Music() end

--- no parameters.
function Resume_Mode_Based_Music() end

--- no parameters.
function Force_Weather() end

--- arity: 1; 2.
---@param p1 GameObject
---@param p2 string
function Add_Radar_Blip(p1, p2) end

--- arity: 1.
---@param p1 GameObject|string
function Remove_Radar_Blip(p1) end

--- arity: 2.
---@param p1 GameObject
---@param p2 string
function Add_Planet_Highlight(p1, p2) end

--- arity: 1.
---@param p1 string
function Remove_Planet_Highlight(p1) end

--- no parameters.
function Resume_Hyperspace_In() end

--- no parameters.
function Stop_All_Speech() end

--- no parameters.
function Remove_All_Text() end

--- argument count checked against 0.
---@param p1 boolean
function Allow_Localized_SFX(p1) end

--- no parameters.
function Master_Volume_Restore() end

--- no parameters.
function Get_Game_Mode() end

--- argument count checked against 0.
---@param p1 boolean
function Set_Cinematic_Environment(p1) end

--- argument count checked against 0.
---@param p1 number
function Set_New_Environment(p1) end

--- no parameters.
function Start_Cinematic_Mode() end

--- no parameters.
function End_Cinematic_Mode() end

--- arity: 3.
---@param p1 string|GameObjectType
---@param p2 any
---@param p3 Player
---@return GameObject
function Create_Generic_Object(p1, p2, p3) end

--- argument count checked against 0.
---@param p1 boolean
function Weather_Audio_Pause(p1) end

--- argument count checked against 0, 1.
---@param p1 number
---@param p2 number
function Start_Cinematic_Space_Retreat(p1, p2) end

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
---@param p1 string
---@param p2 boolean
function Add_Objective(p1, p2) end

--- no parameters.
---@return boolean
function Is_Multiplayer_Mode() end

--- no parameters.
function Cancel_Fast_Forward() end

--- no parameters.
---@return number
function GetCurrentTime() end

--- argument count checked against 0, 1.
---@param p1 number
---@param p2 number
---@return number
function GameRandom(p1, p2) end

--- arity: 3.
---@param p1 GameObjectType
---@param p2 any
---@param p3 Player
---@return GameObject
function Spawn_From_Reinforcement_Pool(p1, p2, p3) end

--- arity: 2.
---@param p1 string
---@param p2 Player
---@return GameObject
function Spawn_Special_Weapon(p1, p2) end

--- arity: 1.
---@param p1 boolean
function Enable_Distance_Fog(p1) end

--- arity: 3.
---@param p1 number
---@param p2 number
---@param p3 number
---@return Position
function Create_Position(p1, p2, p3) end

--- arity: 2.
---@param p1 string
---@param p2 boolean
function GUI_Component_Visibility(p1, p2) end

--- arity: 2.
---@param p1 string
---@param p2 boolean
function GUI_Component_Enable(p1, p2) end

--- arity: 2.
---@param p1 string
---@param p2 string
function GUI_Component_Text(p1, p2) end

--- arity: 4.
---@param p1 string
---@param p2 string
---@param p3 number
---@param p4 boolean
function GUI_Component_Play_Anim(p1, p2, p3, p4) end

--- arity: 1.
---@param p1 string
function GUI_Component_Stop_Anim(p1) end

--- arity: 5.
---@param p1 string
---@param p2 number
---@param p3 number
---@param p4 number
---@param p5 number
function GUI_Component_Color(p1, p2, p3, p4, p5) end

--- arity: 4.
---@param p1 string
---@param p2 boolean
---@param p3 boolean
---@param p4 boolean
function GUI_Component_Blink(p1, p2, p3, p4) end

--- arity: 4.
---@param p1 string
---@param p2 boolean
---@param p3 number
---@param p4 number
function GUI_Component_Flash(p1, p2, p3, p4) end

--- arity: 1.
---@param p1 string
function GUI_Component_Stop_Flash(p1) end

--- arity: 5.
---@param p1 string
---@param p2 number
---@param p3 number
---@param p4 number
---@param p5 number
function GUI_Text_Color(p1, p2, p3, p4, p5) end

--- arity: 6.
---@param p1 string
---@param p2 string
---@param p3 number
---@param p4 number
---@param p5 number
---@param p6 number
function GUI_Button_Icon(p1, p2, p3, p4, p5, p6) end

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
---@param p1 number
function GameObject.Set_Targeting_Stickiness_Time_Threshold(p1) end

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
---@param p2 Player
function GameObject.Fire_Special_Weapon(p1, p2) end

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
---@param p1 number
function GameObject.Set_Importance(p1) end

--- arity: 1.
---@param p1 number
---@param p2 string
function GameObject.Take_Damage(p1, p2) end

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
---@param p1 GameObject|AITargetLocation
---@return number
function GameObject.Get_AI_Power_Vs_Unit(p1) end

--- no parameters.
---@return boolean
function GameObject.Has_Active_Orders() end

--- no parameters.
---@return number
function GameObject.Get_Contained_Object_Count() end

--- arity: 1.
---@param p1 GameObjectType
---@return boolean
function GameObject.Contains_Object_Type(p1) end

--- arity: 1.
---@param p1 number
function GameObject.Destroy_Contained_Objects(p1) end

--- arity: 1.
---@param p1 string
---@return boolean
function GameObject.Is_Ability_Ready(p1) end

--- arity: 1.
---@param p1 string
---@return boolean
function GameObject.Has_Ability(p1) end

--- arguments handled by a helper the binding calls; types not measured here.
---@vararg any
function GameObject.Activate_Ability(...) end

--- arity: 2.
---@param p1 string
---@param p2 boolean
function GameObject.Set_Single_Ability_Autofire(p1, p2) end

--- arity: 1.
---@param p1 boolean
function GameObject.Set_All_Abilities_Autofire(p1) end

--- arity: 1.
---@param p1 string
---@return boolean
function GameObject.Has_Property(p1) end

--- no parameters.
function GameObject.Unlock_Current_Orders() end

--- arity: 2.
---@param p1 string
---@param p2 boolean
---@param p3 number
function GameObject.Play_Animation(p1, p2, p3) end

--- no parameters.
---@return boolean
function GameObject.Is_On_Diversion() end

--- arity: 1.
---@param p1 Player
---@return GameObjectType
function GameObject.Get_Affiliated_Indigenous_Type(p1) end

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
---@param p1 string|GameObjectType
---@param p2 boolean
---@return boolean
function GameObject.Build(p1, p2) end

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
---@param p1 Position|GameObject
function GameObject.Teleport_And_Face(p1) end

--- arity: 0.
---@param p1 boolean
function GameObject.Hyperspace_Away(p1) end

--- argument count checked against 0.
---@param p1 number
function GameObject.Cinematic_Hyperspace_In(p1) end

--- no parameters.
function GameObject.Cancel_Hyperspace() end

--- arity: 1.
---@param p1 boolean
function GameObject.Lock_Build_Pad_Contents(p1) end

--- arity: 1.
---@param p1 string
---@return Position
function GameObject.Get_Bone_Position(p1) end

--- no parameters.
---@return boolean
function GameObject.Is_Tactical_Superweapon_Ready() end

--- no parameters.
---@return boolean
function GameObject.Fire_Tactical_Superweapon() end

--- arity: 1.
---@param p1 boolean
function GameObject.Set_Garrison_Spawn(p1) end

--- arity: 1.
---@param p1 boolean
function GameObject.Prevent_Opportunity_Fire(p1) end

--- no parameters.
function GameObject.Get_Hint() end

--- arity: 1.
---@param p1 boolean
function GameObject.Set_Cannot_Be_Killed(p1) end

--- arity: 1.
---@param p1 string
---@param p2 number
function GameObject.Play_SFX_Event(p1, p2) end

--- no parameters.
function GameObject.Force_Test_Space_Conflict() end

--- argument count checked against 0.
---@param p1 boolean
function GameObject.Hide(p1) end

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
---@param p1 AITargetLocation
function GameObject.Explore_Area(p1) end

--- arity: 1.
---@param p1 boolean
---@param p2 number
function GameObject.Highlight(p1, p2) end

--- arity: 1.
---@param p1 boolean
---@param p2 number
function GameObject.Highlight_Small(p1, p2) end

--- arity: 2.
---@param p1 string
---@param p2 boolean
function GameObject.Show_Emitter(p1, p2) end

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
---@param p1 GameObjectType|string
---@param p2 string
function GameObject.Attach_Particle_Effect(p1, p2) end

--- Galactic only.
--- no parameters.
function GameObject.Get_Planet_Location() end

--- argument count checked against 0.
---@param p1 boolean
function GameObject.In_End_Cinematic(p1) end

--- arity: 1.
---@param p1 string
---@param p2 number
function GameObject.Stop_SFX_Event(p1, p2) end

--- no parameters.
function GameObject.Play_Cinematic_Engine_Flyby() end

--- no parameters.
---@return boolean
function GameObject.Get_Is_Planet_AI_Usable() end

--- arity: 2.
---@param p1 number
---@param p2 boolean
function GameObject.Enable_Behavior(p1, p2) end

--- arity: 2.
---@param p1 string
function GameObject.Cancel_Ability(p1) end

--- arity: 1.
---@param p1 GameObject
---@return boolean
function GameObject.Can_Land_On_Planet(p1) end

--- arity: 1.
---@param p1 boolean
function GameObject.Set_Check_Contested_Space(p1) end

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

---@param p1 GameObject|AITargetLocation
---@return boolean
function GameObject.Is_Good_Against(p1) end

--- arity: 1.
---@param p1 GameObject|AITargetLocation
---@return boolean
function GameObject.Should_Switch_Weapons(p1) end

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
---@param p1 boolean
function GameObject.Set_In_Limbo(p1) end

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
---@param p1 boolean
function GameObject.Enable_Dynamic_LOD(p1) end

--- arity: 1.
---@param p1 string
---@param p2 number
function GameObject.Force_Ability_Recharge(p1, p2) end

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

--- Binding body not measured.
function Player.Is_Valid() end

--- argument count checked against 0.
---@param p1 number
function Player.Give_Money(p1) end

--- argument count checked against 0.
---@param p1 number
function Player.Set_Tech_Level(p1) end

--- arity: 0.
---@param p1 number
function Player.Release_Credits_For_Tactical(p1) end

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
---@param p1 GameObjectType
function Player.Unlock_Tech(p1) end

--- arity: 1.
---@param p1 GameObjectType
function Player.Lock_Tech(p1) end

--- no parameters.
---@return boolean
function Player.Is_Human() end

--- no parameters.
function Player.Enable_As_Actor() end

--- arity: 1.
---@param p1 Player
---@return boolean
function Player.Is_Enemy(p1) end

--- arity: 1.
---@param p1 Player
---@return boolean
function Player.Is_Ally(p1) end

--- arity: 1.
---@param p1 GameObject
function Player.Select_Object(p1) end

--- arity: 1.
---@param p1 boolean
function Player.Disable_Bombing_Run(p1) end

--- arity: 2.
---@param p1 string
---@param p2 boolean
function Player.Enable_Advisor_Hints(p1, p2) end

--- no parameters.
function Player.Get_Difficulty() end

--- argument count checked against 0.
---@param p1 boolean
function Player.Set_Black_Market_Tutorial(p1) end

--- argument count checked against 0.
---@param p1 boolean
function Player.Set_Sabotage_Tutorial(p1) end

--- arity: 1.
---@param p1 Player
function Player.Make_Ally(p1) end

--- arity: 1.
---@param p1 Player
function Player.Make_Enemy(p1) end

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
---@param p1 Player
---@return boolean
function GameObjectType.Is_Affiliated_With(p1) end

--- arity: 1.
---@param p1 Player
---@return boolean
function GameObjectType.Is_Build_Locked(p1) end

--- arity: 1.
---@param p1 Player
---@return boolean
function GameObjectType.Is_Obsolete(p1) end

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
---@param p1 GameObject
---@return number
function GameObjectType.Get_Bribe_Cost(p1) end

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
---@param p1 number
function Budget.Wait_For_Spendable_Resources(p1) end

--- argument count checked against 1.
---@param p1 number
function Budget.Wait_For_Unallocated_Resources(p1) end

--- argument count checked against 2.
---@param p1 number
---@param p2 string
---@return boolean
function Budget.Give_Resources_To_Goal(p1, p2) end

--- argument count checked against 2.
---@param p1 number
---@param p2 string
---@return boolean
function Budget.Take_Resources_From_Goal(p1, p2) end

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
---@param p1 string
---@vararg GameObject|GameObjectType|string|number
function StoryEvent.Add_Dialog_Text(p1, ...) end

--- no parameters.
function StoryEvent.Clear_Dialog_Text() end

--- arity: 1.
---@param p1 string
function StoryEvent.Set_Dialog(p1) end

--- arity: 1.
---@param p1 string
function StoryEvent.Set_Reward_Type(p1) end

---@class StoryPlot
StoryPlot = {}

--- no parameters.
---@return boolean
function StoryPlot.Is_Valid() end

--- arity: 1.
---@param p1 string
---@return StoryEvent
function StoryPlot.Get_Event(p1) end

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

