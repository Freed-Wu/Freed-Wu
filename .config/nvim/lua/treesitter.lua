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
---@diagnostic disable: lowercase-global
vim = vim or {}
if vim.treesitter.language.register then
    vim.treesitter.language.register("mail", "text")
    vim.treesitter.language.register("gitcommit", "text")
    vim.treesitter.language.register("brewfile", "ruby")
    vim.treesitter.language.register("bbcode", "text")
    vim.treesitter.language.register("bash", "sh")
    vim.treesitter.language.register("zsh", "sh")
    vim.treesitter.language.register("vimspec", "vim")
    vim.treesitter.language.register("tutor", "markdown")
    vim.treesitter.language.register("pandoc", "markdown")
    vim.treesitter.language.register("mysql", "sql")
    vim.treesitter.language.register("eelixir", "elixir")
    vim.api.nvim_create_autocmd("FileType", {
        pattern = "liquid",
        callback = function(args)
            vim.treesitter.start(args.buf, vim.b.liquid_subtype)
            -- only if additional legacy syntax is needed
            vim.bo[args.buf].syntax = "on"
        end
    })
end
