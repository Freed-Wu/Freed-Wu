# my-init.vim

[![pre-commit.ci status](https://results.pre-commit.ci/badge/github/Freed-Wu/my-init.vim/master.svg)](https://results.pre-commit.ci/latest/github/Freed-Wu/my-init.vim/master)

[![github/downloads](https://shields.io/github/downloads/Freed-Wu/my-init.vim/total)](https://github.com/Freed-Wu/my-init.vim/releases)
[![github/downloads/latest](https://shields.io/github/downloads/Freed-Wu/my-init.vim/latest/total)](https://github.com/Freed-Wu/my-init.vim/releases/latest)
[![github/issues](https://shields.io/github/issues/Freed-Wu/my-init.vim)](https://github.com/Freed-Wu/my-init.vim/issues)
[![github/issues-closed](https://shields.io/github/issues-closed/Freed-Wu/my-init.vim)](https://github.com/Freed-Wu/my-init.vim/issues?q=is%3Aissue+is%3Aclosed)
[![github/issues-pr](https://shields.io/github/issues-pr/Freed-Wu/my-init.vim)](https://github.com/Freed-Wu/my-init.vim/pulls)
[![github/issues-pr-closed](https://shields.io/github/issues-pr-closed/Freed-Wu/my-init.vim)](https://github.com/Freed-Wu/my-init.vim/pulls?q=is%3Apr+is%3Aclosed)
[![github/discussions](https://shields.io/github/discussions/Freed-Wu/my-init.vim)](https://github.com/Freed-Wu/my-init.vim/discussions)
[![github/milestones](https://shields.io/github/milestones/all/Freed-Wu/my-init.vim)](https://github.com/Freed-Wu/my-init.vim/milestones)
[![github/forks](https://shields.io/github/forks/Freed-Wu/my-init.vim)](https://github.com/Freed-Wu/my-init.vim/network/members)
[![github/stars](https://shields.io/github/stars/Freed-Wu/my-init.vim)](https://github.com/Freed-Wu/my-init.vim/stargazers)
[![github/watchers](https://shields.io/github/watchers/Freed-Wu/my-init.vim)](https://github.com/Freed-Wu/my-init.vim/watchers)
[![github/contributors](https://shields.io/github/contributors/Freed-Wu/my-init.vim)](https://github.com/Freed-Wu/my-init.vim/graphs/contributors)
[![github/commit-activity](https://shields.io/github/commit-activity/w/Freed-Wu/my-init.vim)](https://github.com/Freed-Wu/my-init.vim/graphs/commit-activity)
[![github/last-commit](https://shields.io/github/last-commit/Freed-Wu/my-init.vim)](https://github.com/Freed-Wu/my-init.vim/commits)
[![github/release-date](https://shields.io/github/release-date/Freed-Wu/my-init.vim)](https://github.com/Freed-Wu/my-init.vim/releases/latest)

[![github/license](https://shields.io/github/license/Freed-Wu/my-init.vim)](https://github.com/Freed-Wu/my-init.vim/blob/master/LICENSE)
![github/languages](https://shields.io/github/languages/count/Freed-Wu/my-init.vim)
![github/languages/top](https://shields.io/github/languages/top/Freed-Wu/my-init.vim)
![github/directory-file-count](https://shields.io/github/directory-file-count/Freed-Wu/my-init.vim)
![github/code-size](https://shields.io/github/languages/code-size/Freed-Wu/my-init.vim)
![github/repo-size](https://shields.io/github/repo-size/Freed-Wu/my-init.vim)
![github/v](https://shields.io/github/v/release/Freed-Wu/my-init.vim)

A backup of the configuration of my (neo)vim.

![android](https://user-images.githubusercontent.com/32936898/151281612-aee1f23a-b456-45bf-8291-8f012569b000.jpg)

![windows](https://user-images.githubusercontent.com/32936898/151283506-f44001ba-bbfa-4929-b0c3-86dd377213b6.png)

![linux](https://user-images.githubusercontent.com/32936898/151281635-7daa1f6a-3517-496b-bc63-f327607caa31.png)

![web](https://user-images.githubusercontent.com/32936898/151282068-0c77691f-3f89-4ba6-b1cb-e51bd40d514d.png)

[More Screenshots](https://www.zhihu.com/question/20873523/answer/2185169992)

<!-- mdformat-toc start --slug=github --no-anchors --maxlevel=6 --minlevel=2 -->

- [Note](#note)
- [Related](#related)

<!-- mdformat-toc end -->

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

`rg '" https://github\.com/[^/]+/[^/]+/issues/\d+'` to see all found bugs of
plugins.

## Related

- [my-dotfiles](https://github.com/Freed-Wu/my-dotfiles)
