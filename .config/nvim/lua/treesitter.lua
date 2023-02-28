---treesitter config.
-- don't install automatically to avoid network failure
require"nvim-treesitter.configs".setup {
    indent = {enable = true},
    highlight = {enable = true, additional_vim_regex_highlighting = true},
    textobjects = {enable = true}
}

local ft_to_parser = require"nvim-treesitter.parsers".filetype_to_parsername
ft_to_parser.mail = "text"
ft_to_parser.gitcommit = "text"
ft_to_parser.bbcode = "text"
ft_to_parser.bash = "sh"
ft_to_parser.zsh = "sh"
ft_to_parser.vimspec = "vim"
ft_to_parser.tutor = "markdown"
ft_to_parser.pandoc = "markdown"
ft_to_parser.mysql = "sql"
ft_to_parser.eelixir = "elixir"
ft_to_parser.sublime_syntax = "yaml"
-- luacheck: globals vim
---@diagnostic disable-next-line: undefined-global
vim.api.nvim_create_autocmd("FileType", {
    pattern = "liquid",
    callback = function(args)
        ---@diagnostic disable-next-line: undefined-global
        vim.treesitter.start(args.buf, vim.b.liquid_subtype)
        -- only if additional legacy syntax is needed
        ---@diagnostic disable-next-line: undefined-global
        vim.bo[args.buf].syntax = "on"
    end
})
