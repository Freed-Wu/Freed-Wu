---treesitter config.
-- don't install automatically to avoid network failure
require "nvim-treesitter.configs".setup {
    indent = { enable = true },
    highlight = { enable = true },
    -- https://github.com/nvim-treesitter/nvim-treesitter-context/issues/340
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["ie"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
            },
            selection_modes = {
                ['@parameter.outer'] = 'v',
                ['@function.outer'] = 'V',
                ['@class.outer'] = '<c-v>',
            },
            include_surrounding_whitespace = true,
        },
        swap = {
            enable = true,
            swap_next = {
                ["=;"] = "@parameter.inner",
            },
            swap_previous = {
                ["=,"] = "@parameter.inner",
            },
        },
    },
}

-- luacheck: ignore 111 112 113
---@diagnostic disable: undefined-global
vim.api.nvim_create_autocmd("User", {
    pattern = "AirlineAfterInit",
    callback = function(_)
        vim.g.airline_section_x = vim.fn["airline#section#create_right"]({
            '%{empty(nvim_treesitter#statusline()) ? "" : '
            .. 'nvim_treesitter#statusline() . g:airline_right_alt_sep}',
            'filetype',
        })
    end
})
