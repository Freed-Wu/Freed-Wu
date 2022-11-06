-- https://github.com/liuchengxu/vim-which-key/issues/211
-- don't use incremental_selection
require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    indent = {enable = true},
    highlight = {enable = true, additional_vim_regex_highlighting = true},
    textobjects = {enable = true},
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
-- https://github.com/nvim-treesitter/nvim-treesitter/issues/3692
ft_to_parser.liquid = "html"
