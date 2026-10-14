---@meta
--- PGDebug.lua, the vanilla library (Data/Scripts/Library/PGDebug.lua). Hand-maintained; the prose was
--- migrated from the documentation site's library page on 2026-10-14; a type the page did not
--- give was inferred from how the library source uses the value (tools/docsync/infer_types.py),
--- and `any` is one the source does not settle. Every name here is a
--- global the library defines when a script requires it.
--- Requires: nothing.

--- Functions

--- Opens a message box that contains the handled event and its parameters.
--- Triggers a MessageBox with information on the event and parameters.
---@param event any
---@param params any
function DebugEventAlert(event, params) end

--- Opens a message box that contains the input string.
--- Triggers a MessageBox with the formatted string.
---@vararg any
function MessageBox(...) end

--- Prints a message to the `AILog.txt` if the command `aiff script` has been used in the ingame console.
--- Logs the formatted string in the AI log.
---@vararg any
function ScriptMessage(...) end

--- Prints a debug message to the `AILog.txt` if the command `aiff script` has been used in the ingame console.
--- Logs the formatted string in the AI log.
---@vararg any
function DebugMessage(...) end

--- Prints a debug message directly to the `LogFile.txt`.
--- Usually used as error log.
--- Logs the formatted string in the log file.
---@vararg any
function OutputDebug(...) end

--- Prints an error log to `LogFile.txt` and `AILog.txt` including a stack trace, then calls `ScriptExit()`, which stops the whole script.
--- Logs the formatted string in the log file and the AI log and exits the script.
---@vararg any
function ScriptError(...) end

--- Unpacks a table and prints its content to the `AILog.txt` if the command `aiff script` has been used in the ingame console.
--- warning:
--- Only designed to unwrap tables that directly contain objects. Not suitable to unwrap any table.
--- Prints all values to the AI log.
---@param unit_table table
function DebugPrintTable(unit_table) end
