---@diagnostic disable: undefined-global
-- luacheck: ignore 112 113
require 'zhihu'.setup {
    article = {
        authorName = "Freed-wzy"
    }
}

vim.keymap.set({'i'}, '<C-Q>', require'zhihu.nvim'.input)
