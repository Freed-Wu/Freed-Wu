local os = require "os"
local prompt = require "prompt"
local prompt_style = require "prompt-style"

prompt.prompts = { prompt_style.generate_ps1(), "    " }
prompt.history = os.getenv("HOME") .. "/.lua_history"
