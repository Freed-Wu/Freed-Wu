---@diagnostic disable: undefined-global
-- luacheck: ignore 112 113
vim.notify = require "notify"
-- Highlight group 'NotifyBackground' has no background highlight
-- Please provide an RGB hex value or highlight group with a background value
-- for 'background_colour' option.
-- This is the colour that will be used for 100% transparency.
vim.notify.setup({
    background_colour = "#000000",
})
