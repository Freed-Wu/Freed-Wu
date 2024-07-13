-- luacheck: ignore 113
---@diagnostic disable: undefined-global
vim.keymap.set('i', '<C-^>', require('nvim-rime').toggle)
-- https://github.com/rime/librime/issues/917
vim.keymap.set('i', '<C-\\>', require('nvim-rime'):callback('<C-\\>'))
