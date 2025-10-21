-- luacheck: ignore 112 113
---@diagnostic disable: undefined-global
local CodeStats = require 'code-stats.nvim.codestats'.CodeStats
local codestats = CodeStats {
    dotenv = vim.fs.joinpath(os.getenv("HOME"), ".local/share/zinit/plugins/_pass/codestats.sh"),
}
codestats:create_autocmds()
