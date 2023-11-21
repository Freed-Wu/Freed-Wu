# Configure

- For windows, change `~/.config` to `~/AppData/Local`
- For macOS, change `~/.config` to `~/Library`

## (Neo)[Vim](https://www.vim.org)

For vim:

- Change `~/.config/nvim` to `~/.vim`
- Change `init.vim` to `vimrc`

### [coc.nvim](https://github.com/neoclide/coc.nvim)

`~/.config/nvim/coc-settings.json`:

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

`~/.config/nvim/init.vim`:

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

`~/.config/nvim/init.lua`:

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

`~/.emacs.d/init.el`:

```lisp
(make-lsp-client :new-connection
(lsp-stdio-connection
  `(,(executable-find "{{ expand('%:p:h:h:h:t') }}")))
  :activation-fn (lsp-activate-on "*.{{ split(expand('%:p:h:h:h:t'), '-')[0] }}")
  :server-id "{{ split(expand('%:p:h:h:h:t'), '-')[0] }}")))
```

## [Helix](https://helix-editor.com/)

`~/.config/helix/languages.toml`:

```toml
[[language]]
name = "{{ split(expand('%:p:h:h:h:t'), '-')[0] }}"
language-servers = [ "{{ expand('%:p:h:h:h:t') }}",]

[language_server.{{ expand('%:p:h:h:h:t') }}]
command = "{{ expand('%:p:h:h:h:t') }}"
```

## [KaKoune](https://kakoune.org/)

### [kak-lsp](https://github.com/kak-lsp/kak-lsp)

`~/.config/kak-lsp/kak-lsp.toml`:

```toml
[language_server.{{ expand('%:p:h:h:h:t') }}]
filetypes = [ "{{ split(expand('%:p:h:h:h:t'), '-')[0] }}",]
command = "{{ expand('%:p:h:h:h:t') }}"
```

## [Sublime](https://www.sublimetext.com)

`~/.config/sublime-text-3/Packages/Preferences.sublime-settings`:

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

## [Visual Studio Code](https://code.visualstudio.com/)

[An official support of generic LSP client is pending](https://github.com/microsoft/vscode/issues/137885).

### [vscode-glspc](https://gitlab.com/ruilvo/vscode-glspc)

`~/.config/Code/User/settings.json`:

```json
{
  "glspc.serverPath": "{{ expand('%:p:h:h:h:t') }}",
  "glspc.languageId": "{{ split(expand('%:p:h:h:h:t'), '-')[0] }}"
}
```
