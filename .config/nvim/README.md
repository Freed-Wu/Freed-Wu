# nvim

- According to google style guide, use 2 spaces to indent and maximum
  characters of a line is 78.
- Use `syntax` as default `foldmethod`.
- Use `XDG_BASE_DIR` to store configuration, data and cache of plugins.
- `ftplugin/*.vim` use `<buffer>` for `map` and `autocmd`, and use `setlocal`
  and `let &l:foo`.
- `augroup` name is `init#foo` for `autoload/init/foo.vim` and `init_foo` for
  `ftplugin/foo.vim`
- If plugin `foo-bar.vim` is a plugin of another plugin `foo.vim`, replace
  `autoload/init/foo_bar.vim` with `autoload/init/foo/bar.vim`.
- Use vim standard key name, e.g. Replace `<c-w>` with `<C-W>`, Replace
  `<plug>` with `<Plug>`.
- Add necessary comments.
- If a file don't use default option (e.g. `foldmethod`, `path`), write
  `modeline`.
- `init.vim` classifies all plugins to various categories.
- Write the issue URL of a plugin's bug followed by an optional instrument. If
  the bug have not been reported, ignore the issue ID.
- Configure all plugins like this:

```vim
  call dein#add('kana/vim-smartinput', {
        \ 'on_event': ['InsertEnter', 'CmdlineEnter'],
        \ 'hook_source': 'call init#smartinput#source()',
        \ 'hook_post_source': 'call init#smartinput#post_source()',
        \ })
```

`init#smartinput#source()` and `init#smartinput#post_source()` store
configurations like global variables, `map`s, `augroup` etc.
`smartinput` is normalized name of `vim-smartinput`. See
`:h dein-options-normalized_name`. Because vim script don't allow function name
to contain `-`, replace `-` with `_`.

If one plugin cannot work, we can find rapidly which plugin is conflict with
it by deleting `dein#add()`.

`rg '" https://github\.com/[^/]+/[^/]+/issues/\d+'` to see all found bugs of
plugins.
