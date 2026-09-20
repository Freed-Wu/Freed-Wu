local prompt = require "prompt"
local os = require "os"
local style = require "prompt.style"

prompt.prompts = { style.generate_ps1(), "    " }
prompt.history = os.getenv("HOME") .. "/.lua_history"
-- https://github.com/dpapavas/luaprompt/pull/23
prompt.escape_strings = false
