---@meta
--- The standard library the engine actually opens - and nothing else. Measured on the game's own
--- interpreter (Lua 5.0.2): it opens the base library, string, table and its own security table.
--- There is no math, io, os or debug table; a script that reads math.floor gets a nil-index error
--- unless a library module defines math itself. Signatures follow the Lua 5.0 reference manual
--- for exactly the names the engine registers. Functions marked (5.0) differ from Lua 5.1.

-- ── base ─────────────────────────────────────────────────────────────────────

---@param message any
---@param level? integer
function error(message, level) end

---@param object any
---@return table|nil
function getmetatable(object) end

---@param table table
---@param metatable table|nil
---@return table
function setmetatable(table, metatable) end

--- (5.0) Returns the environment table of a function or stack level.
---@param f? function|integer
---@return table
function getfenv(f) end

--- (5.0) Sets the environment table of a function or stack level.
---@param f function|integer
---@param table table
function setfenv(f, table) end

---@param table table
---@param index? any
---@return any key, any value
function next(table, index) end

---@param t table
---@return fun(t: table, i: integer): integer, any
---@return table
---@return integer
function ipairs(t) end

---@param t table
---@return fun(t: table, k: any): any, any
---@return table
---@return nil
function pairs(t) end

---@vararg any
function print(...) end

---@param e any
---@param base? integer
---@return number|nil
function tonumber(e, base) end

---@param e any
---@return string
function tostring(e) end

---@param v any
---@return string
function type(v) end

---@param v any
---@param message? any
---@return any
function assert(v, message) end

--- (5.0) Global, not table.unpack.
---@param list table
---@return any ...
function unpack(list) end

---@param v1 any
---@param v2 any
---@return boolean
function rawequal(v1, v2) end

---@param table table
---@param index any
---@return any
function rawget(table, index) end

---@param table table
---@param index any
---@param value any
---@return table
function rawset(table, index, value) end

---@param f function
---@vararg any
---@return boolean ok, any ...
function pcall(f, ...) end

---@param f function
---@param err function
---@return boolean ok, any ...
function xpcall(f, err) end

--- (5.0) Takes no option argument.
function collectgarbage() end

--- (5.0) Memory in use, in kilobytes.
---@return integer
function gcinfo() end

---@param filename string
---@return function|nil chunk, string|nil error
function loadfile(filename) end

---@param filename string
---@return any ...
function dofile(filename) end

---@param string string
---@param chunkname? string
---@return function|nil chunk, string|nil error
function loadstring(string, chunkname) end

--- Loads a module through LUA_PATH; the engine resolves the file through its own file system,
--- mod paths first, then disk, then the archives. The lookup ignores case; the memo of loaded
--- modules does not, so one spelling per module.
---@param modname string
---@return any
function require(modname) end

---@type table
_G = nil

---@type string
_VERSION = nil

--- (5.0) The modules require has loaded, by the exact string they were required with.
---@type table<string, any>
_LOADED = nil

--- (5.0) Inside a vararg function, the table of its extra arguments (with `n`). A local the
--- interpreter creates, declared here so a 5.1 analyzer does not read it as an unknown global.
---@type any[]
arg = nil

-- ── coroutine ────────────────────────────────────────────────────────────────
--- In Lua 5.0.2 the base library opener registers the coroutine table as well. The engine's own
--- library scripts call coroutine.yield from every thread, which is how a thread hands control
--- back to the engine for the next service tick.

---@class coroutinelib
coroutine = {}

---@param f function
---@return thread
function coroutine.create(f) end

---@param co thread
---@vararg any
---@return boolean ok, any ...
function coroutine.resume(co, ...) end

---@param co thread
---@return "running"|"suspended"|"dead"
function coroutine.status(co) end

---@param f function
---@return function
function coroutine.wrap(f) end

---@vararg any
---@return any ...
function coroutine.yield(...) end

-- ── string ───────────────────────────────────────────────────────────────────
--- No string.match, gmatch or reverse: (5.0) gfind is the name of gmatch.

---@class stringlib
string = {}

---@param s string
---@return integer
function string.len(s) end

---@param s string
---@param i integer
---@param j? integer
---@return string
function string.sub(s, i, j) end

---@param s string
---@return string
function string.lower(s) end

---@param s string
---@return string
function string.upper(s) end

---@vararg integer
---@return string
function string.char(...) end

---@param s string
---@param n integer
---@return string
function string.rep(s, n) end

---@param s string
---@param i? integer
---@param j? integer
---@return integer ...
function string.byte(s, i, j) end

---@param formatstring string
---@vararg any
---@return string
function string.format(formatstring, ...) end

---@param func function
---@return string
function string.dump(func) end

---@param s string
---@param pattern string
---@param init? integer
---@param plain? boolean
---@return integer|nil start, integer|nil end, any ...
function string.find(s, pattern, init, plain) end

--- (5.0) The iterator Lua 5.1 calls gmatch.
---@param s string
---@param pattern string
---@return fun(): string, ...
function string.gfind(s, pattern) end

---@param s string
---@param pattern string
---@param repl string|table|function
---@param n? integer
---@return string, integer
function string.gsub(s, pattern, repl, n) end

-- ── table ────────────────────────────────────────────────────────────────────
--- (5.0) getn and setn exist; there is no # operator.

---@class tablelib
table = {}

---@param t table
---@param sep? string
---@param i? integer
---@param j? integer
---@return string
function table.concat(t, sep, i, j) end

---@param t table
---@param f fun(key: any, value: any): any
function table.foreach(t, f) end

---@param t table
---@param f fun(index: integer, value: any): any
function table.foreachi(t, f) end

---@param t table
---@return integer
function table.getn(t) end

---@param t table
---@param n integer
function table.setn(t, n) end

---@param t table
---@param comp? fun(a: any, b: any): boolean
function table.sort(t, comp) end

---@param t table
---@param pos integer|any
---@param value? any
function table.insert(t, pos, value) end

---@param t table
---@param pos? integer
---@return any
function table.remove(t, pos) end
