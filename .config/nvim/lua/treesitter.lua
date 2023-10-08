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
local coc_filetype_map = {
    brewfile = "ruby",
    vimspec = "vim",
    tutor = "markdown",
    pandoc = "markdown",
    mysql = "sql",
    eelixir = "elixir",
}
-- https://github.com/neoclide/coc.nvim/issues/4282#issuecomment-1279692192
vim.g.coc_filetype_map = {
    bash = "sh",
    zsh = "sh",
    PKGBUILD = "sh",
    ebuild = "sh",
    liquid = "html",
}
---@diagnostic disable-next-line: undefined-global
for i, v in pairs(coc_filetype_map) do
    if vim.treesitter.language.register then
        vim.treesitter.language.register(i, v)
    end
    vim.g.coc_filetype_map[i] = v
end
if vim.treesitter.language.register then
    -- :help coc-document-filetype
    vim.treesitter.language.register("javascript.jsx", "javascriptreact")
    vim.treesitter.language.register("typescript.jsx", "typescriptreact")
    vim.treesitter.language.register("typescript.tsx", "typescriptreact")
    vim.treesitter.language.register("tex", "latex")
    vim.api.nvim_create_autocmd("FileType", {
        pattern = "liquid",
        callback = function(args)
            vim.treesitter.start(args.buf, vim.b.liquid_subtype)
            -- only if additional legacy syntax is needed
            vim.bo[args.buf].syntax = "on"
        end
    })
end
