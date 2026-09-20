-- luacheck: ignore 113
---@diagnostic disable: undefined-global
loadfile(vim.fn.expand("~/.config/luaprc.lua"))()
