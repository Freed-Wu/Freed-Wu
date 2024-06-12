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
    -- https://github.com/nvim-treesitter/nvim-treesitter/pull/6096/
    vim.treesitter.language.register("comment", "text")
    vim.treesitter.language.register("bash", "apkbuild")
    vim.treesitter.language.register("bash", "PKGBUILD")
    vim.treesitter.language.register("bash", "ebuild")
end
vim.api.nvim_create_autocmd("FileType", {
    pattern = "liquid",
    callback = function(args)
        vim.treesitter.start(args.buf, vim.b.liquid_subtype)
        -- only if additional legacy syntax is needed
        -- vim.bo[args.buf].syntax = "on"
    end
})
