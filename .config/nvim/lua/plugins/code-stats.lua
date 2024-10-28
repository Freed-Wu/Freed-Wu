-- luacheck: ignore 112 113
---@diagnostic disable: undefined-global
require "code-stats".setup({
    dotenv = vim.fs.joinpath(os.getenv("HOME"), ".local/share/zinit/plugins/.pass/codestats.sh"),
})
