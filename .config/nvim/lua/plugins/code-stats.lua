-- luacheck: ignore 112 113
---@diagnostic disable: undefined-global
require "code-stats".setup({
    args = {
        headers = {
            ['X-API-Token'] = io.open(vim.fs.joinpath(os.getenv("HOME"), ".local/share/zinit/plugins/.pass/codestats.txt"), "r"):read()
        }
    }
})
