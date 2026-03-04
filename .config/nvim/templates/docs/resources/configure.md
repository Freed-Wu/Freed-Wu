# Configure

## (Neo)[Vim](https://www.vim.org)

### [coc.nvim](https://github.com/neoclide/coc.nvim)

```json
{
  "languageserver": {
    "{{ split(expand('%:p:h:h:h:t'), '-')[0] }}": {
      "command": "{{ expand('%:p:h:h:h:t') }}",
      "filetypes": [
        "{{ split(expand('%:p:h:h:h:t'), '-')[0] }}"
      ]
    }
  }
}
```

### [vim-lsp](https://github.com/prabirshrestha/vim-lsp)

```vim
if executable('{{ expand('%:p:h:h:h:t') }}')
  augroup lsp
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
          \ 'name': '{{ split(expand('%:p:h:h:h:t'), '-')[0] }}',
          \ 'cmd': {server_info->['{{ expand('%:p:h:h:h:t') }}']},
          \ 'whitelist': ['{{ split(expand('%:p:h:h:h:t'), '-')[0] }}'],
          \ })
  augroup END
endif
```

## [Neovim](https://neovim.io)

```lua
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "*.{{ split(expand('%:p:h:h:h:t'), '-')[0] }}" },
  callback = function()
    vim.lsp.start({
      name = "{{ split(expand('%:p:h:h:h:t'), '-')[0] }}",
      cmd = { "{{ expand('%:p:h:h:h:t') }}" }
    })
  end,
})
```

## [Emacs](https://www.gnu.org/software/emacs)

```elisp
(make-lsp-client :new-connection
(lsp-stdio-connection
  `(,(executable-find "{{ expand('%:p:h:h:h:t') }}")))
  :activation-fn (lsp-activate-on "*.{{ split(expand('%:p:h:h:h:t'), '-')[0] }}")
  :server-id "{{ split(expand('%:p:h:h:h:t'), '-')[0] }}")))
```

## [Sublime](https://www.sublimetext.com)

```json
{
  "clients": {
    "{{ split(expand('%:p:h:h:h:t'), '-')[0] }}": {
      "command": [
        "{{ expand('%:p:h:h:h:t') }}"
      ],
      "enabled": true,
      "selector": "source.{{ split(expand('%:p:h:h:h:t'), '-')[0] }}"
    }
  }
}
```
