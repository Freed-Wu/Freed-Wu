-- luacheck: ignore 113
---@diagnostic disable: undefined-global
local rime = require('rime.nvim')
vim.keymap.set('i', '<C-^>', rime.toggle)
vim.keymap.set('i', '<C-\\>', rime.callback('<C-\\>'))
