scriptencoding utf-8

function! init#smartinput#source() abort
  let g:smartinput_break_undo = 1
endfunction

function! init#smartinput#post_source() abort
  if get(g:, 'smartinput_break_undo', 0) || v:version < 800
    let left = '<Left>'
    let right = '<Right>'
  else
    let left = '<C-G>U<Left>'
    let right = '<C-G>U<Right>'
  endif

  " AsymetricDelimiter {{{1 "
  " ZH {{{2 "
  call smartinput#map_to_trigger('i', '（', '（', '（')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '（',
        \ 'input': '（）' . left,
        \ })
  call smartinput#map_to_trigger('i', '）', '）', '）')
  call smartinput#define_rule({
        \ 'at': '\%#\_s*）',
        \ 'char': '）',
        \ 'input': '<C-R>=smartinput#_leave_block(''）'')<Enter>' . right,
        \ })
  call smartinput#define_rule({
        \ 'at': '（\%#）',
        \ 'char': '<BS>',
        \ 'input': '<BS><Del>',
        \ })
  call smartinput#define_rule({
        \ 'at': '（）\%#',
        \ 'char': '<BS>',
        \ 'input': '<BS><BS>',
        \ })

  call smartinput#map_to_trigger('i', '《', '《', '《')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '《',
        \ 'input': '《》' . left,
        \ })
  call smartinput#map_to_trigger('i', '》', '》', '》')
  call smartinput#define_rule({
        \ 'at': '\%#\_s*》',
        \ 'char': '》',
        \ 'input': '<C-R>=smartinput#_leave_block(''》'')<Enter>' . right,
        \ })
  call smartinput#define_rule({
        \ 'at': '《\%#》',
        \ 'char': '<BS>',
        \ 'input': '<BS><Del>',
        \ })
  call smartinput#define_rule({
        \ 'at': '《》\%#',
        \ 'char': '<BS>',
        \ 'input': '<BS><BS>',
        \ })

  call smartinput#map_to_trigger('i', '【', '【', '【')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '【',
        \ 'input': '【】' . left,
        \ })
  call smartinput#map_to_trigger('i', '】', '】', '】')
  call smartinput#define_rule({
        \ 'at': '\%#\_s*】',
        \ 'char': '】',
        \ 'input': '<C-R>=smartinput#_leave_block(''】'')<Enter>' . right,
        \ })
  call smartinput#define_rule({
        \ 'at': '【\%#】',
        \ 'char': '<BS>',
        \ 'input': '<BS><Del>',
        \ })
  call smartinput#define_rule({
        \ 'at': '【】\%#',
        \ 'char': '<BS>',
        \ 'input': '<BS><BS>',
        \ })

  call smartinput#map_to_trigger('i', '『', '『', '『')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '『',
        \ 'input': '『』' . left,
        \ })
  call smartinput#map_to_trigger('i', '』', '』', '』')
  call smartinput#define_rule({
        \ 'at': '\%#\_s*』',
        \ 'char': '』',
        \ 'input': '<C-R>=smartinput#_leave_block(''』'')<Enter>' . right,
        \ })
  call smartinput#define_rule({
        \ 'at': '『\%#』',
        \ 'char': '<BS>',
        \ 'input': '<BS><Del>',
        \ })
  call smartinput#define_rule({
        \ 'at': '『』\%#',
        \ 'char': '<BS>',
        \ 'input': '<BS><BS>',
        \ })

  call smartinput#map_to_trigger('i', '‘', '‘', '‘')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '‘',
        \ 'input': '‘’' . left,
        \ })
  call smartinput#map_to_trigger('i', '’', '’', '’')
  call smartinput#define_rule({
        \ 'at': '\%#\_s*’',
        \ 'char': '’',
        \ 'input': '<C-R>=smartinput#_leave_block(''’'')<Enter>' . right,
        \ })
  call smartinput#define_rule({
        \ 'at': '‘\%#’',
        \ 'char': '<BS>',
        \ 'input': '<BS><Del>',
        \ })
  call smartinput#define_rule({
        \ 'at': '‘’\%#',
        \ 'char': '<BS>',
        \ 'input': '<BS><BS>',
        \ })

  call smartinput#map_to_trigger('i', '“', '“', '“')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '“',
        \ 'input': '“”' . left,
        \ })
  call smartinput#map_to_trigger('i', '”', '”', '”')
  call smartinput#define_rule({
        \ 'at': '\%#\_s*”',
        \ 'char': '”',
        \ 'input': '<C-R>=smartinput#_leave_block(''”'')<Enter>' . right,
        \ })
  call smartinput#define_rule({
        \ 'at': '“\%#”',
        \ 'char': '<BS>',
        \ 'input': '<BS><Del>',
        \ })
  call smartinput#define_rule({
        \ 'at': '“”\%#',
        \ 'char': '<BS>',
        \ 'input': '<BS><BS>',
        \ })
  " 2}}} ZH "

  " EN {{{2 "
  call smartinput#define_rule({
        \ 'at': '\[\%#]',
        \ 'char': '<CR>',
        \ 'input': '<CR><CR><Up><TAB>',
        \ })
  " don't map {<CR>} or [<CR>] to avoid wrong indent
  call smartinput#map_to_trigger('i', '%', '%', '%')
  call smartinput#define_rule({
        \ 'at': '{\%#}',
        \ 'char': '%',
        \ 'input': '%%' . left,
        \ 'filetype': ['liquid', 'htmldjango', 'jinja2'],
        \ })
  call smartinput#define_rule({
        \ 'at': '{\%#}',
        \ 'char': '#',
        \ 'input': '##' . left,
        \ 'filetype': ['liquid', 'htmldjango', 'jinja2'],
        \ })

  call smartinput#map_to_trigger('i', '-*-', '-*-', '-*-')
  call smartinput#define_rule({
        \ 'at': '\s\%#',
        \ 'char': '-*-',
        \ 'input': '-*-  -*-' . left . left . left . left,
        \ })

  " https://github.com/kana/vim-smartinput/issues/70
  call smartinput#map_to_trigger('i', '<Space>', '<Space>', '<Space>')
  call smartinput#define_rule({
        \ 'at': '(\%#)',
        \ 'char': '<Space>',
        \ 'input': '<Space><Space>' . left,
        \ })
  call smartinput#define_rule({
        \ 'at': '\[\%#]',
        \ 'char': '<Space>',
        \ 'input': '<Space><Space>' . left,
        \ })
  call smartinput#define_rule({
        \ 'at': '{\%#}',
        \ 'char': '<Space>',
        \ 'input': '<Space><Space>' . left,
        \ })
  call smartinput#define_rule({
        \ 'at': '%\%#%',
        \ 'char': '<Space>',
        \ 'input': '<Space><Space>' . left,
        \ })
  call smartinput#define_rule({
        \ 'at': '#\%##',
        \ 'char': '<Space>',
        \ 'input': '<Space><Space>' . left,
        \ })
  call smartinput#define_rule({
        \ 'at': '%\%#%',
        \ 'char': '-',
        \ 'input': '--' . left,
        \ })
  call smartinput#define_rule({
        \ 'at': '( \%# )',
        \ 'char': '<BS>',
        \ 'input': '<BS><Del>',
        \ })
  call smartinput#define_rule({
        \ 'at': '\[ \%# ]',
        \ 'char': '<BS>',
        \ 'input': '<BS><Del>',
        \ })
  call smartinput#define_rule({
        \ 'at': '{ \%# }',
        \ 'char': '<BS>',
        \ 'input': '<BS><Del>',
        \ })
  call smartinput#define_rule({
        \ 'at': '% \%# %',
        \ 'char': '<BS>',
        \ 'input': '<BS><Del>',
        \ })
  call smartinput#define_rule({
        \ 'at': '%-\%#-%',
        \ 'char': '<BS>',
        \ 'input': '<BS><Del>',
        \ })

  call smartinput#define_rule({
        \ 'at': '``\%#',
        \ 'char': '`',
        \ 'input': '``' . left . left,
        \ 'filetype': ['rst'],
        \ })
  call smartinput#define_rule({
        \ 'at': '``\%#``',
        \ 'char': '<BS>',
        \ 'input': '<BS><BS><Del><Del>',
        \ 'filetype': ['rst'],
        \ })
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '`',
        \ 'input': "`'" . left,
        \ 'filetype': ['tex', 'm4'],
        \ })
  call smartinput#define_rule({
        \ 'at': '`\%#''',
        \ 'char': '<BS>',
        \ 'input': '<BS><Del>',
        \ 'filetype': ['tex'],
        \ })
  call smartinput#define_rule({
        \ 'at': '`''\%#',
        \ 'char': '<BS>',
        \ 'input': '<BS><BS>',
        \ 'filetype': ['tex'],
        \ })
  call smartinput#define_rule({
        \ 'at': '``''''\%#',
        \ 'char': '<BS>',
        \ 'input': '<BS><BS><BS><BS>',
        \ 'filetype': ['tex'],
        \ })

  call smartinput#map_to_trigger('i', '(', '(', '(')
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '(',
        \ 'input': ' ()' . left,
        \ 'filetype': ['text'],
        \ })

  call smartinput#map_to_trigger('i', '<<<', '<<<', '<<<')
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '<<<',
        \ 'input': '<<<>>>' . left . left . left,
        \ })

  call smartinput#map_to_trigger('i', '<', '<', '<')
  call smartinput#define_rule({
        \ 'at': '[^ $]\%#',
        \ 'char': '<',
        \ 'input': ' < ',
        \ })
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '<',
        \ 'input': ' < ',
        \ 'filetype': ['pandoc'],
        \ 'syntax': ['pandocLaTeXMathBlock']
        \ })
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '<',
        \ 'input': '<lt>>' . left,
        \ 'filetype': ['pandoc', 'rst', 'neomuttrc', 'muttrc'],
        \ })
  call smartinput#define_rule({
        \ 'at': '[^$]\%#',
        \ 'char': '<',
        \ 'input': '<lt>>' . left,
        \ 'syntax': ['Comment', 'String', 'Special', 'Constant',
        \ 'DraculaComment', 'DraculaYellow', 'DraculaPink'],
        \ })
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '<',
        \ 'input': '<lt>>' . left,
        \ 'filetype': ['vim', 'html', 'xml', 'xhtml', 'dot', 'pandoc',
        \ 'markdown', 'gfimarkdown', 'liquid', 'text', 'tex', 'plaintex',
        \ 'context'],
        \ })

  call smartinput#map_to_trigger('i', '>', '>', '>')
  call smartinput#define_rule({
        \ 'at': '\%#\_s*>',
        \ 'char': '>',
        \ 'input': '<C-R>=smartinput#_leave_block(''>'')<Enter>' . right,
        \ 'filetype': ['vim', 'rst', 'neomuttrc', 'muttrc'],
        \ })
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '>',
        \ 'input': '>',
        \ 'filetype': ['html', 'xml', 'xhtml', 'liquid', 'pandoc'],
        \ })
  call smartinput#define_rule({
        \ 'at': '<\%#>',
        \ 'char': '<BS>',
        \ 'input': '<BS><Del>',
        \ })
  call smartinput#define_rule({
        \ 'at': '<>\%#',
        \ 'char': '<BS>',
        \ 'input': '<BS><BS>',
        \ })
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '>',
        \ 'input': ' > ',
        \ })
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '>',
        \ 'input': '><CR><C-U><CR><lt><Up><Tab>',
        \ 'filetype': ['help'],
        \ })
  call smartinput#define_rule({
        \ 'at': '^\%#\(\S\|$\)',
        \ 'char': '>',
        \ 'input': '> ',
        \ 'filetype': ['pandoc', 'markdown', 'gfimarkdown'],
        \ })

  call smartinput#map_to_trigger('i', '#', '#', '#')
  call smartinput#define_rule({
        \   'at': '\%#',
        \   'char': '#',
        \   'input': '#{}' . left,
        \   'filetype': ['ruby'],
        \   'syntax': ['Constant', 'Special'],
        \ })
  " 2}}} EN "
  " 1}}} AsymetricDelimiter "

  " SymetricDelimiter {{{1 "
  call smartinput#map_to_trigger('i', '$', '$', '$')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '$',
        \ 'input': '$$' . left,
        \ 'filetype': ['tex', 'plaintex', 'context', 'pandoc', 'markdown', 'gfimarkdown', 'csv', 'octave', 'matlab', 'python'],
        \ })
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '$',
        \ 'input': '$',
        \ 'filetype': ['pandoc', 'markdown'],
        \ 'syntax': ['pandocDelimitedCodeBlock'],
        \ })
  call smartinput#define_rule({
        \ 'at': '\\\%#',
        \ 'char': '$',
        \ 'input': '$' . left,
        \ 'filetype': ['tex', 'plaintex', 'context', 'pandoc', 'markdown', 'gfimarkdown', 'csv', 'octave', 'matlab', 'python'],
        \ })
  call smartinput#define_rule({
        \ 'at': '\$\%#\$',
        \ 'char': '<BS>',
        \ 'input': '<BS><Del>',
        \ })
  call smartinput#define_rule({
        \ 'at': '\$\$\%#',
        \ 'char': '<BS>',
        \ 'input': '<BS><BS>',
        \ })
  " 1}}} SymetricDelimiter "

  " Three {{{1 "
  call smartinput#map_to_trigger('i', '?', '?', '?')
  call smartinput#define_rule({
        \ 'at': '[^\\]\%#',
        \ 'char': '?',
        \ 'input': ' ?  : ' . left . left . left,
        \ 'filetype': ['c', 'cpp', 'julia', 'vim'],
        \ })
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '?',
        \ 'input': ' ? ',
        \ 'filetype': ['nix'],
        \ })
  " 1}}} Three "

  " One {{{1 "
  call smartinput#map_to_trigger('i', ':', ':', ':')
  call smartinput#define_rule({
        \ 'at': '[^?]\%#',
        \ 'char': ':',
        \ 'input': ': ',
        \ 'filetype': ['text', 'json', 'jsonc', 'yaml', 'sublime_syntax',
        \ 'python', 'c', 'javascript', 'typescript'],
        \ })
  call smartinput#define_rule({
        \ 'at': '\(with\|if\|else\|elseif\|for\|while\) .*\%#',
        \ 'char': ':',
        \ 'input': ':',
        \ 'filetype': ['python'],
        \ })
  call smartinput#define_rule({
        \ 'at': '\[[^\]]*\%#',
        \ 'char': ':',
        \ 'input': ':',
        \ 'filetype': ['python'],
        \ })

  call smartinput#map_to_trigger('i', '::', '::', '::')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '::',
        \ 'input': '::',
        \ })

  call smartinput#map_to_trigger('i', ':=', ':=', ':=')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': ':=',
        \ 'input': ' := ',
        \ })

  call smartinput#map_to_trigger('i', ',', ',', ',')
  call smartinput#define_rule({
        \ 'at': '\%#\(\S\|$\)',
        \ 'char': ',',
        \ 'input': ', ',
        \ })
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': ',',
        \ 'input': ',',
        \ 'filetype': ['csv', 'muttrc', 'fstab', 'tmux'],
        \ })
  call smartinput#define_rule({
        \ 'at': '\%#$',
        \ 'char': ',',
        \ 'input': ',',
        \ 'filetype': ['json', 'jsonc'],
        \ })

  call smartinput#map_to_trigger('i', ';', ';', ';')
  call smartinput#define_rule({
        \ 'at': '([^)]*\%#',
        \ 'char': ';',
        \ 'input': '; ',
        \ })

  call smartinput#map_to_trigger('i', '!', '!', '!')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '!',
        \ 'input': '! ',
        \ 'filetype': ['text'],
        \ })

  call smartinput#define_rule({
        \ 'at': '[^(}\*\+?]\%#',
        \ 'char': '?',
        \ 'input': '? ',
        \ })
  " 1}}} One "

  " Two {{{1 "
  " Operation {{{2 "
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '?',
        \ 'input': ' ? ',
        \ 'filetype': ['cs'],
        \ })

  call smartinput#map_to_trigger('i', '&', '&', '&')
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '&',
        \ 'input': ' & ',
        \ 'filetype': ['tex', 'pandoc'],
        \ })

  call smartinput#map_to_trigger('i', '..', '..', '..')
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '..',
        \ 'input': ' .. ',
        \ 'filetype': ['vim', 'lua'],
        \ })

  call smartinput#map_to_trigger('i', '...', '...', '...')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '...',
        \ 'input': '...',
        \ })

  call smartinput#map_to_trigger('i', '<<', '<<', '<<')
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '<<',
        \ 'input': ' << ',
        \ })

  call smartinput#map_to_trigger('i', '<<<', '<<<', '<<<')
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '<<<',
        \ 'input': ' <<< ',
        \ 'filetype': ['sh', 'bash', 'zsh'],
        \ })

  call smartinput#map_to_trigger('i', '>>', '>>', '>>')
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '>>',
        \ 'input': ' >> ',
        \ })

  call smartinput#map_to_trigger('i', '>>>', '>>>', '>>>')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '>>>',
        \ 'input': '>>> ',
        \ })

  call smartinput#map_to_trigger('i', '=', '=', '=')
  " cannot add \S
  call smartinput#define_rule({
        \ 'at': '^[^(]\+\%#',
        \ 'char': '=',
        \ 'input': ' = ',
        \ 'filetype': ['python'],
        \ })
  call smartinput#define_rule({
        \ 'at': '[^ ?+-*/%^|&.:>=<!~]\%#',
        \ 'char': '=',
        \ 'input': ' = ',
        \ })
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '=',
        \ 'input': '=',
        \ 'filetype': ['sh', 'bash', 'zsh', 'PKGBUILD', 'ebuild', 'fstab', 'bib', 'python', 'dot'],
        \ })
  call smartinput#define_rule({
        \ 'at': 'set\(local\)\? .*\%#',
        \ 'char': '=',
        \ 'input': '=',
        \ 'filetype': ['vim'],
        \ })

  call smartinput#map_to_trigger('i', '@', '@', '@')
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '@',
        \ 'input': ' @ ',
        \ 'filetype': ['python'],
        \ })

  call smartinput#map_to_trigger('i', '+', '+', '+')
  call smartinput#define_rule({
        \ 'at': '[^:\s\\+$]\%#\%([^=]\|$\)',
        \ 'char': '+',
        \ 'input': ' + ',
        \ })
  call smartinput#define_rule({
        \ 'at': '${\w\%#}',
        \ 'char': '+',
        \ 'input': '+',
        \ 'filetype': ['sh', 'bash', 'zsh', 'make', 'automake'],
        \ })

  call smartinput#map_to_trigger('i', '-', '-', '-')
  call smartinput#define_rule({
        \ 'at': '[^ \[{(=]\%#',
        \ 'char': '-',
        \ 'input': ' - ',
        \ 'filetype': ['pandoc'],
        \ 'syntax': ['pandocLaTeXMathBlock']
        \ })
  call smartinput#define_rule({
        \ 'at': '\(^|\s\)\%#',
        \ 'char': '-',
        \ 'input': '- ',
        \ 'filetype': ['yaml'],
        \ })
  call smartinput#define_rule({
        \ 'at': '[^ :\[{(-+]\%#',
        \ 'char': '-',
        \ 'input': ' - ',
        \ 'filetype': ['python', 'c', 'cpp', 'java', 'cs', 'arduino'],
        \ })
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '-',
        \ 'input': '-',
        \ 'filetype': ['python'],
        \ 'syntax': ['Comment', 'String', 'Special', 'Constant',
        \ 'DraculaComment', 'DraculaYellow', 'DraculaPink'],
        \ })

  call smartinput#map_to_trigger('i', '*', '*', '*')
  " f(*a)
  call smartinput#define_rule({
        \ 'at': '[^( ]\%#',
        \ 'char': '*',
        \ 'input': ' * ',
        \ })
  call smartinput#define_rule({
        \ 'at': '[^( ]\%#',
        \ 'char': '*',
        \ 'input': '*',
        \ 'filetype': ['c', 'cpp', 'cs', 'java', 'objc', 'objcpp', 'arduino'],
        \ })
  " /path/*
  call smartinput#define_rule({
        \ 'at': '/\%(\S\|\\ \)*\%#',
        \ 'char': '*',
        \ 'input': '*',
        \ })

  call smartinput#map_to_trigger('i', '**', '**', '**')
  " f(**a)
  call smartinput#define_rule({
        \ 'at': '[^( ]\%#',
        \ 'char': '**',
        \ 'input': ' ** ',
        \ })
  " /path/**
  call smartinput#define_rule({
        \ 'at': '/\%(\S\|\\ \)*\%#',
        \ 'char': '**',
        \ 'input': '**',
        \ })
  " 2}}} Operation "

  " Relation {{{2 "
  call smartinput#map_to_trigger('i', '<bar>-', '<bar>-', '<bar>-')
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '<bar>-',
        \ 'input': ' <bar>- ',
        \ 'filetype': ['tex', 'plaintex', 'context'],
        \ })

  call smartinput#map_to_trigger('i', '-<bar>', '-<bar>', '-<bar>')
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '-<bar>',
        \ 'input': ' -<bar> ',
        \ 'filetype': ['tex', 'plaintex', 'context'],
        \ })

  call smartinput#map_to_trigger('i', '&&', '&&', '&&')
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '&&',
        \ 'input': ' && ',
        \ })

  call smartinput#map_to_trigger('i', '??', '??', '??')
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '??',
        \ 'input': ' ?? ',
        \ })

  call smartinput#map_to_trigger('i', '^', '^', '^')
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '^',
        \ 'input': ' ^ ',
        \ 'filetype': ['c', 'cpp', 'cs', 'java', 'objc', 'objcpp', 'arduino', 'julia', 'python'],
        \ })

  call smartinput#map_to_trigger('i', '~=', '~=', '~=')
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '~=',
        \ 'input': ' ~= ',
        \ })

  call smartinput#map_to_trigger('i', '==', '==', '==')
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '==',
        \ 'input': ' == ',
        \ })

  call smartinput#map_to_trigger('i', '==', '==', '==')
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '==',
        \ 'input': '==',
        \ 'filetype': ['tmux'],
        \ })

  call smartinput#map_to_trigger('i', '!=', '!=', '!=')
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '!=',
        \ 'input': ' != ',
        \ })

  call smartinput#map_to_trigger('i', '>=', '>=', '>=')
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '>=',
        \ 'input': ' >= ',
        \ })

  call smartinput#map_to_trigger('i', '<=', '<=', '<=')
  call smartinput#define_rule({
        \ 'at': '[^ ?]\%#',
        \ 'char': '<=',
        \ 'input': ' <= ',
        \ })

  call smartinput#map_to_trigger('i', '~=', '~=', '~=')
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '~=',
        \ 'input': ' ~= ',
        \ })

  call smartinput#map_to_trigger('i', '=~', '=~', '=~')
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '=~',
        \ 'input': ' =~ ',
        \ })

  call smartinput#map_to_trigger('i', '!~', '!~', '!~')
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '!~',
        \ 'input': ' !~ ',
        \ })

  call smartinput#map_to_trigger('i', '==#', '==#', '==#')
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '==#',
        \ 'input': ' ==# ',
        \ })

  call smartinput#map_to_trigger('i', '!=#', '!=#', '!=#')
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '!=#',
        \ 'input': ' !=# ',
        \ })

  call smartinput#map_to_trigger('i', '<#', '<#', '<#')
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '<#',
        \ 'input': ' <# ',
        \ })

  call smartinput#map_to_trigger('i', '>#', '>#', '>#')
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '>#',
        \ 'input': ' ># ',
        \ })

  call smartinput#map_to_trigger('i', '>=#', '>=#', '>=#')
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '>=#',
        \ 'input': ' >=# ',
        \ })

  call smartinput#map_to_trigger('i', '<=#', '<=#', '<=#')
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '<=#',
        \ 'input': ' <=# ',
        \ })

  call smartinput#map_to_trigger('i', '=~#', '=~#', '=~#')
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '=~#',
        \ 'input': ' =~# ',
        \ })

  call smartinput#map_to_trigger('i', '!~#', '!~#', '!~#')
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '!~#',
        \ 'input': ' !~# ',
        \ })

  call smartinput#map_to_trigger('i', '==?', '==?', '==?')
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '==?',
        \ 'input': ' ==? ',
        \ })

  call smartinput#map_to_trigger('i', '!=?', '!=?', '!=?')
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '!=?',
        \ 'input': ' !=? ',
        \ })

  call smartinput#map_to_trigger('i', '<?', '<?', '<?')
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '<?',
        \ 'input': ' <? ',
        \ })

  call smartinput#map_to_trigger('i', '>?', '>?', '>?')
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '>?',
        \ 'input': ' >? ',
        \ })

  call smartinput#map_to_trigger('i', '>=?', '>=?', '>=?')
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '>=?',
        \ 'input': ' >=? ',
        \ })

  call smartinput#map_to_trigger('i', '<=?', '<=?', '<=?')
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '<=?',
        \ 'input': ' <=? ',
        \ })

  call smartinput#map_to_trigger('i', '=~?', '=~?', '=~?')
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '=~?',
        \ 'input': ' =~? ',
        \ })

  call smartinput#map_to_trigger('i', '!~?', '!~?', '!~?')
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '!~?',
        \ 'input': ' !~? ',
        \ })

  call smartinput#map_to_trigger('i', '~>', '~>', '~>')
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '~>',
        \ 'input': '~> ',
        \ })

  call smartinput#map_to_trigger('i', '<-', '<-', '<-')
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '<-',
        \ 'input': ' <- ',
        \ })

  call smartinput#map_to_trigger('i', '->', '->', '->')
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '->',
        \ 'input': ' -> ',
        \ })
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '->',
        \ 'input': '->',
        \ 'filetype': ['c', 'cpp', 'objc', 'objcpp'],
        \ })

  call smartinput#map_to_trigger('i', '=>', '=>', '=>')
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '=>',
        \ 'input': ' => ',
        \ })

  call smartinput#map_to_trigger('i', '.=', '.=', '.=')
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '.=',
        \ 'input': ' .= ',
        \ })

  call smartinput#map_to_trigger('i', '..=', '..=', '..=')
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '..=',
        \ 'input': ' ..= ',
        \ })

  call smartinput#map_to_trigger('i', '=<<', '=<<', '=<<')
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '=<<',
        \ 'input': ' =<< ',
        \ })
  " 2}}} Relation "

  " Assign {{{2 "
  call smartinput#map_to_trigger('i', '+=', '+=', '+=')
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '+=',
        \ 'input': ' += ',
        \ })
  call smartinput#define_rule({
        \ 'at': 'set .*\%#',
        \ 'char': '+=',
        \ 'input': '+=',
        \ 'filetype': ['vim', 'bash', 'zsh'],
        \ })
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '+=',
        \ 'input': '+=',
        \ 'filetype': ['bash', 'zsh'],
        \ })

  call smartinput#map_to_trigger('i', '-=', '-=', '-=')
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '-=',
        \ 'input': ' -= ',
        \ })
  call smartinput#define_rule({
        \ 'at': 'set .*\%#',
        \ 'char': '-=',
        \ 'input': '-=',
        \ 'filetype': ['vim'],
        \ })
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '-=',
        \ 'input': '-=',
        \ 'filetype': ['zsh'],
        \ })

  call smartinput#map_to_trigger('i', '*=', '*=', '*=')
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '*=',
        \ 'input': ' *= ',
        \ })
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '*=',
        \ 'input': '*=',
        \ 'filetype': ['zsh'],
        \ })

  call smartinput#map_to_trigger('i', '/=', '/=', '/=')
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '/=',
        \ 'input': ' /= ',
        \ })

  call smartinput#map_to_trigger('i', '%=', '%=', '%=')
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '%=',
        \ 'input': ' %= ',
        \ 'filetype': ['c', 'julia', 'python', 'vim'],
        \ })

  call smartinput#map_to_trigger('i', '&=', '&=', '&=')
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '&=',
        \ 'input': ' &= ',
        \ })
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '&=',
        \ 'input': '&=',
        \ 'filetype': ['zsh'],
        \ })
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '&=',
        \ 'input': ' & = ',
        \ 'filetype': ['tex', 'pandoc'],
        \ })
  call smartinput#define_rule({
        \ 'at': '^\%#',
        \ 'char': '&=',
        \ 'input': '& = ',
        \ 'filetype': ['tex', 'pandoc'],
        \ })

  call smartinput#map_to_trigger('i', '<Bar>=', '<Bar>=', '<Bar>=')
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '<Bar>=',
        \ 'input': ' <Bar>= ',
        \ })
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '<Bar>=',
        \ 'input': '<Bar>=',
        \ 'filetype': ['zsh'],
        \ })

  call smartinput#map_to_trigger('i', '^=', '^=', '^=')
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '^=',
        \ 'input': ' ^= ',
        \ })
  call smartinput#define_rule({
        \ 'at': 'set .*\%#',
        \ 'char': '^=',
        \ 'input': '^=',
        \ 'filetype': ['vim'],
        \ })
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '^=',
        \ 'input': '^=',
        \ 'filetype': ['zsh'],
        \ })

  call smartinput#map_to_trigger('i', '>>=', '>>=', '>>=')
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '>>=',
        \ 'input': ' >>= ',
        \ })

  call smartinput#map_to_trigger('i', '<<=', '<<=', '<<=')
  call smartinput#define_rule({
        \ 'at': '\S\%#',
        \ 'char': '<<=',
        \ 'input': ' <<= ',
        \ })
  " 2}}} Assign "
  " 1}}} Two "
endfunction
" ex: foldmethod=marker
