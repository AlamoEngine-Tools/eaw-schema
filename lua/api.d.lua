-- EaW/FoC C++ Lua API
-- Declarations for all C++ functions injected into the Lua environment.
-- Custom annotation:  ---@xmlref XmlObject[:TypeConstraint]
--   Placed immediately after the ---@param it applies to.
--   Marks that parameter as an XML game-object name reference.

-- ── Object Queries ──────────────────────────────────────────────────────────

--- Finds the first game object of the given type in the current game mode.
---@param typeName string
---@xmlref XmlObject
---@return userdata|nil
function Find_First_Object(typeName) end

--- Creates a GameObjectType wrapper for the named type.
---@param typeName string
---@xmlref XmlObject
---@return userdata|nil
function Find_Object_Type(typeName) end

--- Returns a table of all game objects matching the given type, property, or category filter.
---@param filter string
---@xmlref XmlObject
---@return table
function Find_All_Objects_Of_Type(filter) end

--- Finds a hint-marker object by type and optional hint string.
---@param typeName string
---@xmlref XmlObject
---@param hintName string
---@return userdata|nil
function Find_Hint(typeName, hintName) end

--- Finds all objects that carry the given hint string.
---@param hintName string
---@return table
function Find_All_Objects_With_Hint(hintName) end

--- Finds the nearest enemy or ally game object relative to an origin.
---@param origin userdata
---@param filter string
---@param player userdata
---@param matchAllegiance boolean
---@return userdata|nil
function Find_Nearest(origin, filter, player, matchAllegiance) end

--- Finds the nearest nebula, asteroid field, or ion storm to a position.
---@param position userdata
---@param collisionType string
---@return userdata|nil
function Find_Nearest_Space_Field(position, collisionType) end

--- Finds the best local threat centre for a task force.
---@param taskForce userdata
---@return userdata|nil
function Find_Best_Local_Threat_Center(taskForce) end

-- ── Player / Faction ─────────────────────────────────────────────────────────

--- Finds a player (faction) by name.
---@param factionName string
---@xmlref XmlObject:Faction
---@return userdata|nil
function Find_Player(factionName) end

-- ── Planet / Map ─────────────────────────────────────────────────────────────

--- Finds a planet game object by name.
---@param planetName string
---@return userdata|nil
function FindPlanet(planetName) end

--- Finds the target of a task force.
---@param taskForce userdata
---@return userdata|nil
function FindTarget(taskForce) end

--- Finds a stage area.
---@param areaName string
---@return userdata|nil
function _FindStageArea(areaName) end

--- Finds the best defended position for a task force.
---@param taskForce userdata
---@return userdata|nil
function Get_Most_Defended_Position(taskForce) end

-- ── Unit Production / Spawning ────────────────────────────────────────────────

--- Spawns a unit of the given type at a position for a player (requires GameObjectTypeWrapper).
---@param unitType userdata
---@param position userdata
---@param player userdata
---@return table
function Spawn_Unit(unitType, position, player) end

--- Creates a game object by name or type at a position for a player.
---@param typeName string
---@xmlref XmlObject
---@param position userdata
---@param player userdata
---@return userdata|nil
function Create_Generic_Object(typeName, position, player) end

--- Reinforces a player with a unit type at a position.
---@param player userdata
---@param position userdata
---@return userdata|nil
function Reinforce_Unit(player, position) end

--- Spawns a unit from a player's reinforcement pool.
---@param player userdata
---@param unitType userdata
---@param position userdata
---@return userdata|nil
function Spawn_From_Reinforcement_Pool(player, unitType, position) end

--- Spawns a special weapon effect.
---@param weaponType userdata
---@param position userdata
---@param player userdata
---@return userdata|nil
function Spawn_Special_Weapon(weaponType, position, player) end

--- Internal produce-object command.
---@return userdata
function _ProduceObject() end

--- Assembles a fleet for a player.
---@param player userdata
---@return userdata|nil
function Assemble_Fleet(player) end

-- ── Story / Scripting ────────────────────────────────────────────────────────

--- Fires a named story event (a STORY_AI_NOTIFICATION identifier).
---@param eventName string
---@xmlref XmlObject:StoryNotification
---@return userdata
function Story_Event(eventName) end

--- Retrieves a story plot object by name.
---@param plotName string
---@return userdata|nil
function Get_Story_Plot(plotName) end

--- Returns true if the named story flag is set.
---@param flagName string
---@xmlref XmlObject:StoryFlag
---@return boolean
function Check_Story_Flag(flagName) end

--- Evaluates a galactic context.
---@param context userdata
---@return boolean
function Evaluate_In_Galactic_Context(context) end

--- Evaluates a perception category for an AI player.
---@param player userdata
---@param category string
---@return number
function EvaluatePerception(player, category) end

--- Evaluates a type list for an AI player.
---@param player userdata
---@param typeList userdata
---@return boolean
function EvaluateTypeList(player, typeList) end

--- Returns a discrete distribution result.
---@param distribution userdata
---@return number
function DiscreteDistribution(distribution) end

--- Returns a weighted type list.
---@param typeList userdata
---@return userdata
function WeightedTypeList(typeList) end

-- ── AI / Goal Management ─────────────────────────────────────────────────────

--- Gives a desire bonus to an AI player.
---@param player userdata
---@param bonus number
function GiveDesireBonus(player, bonus) end

--- Purges all goals for a task force or player.
---@param target userdata
function Purge_Goals(target) end

--- Applies markup to a unit or group.
---@param unit userdata
---@param markup string
function Apply_Markup(unit, markup) end

--- Finds a path for a unit.
---@param unit userdata
---@param destination userdata
---@return userdata|nil
function Find_Path(unit, destination) end

--- Finds a deadly enemy for a task force.
---@param taskForce userdata
---@return userdata|nil
function FindDeadlyEnemy(taskForce) end

--- Returns the next starbase type in the upgrade chain.
---@param currentType userdata
---@return userdata|nil
function GetNextStarbaseType(currentType) end

--- Returns the next groundbase type in the upgrade chain.
---@param currentType userdata
---@return userdata|nil
function GetNextGroundbaseType(currentType) end

--- Blocks until a groundbase upgrade is complete.
---@param player userdata
---@param planet userdata
---@return userdata
function WaitForGroundbase(player, planet) end

--- Blocks until a starbase upgrade is complete.
---@param player userdata
---@param planet userdata
---@return userdata
function WaitForStarbase(player, planet) end

--- Projects a position outward from a unit by its weapon range.
---@param unit userdata
---@param target userdata
---@return userdata
function Project_By_Unit_Range(unit, target) end

--- Checks if two objects are on opposite sides of a shield.
---@param objectA userdata
---@param objectB userdata
---@return boolean
function Are_On_Opposite_Sides_Of_Shield(objectA, objectB) end

--- Checks if a point is in a nebula.
---@param position userdata
---@return boolean
function Is_Point_In_Nebula(position) end

--- Checks if a point is in an ion storm.
---@param position userdata
---@return boolean
function Is_Point_In_Ion_Storm(position) end

--- Checks if a point is in an asteroid field.
---@param position userdata
---@return boolean
function Is_Point_In_Asteroid_Field(position) end

--- Returns true if this is a campaign game.
---@return boolean
function Is_Campaign_Game() end

--- Returns true if this is a multiplayer game.
---@return boolean
function Is_Multiplayer_Mode() end

--- Blocks forever (used in AI scripts to keep a coroutine alive).
---@return userdata
function BlockForever() end

-- ── FOW / Objective ──────────────────────────────────────────────────────────

--- Reveals or hides fog of war for a region.
---@param player userdata
---@param position userdata
---@param radius number
---@param reveal boolean
function FogOfWar(player, position, radius, reveal) end

--- Adds an objective entry to the UI.
---@param text string
---@param status string
function Add_Objective(text, status) end

-- ── Camera ───────────────────────────────────────────────────────────────────

--- Points the camera at a position.
---@param position userdata
function Point_Camera_At(position) end

--- Scrolls the camera to a position.
---@param position userdata
---@param trackObject userdata
function Scroll_Camera_To(position, trackObject) end

--- Makes the camera follow a game object.
---@param object userdata
---@param immediate boolean
function Camera_To_Follow(object, immediate) end

--- Zooms the camera to a percentage.
---@param zoom number
---@param immediate boolean
function Zoom_Camera(zoom, immediate) end

--- Rotates the camera by an angle over time.
---@param angle number
---@param time number
function Rotate_Camera_By(angle, time) end

--- Rotates the camera to an absolute angle over time.
---@param angle number
---@param time number
---@param shortest boolean
function Rotate_Camera_To(angle, time, shortest) end

--- Starts cinematic camera mode.
---@param resumeSound boolean
function Start_Cinematic_Camera(resumeSound) end

--- Ends cinematic camera mode.
function End_Cinematic_Camera() end

--- Sets a cinematic target key frame.
---@param position userdata
---@param distance number
---@param pitch number
---@param yaw number
---@param euler boolean
---@param object userdata
---@param useObjectRotation boolean
---@param cinematicAnimation boolean
function Set_Cinematic_Target_Key(position, distance, pitch, yaw, euler, object, useObjectRotation, cinematicAnimation) end

--- Transitions a cinematic target key frame.
---@param position userdata
---@param time number
---@param distance number
---@param pitch number
---@param yaw number
---@param euler boolean
---@param object userdata
---@param useObjectRotation boolean
---@param cinematicAnimation boolean
function Transition_Cinematic_Target_Key(position, time, distance, pitch, yaw, euler, object, useObjectRotation, cinematicAnimation) end

--- Sets a cinematic camera key frame.
---@param position userdata
---@param distance number
---@param pitch number
---@param yaw number
---@param euler boolean
---@param object userdata
---@param useObjectRotation boolean
---@param cinematicAnimation boolean
function Set_Cinematic_Camera_Key(position, distance, pitch, yaw, euler, object, useObjectRotation, cinematicAnimation) end

--- Transitions a cinematic camera key frame.
---@param position userdata
---@param time number
---@param distance number
---@param pitch number
---@param yaw number
---@param euler boolean
---@param object userdata
---@param useObjectRotation boolean
---@param cinematicAnimation boolean
function Transition_Cinematic_Camera_Key(position, time, distance, pitch, yaw, euler, object, useObjectRotation, cinematicAnimation) end

--- Transitions back to tactical camera over time.
---@param time number
function Transition_To_Tactical_Camera(time) end

--- Applies a cinematic zoom over time.
---@param time number
---@param delta number
function Cinematic_Zoom(time, delta) end

--- Creates a cinematic transport unit.
---@param typeName string
---@xmlref XmlObject
---@param playerId number
---@param position userdata
---@param angle number
---@param mode number
---@param animDelta number
---@param idleTime number
---@param persist boolean
---@param hintName string
---@return userdata|nil
function Create_Cinematic_Transport(typeName, playerId, position, angle, mode, animDelta, idleTime, persist, hintName) end

--- Hides or shows a game object.
---@param object userdata
---@param hide boolean
function Hide_Object(object, hide) end

--- Hides or shows a sub-object of a game object.
---@param object userdata
---@param hide boolean
---@param subObjectName string
function Hide_Sub_Object(object, hide, subObjectName) end

--- Promotes a game object to the space cinematic render layer.
---@param object userdata
function Promote_To_Space_Cinematic_Layer(object) end

-- ── Screen FX ────────────────────────────────────────────────────────────────

--- Fades the screen to black instantly.
function Fade_On() end

--- Restores the screen from fade instantly.
function Fade_Off() end

--- Enables letterbox overlay instantly.
function Letter_Box_On() end

--- Disables letterbox overlay instantly.
function Letter_Box_Off() end

--- Animates letterbox bars in over time.
---@param time number
function Letter_Box_In(time) end

--- Animates letterbox bars out over time.
---@param time number
function Letter_Box_Out(time) end

--- Fades the screen in from black over time.
---@param time number
function Fade_Screen_In(time) end

--- Fades the screen out to black over time.
---@param time number
function Fade_Screen_Out(time) end

--- Plays a lightning visual effect.
---@param start userdata
---@param finish userdata
function Play_Lightning_Effect(start, finish) end

-- ── Cinematic Mode ───────────────────────────────────────────────────────────

--- Starts cinematic mode (locks controls, etc.).
function Start_Cinematic_Mode() end

--- Ends cinematic mode.
function End_Cinematic_Mode() end

--- Locks or unlocks player controls.
---@param locked boolean
function Lock_Controls(locked) end

--- Suspends or resumes AI processing.
---@param suspended boolean
function Suspend_AI(suspended) end

--- Sets the cinematic environment (sky, lighting).
---@param environment string
function Set_Cinematic_Environment(environment) end

--- Changes the scene environment.
---@param environment string
function Set_New_Environment(environment) end

--- Starts a cinematic space retreat sequence.
function Start_Cinematic_Space_Retreat() end

--- Cleans up after a cinematic ends.
function Do_End_Cinematic_Cleanup() end

--- Resumes hyperspace entry animation.
function Resume_Hyperspace_In() end

-- ── UI ───────────────────────────────────────────────────────────────────────

--- Displays a game message.
---@param messageText string
function Game_Message(messageText) end

--- Adds a radar blip at a location.
---@param position userdata
---@param blipType string
function Add_Radar_Blip(position, blipType) end

--- Removes a radar blip.
---@param blip userdata
function Remove_Radar_Blip(blip) end

--- Adds a highlight to a planet icon.
---@param planet userdata
---@param color string
function Add_Planet_Highlight(planet, color) end

--- Removes a planet icon highlight.
---@param planet userdata
function Remove_Planet_Highlight(planet) end

--- Activates the mission retry dialog.
function Activate_Retry_Dialog() end

--- Gets the current game mode string.
---@return string
function Get_Game_Mode() end

-- ── Audio / Music ────────────────────────────────────────────────────────────

--- Plays a music track by name.
---@param trackName string
function Play_Music(trackName) end

--- Stops all music.
function Stop_All_Music() end

--- Resumes the mode-appropriate background music.
function Resume_Mode_Based_Music() end

--- Stops all speech audio.
function Stop_All_Speech() end

--- Removes all text overlays.
function Remove_All_Text() end

--- Allows or disables localized SFX.
---@param allow boolean
function Allow_Localized_SFX(allow) end

--- Restores the master volume after a cinematic.
function Master_Volume_Restore() end

--- Pauses or resumes weather audio.
---@param pause boolean
function Weather_Audio_Pause(pause) end

--- SFXManager: access to SFX event management.
---@type userdata
SFXManager = nil

-- ── Misc ─────────────────────────────────────────────────────────────────────

--- Forces the next weather pattern immediately.
function Force_Weather() end

--- Enables or disables fog of war rendering.
---@param enable boolean
function Enable_Fog(enable) end

--- Enables or disables atmospheric distance fog.
---@param enable boolean
function Enable_Distance_Fog(enable) end

--- Plays a Bink video file.
---@param filename string
---@return userdata
function Play_Bink_Movie(filename) end

--- Stops any playing Bink video.
function Stop_Bink_Movie() end

--- Creates a position object from X, Y, Z coordinates.
---@param x number
---@param y number
---@param z number
---@return userdata
function Create_Position(x, y, z) end

--- Returns the current game time in seconds.
---@return number
function GetCurrentTime() end

--- Returns a seeded random number.
---@param seed number
---@return number
function GameRandom(seed) end

--- Cancels the fast-forward state.
function Cancel_Fast_Forward() end
