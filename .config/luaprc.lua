local os = require "os"
local prompt = require "prompt"
local style = require "prompt.style"

prompt.prompts = { style.generate_ps1(), "    " }
prompt.history = os.getenv("HOME") .. "/.lua_history"
