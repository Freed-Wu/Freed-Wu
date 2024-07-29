-- luacheck: ignore 113
---@diagnostic disable: undefined-global
vim.keymap.set('i', '<C-^>', require('rime.nvim').toggle)
-- https://github.com/rime/librime/issues/917
vim.keymap.set('i', '<C-\\>', require('rime.nvim'):callback('<C-\\>'))
