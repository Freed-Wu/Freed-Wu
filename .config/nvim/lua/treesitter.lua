---treesitter config.
-- don't install automatically to avoid network failure
require "nvim-treesitter.configs".setup {
    indent = { enable = true },
    highlight = { enable = true, additional_vim_regex_highlighting = true },
    textobjects = { enable = true }
}

-- luacheck: globals vim
---@diagnostic disable: undefined-global
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
