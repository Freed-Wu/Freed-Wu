---@diagnostic disable: undefined-global
-- luacheck: ignore 112 113
require 'zhihu'.setup {
    article = {
        authorName = "Freed-wzy"
    }
}

vim.keymap.set({'i'}, '<C-L>', require'zhihu.nvim'.input)
