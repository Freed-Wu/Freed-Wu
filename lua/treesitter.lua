require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    indent = {enable = true},
    highlight = {enable = true, additional_vim_regex_highlighting = true},
    incremental_selection = {enable = true},
    textobjects = {enable = true}
}

local ft_to_parser = require"nvim-treesitter.parsers".filetype_to_parsername
ft_to_parser.sublime_syntax = "yaml"
-- https://github.com/nvim-treesitter/nvim-treesitter/discussions/3628#discussioncomment-3857484
ft_to_parser.liquid = "html"
