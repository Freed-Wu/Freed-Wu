# my-init.vim

[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![Gitmoji](https://img.shields.io/badge/gitmoji-%20%F0%9F%98%9C%20%F0%9F%98%8D-FFDD67.svg?style=flat-square)](https://gitmoji.dev)

A backup for the configuration of my (neo)vim.

![android](https://user-images.githubusercontent.com/32936898/151281612-aee1f23a-b456-45bf-8291-8f012569b000.jpg)

![windows](https://user-images.githubusercontent.com/32936898/151283506-f44001ba-bbfa-4929-b0c3-86dd377213b6.png)

![linux](https://user-images.githubusercontent.com/32936898/151281635-7daa1f6a-3517-496b-bc63-f327607caa31.png)

![web](https://user-images.githubusercontent.com/32936898/151282068-0c77691f-3f89-4ba6-b1cb-e51bd40d514d.png)

[More Screenshots](https://www.zhihu.com/question/20873523/answer/2185169992)

<!-- mdformat-toc start --slug=github --no-anchors --maxlevel=6 --minlevel=1 -->

- [my-init.vim](#my-initvim)
  - [Structure](#structure)
  - [Note](#note)
  - [Related](#related)

<!-- mdformat-toc end -->

## Structure

```shell
$ tree -L 1
.
├── autoload
├── bitmaps
├── coc-settings.json
├── ftdetect
├── ftplugin
├── init.vim
├── LICENSE
├── lua
├── README.md
├── syntax
├── ultisnips
└── template
```

## Note

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
  the bug have not be reported, ignore the issue id.
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

## Related

- [my-dotfiles](https://github.com/Freed-Wu/my-dotfiles)
