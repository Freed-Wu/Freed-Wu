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
  call smartinput#map_to_trigger('i', '(', '(', '(')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '(',
        \ 'input': ' ()' . left,
        \ 'filetype': ['text'],
        \ })

  call smartinput#map_to_trigger('i', '<', '<', '<')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '<',
        \ 'input': ' < ',
        \ })
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '<',
        \ 'input': ' < ',
        \ 'filetype': ['pandoc'],
        \ 'syntax': ['pandocLaTeXMathBlock']
        \ })
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '<',
        \ 'input': '<lt>>' . left,
        \ 'filetype': ['pandoc', 'rst'],
        \ })
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '<',
        \ 'input': '<lt>>' . left,
        \ 'syntax': ['String', 'Constant', 'DraculaYellow']
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
        \ 'filetype': ['vim', 'html', 'xml', 'xhtml', 'liquid', 'text', 'pandoc',
        \ 'rst'],
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
        \ 'at': '\%#',
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
        \ 'at': '\%#',
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
        \ 'filetype': ['tex', 'plaintex', 'context', 'pandoc', 'markdown', 'gfimarkdown', 'csv', 'octave', 'matlab'],
        \ })
  call smartinput#define_rule({
        \ 'at': '\\\%#',
        \ 'char': '$',
        \ 'input': '$' . left,
        \ 'filetype': ['tex', 'plaintex', 'context', 'pandoc', 'markdown', 'gfimarkdown', 'csv', 'octave', 'matlab'],
        \ })
  " 1}}} SymetricDelimiter "

  " Three {{{1 "
  call smartinput#map_to_trigger('i', '?', '?', '?')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '?',
        \ 'input': ' ?  : ' . left . left . left,
        \ 'filetype': ['c', 'cpp', 'julia', 'vim'],
        \ })
  " 1}}} Three "

  " One {{{1 "
  call smartinput#map_to_trigger('i', ':', ':', ':')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': ':',
        \ 'input': ': ',
        \ 'filetype': ['text', 'json', 'jsonc', 'python'],
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

  call smartinput#map_to_trigger('i', ',', ',', ',')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': ',',
        \ 'input': ', ',
        \ })
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': ',',
        \ 'input': ',',
        \ 'filetype': ['csv', 'muttrc', 'fstab'],
        \ })
  call smartinput#define_rule({
        \ 'at': '\%#$',
        \ 'char': ',',
        \ 'input': ',',
        \ 'filetype': ['json', 'jsonc'],
        \ })

  call smartinput#map_to_trigger('i', '!', '!', '!')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '!',
        \ 'input': '! ',
        \ 'filetype': ['text'],
        \ })

  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '?',
        \ 'input': '? ',
        \ })

  call smartinput#map_to_trigger('i', '++', '++', '++')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '++',
        \ 'input': '++',
        \ })

  call smartinput#map_to_trigger('i', '+-', '+-', '+-')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '+-',
        \ 'input': '+-',
        \ })

  call smartinput#map_to_trigger('i', '--', '--', '--')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '--',
        \ 'input': ' -- ',
        \ 'filetype': ['tex', 'plaintex', 'context'],
        \ })
  " 1}}} One "

  " Two {{{1 "
  " Operation {{{2 "
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '?',
        \ 'input': ' ? ',
        \ 'filetype': ['cs'],
        \ })

  call smartinput#map_to_trigger('i', '..', '..', '..')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '..',
        \ 'input': ' .. ',
        \ 'filetype': ['vim'],
        \ })

  call smartinput#map_to_trigger('i', '<<', '<<', '<<')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '<<',
        \ 'input': ' << ',
        \ })

  call smartinput#map_to_trigger('i', '<<<', '<<<', '<<<')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '<<<',
        \ 'input': ' <<< ',
        \ 'filetype': ['sh', 'bash', 'zsh'],
        \ })

  call smartinput#map_to_trigger('i', '>>', '>>', '>>')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '>>',
        \ 'input': ' >> ',
        \ })

  call smartinput#map_to_trigger('i', '=', '=', '=')
  call smartinput#define_rule({
        \ 'at': 'let .*\%#',
        \ 'char': '=',
        \ 'input': ' = ',
        \ 'filetype': ['vim'],
        \ })
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '=',
        \ 'input': ' = ',
        \ 'filetype': ['python', 'tex', 'pandoc'],
        \ })
  call smartinput#define_rule({
        \ 'at': '(.*\%#\|\%#[,)\]}]$',
        \ 'char': '=',
        \ 'input': '=',
        \ 'filetype': ['python', 'tex', 'pandoc'],
        \ })

  call smartinput#map_to_trigger('i', '@', '@', '@')
  call smartinput#define_rule({
        \ 'at': '.\%#',
        \ 'char': '@',
        \ 'input': ' @ ',
        \ 'filetype': ['python'],
        \ })

  call smartinput#map_to_trigger('i', '+', '+', '+')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '+',
        \ 'input': ' + ',
        \ })
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '+',
        \ 'input': '+ ',
        \ 'filetype': ['spice'],
        \ })
  call smartinput#define_rule({
        \ 'at': '${\w\%#}',
        \ 'char': '+',
        \ 'input': '+',
        \ 'filetype': ['sh', 'bash', 'zsh'],
        \ })
  call smartinput#define_rule({
        \ 'at': '$\%#',
        \ 'char': '+',
        \ 'input': '+',
        \ 'filetype': ['sh', 'bash', 'zsh'],
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
        \ 'at': '[^ \[{(]\%#',
        \ 'char': '-',
        \ 'input': ' - ',
        \ 'filetype': ['python'],
        \ })
  call smartinput#define_rule({
        \ 'at': '[^ \[{(]\%#',
        \ 'char': '-',
        \ 'input': '-',
        \ 'filetype': ['python'],
        \ 'syntax': ['Comment', 'String']
        \ })

  call smartinput#map_to_trigger('i', '*', '*', '*')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '*',
        \ 'input': ' * ',
        \ 'filetype': ['python'],
        \ })
  call smartinput#define_rule({
        \ 'at': ',\s*\%#',
        \ 'char': '*',
        \ 'input': '*',
        \ 'filetype': ['python'],
        \ })

  call smartinput#map_to_trigger('i', '**', '**', '**')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '**',
        \ 'input': ' ** ',
        \ 'filetype': ['python'],
        \ })
  call smartinput#define_rule({
        \ 'at': ',\s*\%#',
        \ 'char': '**',
        \ 'input': '**',
        \ 'filetype': ['python'],
        \ })
  " 2}}} Operation "

  " Relation {{{2 "
  call smartinput#map_to_trigger('i', '<bar>-', '<bar>-', '<bar>-')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '<bar>-',
        \ 'input': ' <bar>- ',
        \ 'filetype': ['tex', 'plaintex', 'context'],
        \ })

  call smartinput#map_to_trigger('i', '-<bar>', '-<bar>', '-<bar>')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '-<bar>',
        \ 'input': ' -<bar> ',
        \ 'filetype': ['tex', 'plaintex', 'context'],
        \ })

  call smartinput#map_to_trigger('i', '&&', '&&', '&&')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '&&',
        \ 'input': ' && ',
        \ })

  call smartinput#map_to_trigger('i', '^', '^', '^')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '^',
        \ 'input': ' ^ ',
        \ 'filetype': ['c', 'cpp', 'cs', 'java', 'objc', 'objcpp', 'arduino', 'julia', 'python'],
        \ })

  call smartinput#map_to_trigger('i', '^^', '^^', '^^')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '^^',
        \ 'input': ' ^^ ',
        \ })

  call smartinput#map_to_trigger('i', '~=', '~=', '~=')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '~=',
        \ 'input': ' ~= ',
        \ })

  call smartinput#map_to_trigger('i', '==', '==', '==')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '==',
        \ 'input': ' == ',
        \ })

  call smartinput#map_to_trigger('i', '==', '==', '==')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '==',
        \ 'input': '==',
        \ 'filetype': ['tmux'],
        \ })

  call smartinput#map_to_trigger('i', '!=', '!=', '!=')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '!=',
        \ 'input': ' != ',
        \ })

  call smartinput#map_to_trigger('i', '>=', '>=', '>=')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '>=',
        \ 'input': ' >= ',
        \ })

  call smartinput#map_to_trigger('i', '<=', '<=', '<=')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '<=',
        \ 'input': ' <= ',
        \ })
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '<=',
        \ 'input': '<=',
        \ 'filetype': ['vim'],
        \ })
  call smartinput#map_to_trigger('i', '=~', '=~', '=~')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '=~',
        \ 'input': ' =~ ',
        \ })

  call smartinput#map_to_trigger('i', '!~', '!~', '!~')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '!~',
        \ 'input': ' !~ ',
        \ })

  call smartinput#map_to_trigger('i', '==#', '==#', '==#')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '==#',
        \ 'input': ' ==# ',
        \ })

  call smartinput#map_to_trigger('i', '!=#', '!=#', '!=#')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '!=#',
        \ 'input': ' !=# ',
        \ })

  call smartinput#map_to_trigger('i', '<#', '<#', '<#')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '<#',
        \ 'input': ' <# ',
        \ })

  call smartinput#map_to_trigger('i', '>#', '>#', '>#')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '>#',
        \ 'input': ' ># ',
        \ })

  call smartinput#map_to_trigger('i', '>=#', '>=#', '>=#')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '>=#',
        \ 'input': ' >=# ',
        \ })

  call smartinput#map_to_trigger('i', '<=#', '<=#', '<=#')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '<=#',
        \ 'input': ' <=# ',
        \ })

  call smartinput#map_to_trigger('i', '=~#', '=~#', '=~#')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '=~#',
        \ 'input': ' =~# ',
        \ })

  call smartinput#map_to_trigger('i', '!~#', '!~#', '!~#')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '!~#',
        \ 'input': ' !~# ',
        \ })

  call smartinput#map_to_trigger('i', '==?', '==?', '==?')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '==?',
        \ 'input': ' ==? ',
        \ })

  call smartinput#map_to_trigger('i', '!=?', '!=?', '!=?')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '!=?',
        \ 'input': ' !=? ',
        \ })

  call smartinput#map_to_trigger('i', '<?', '<?', '<?')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '<?',
        \ 'input': ' <? ',
        \ })

  call smartinput#map_to_trigger('i', '>?', '>?', '>?')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '>?',
        \ 'input': ' >? ',
        \ })

  call smartinput#map_to_trigger('i', '>=?', '>=?', '>=?')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '>=?',
        \ 'input': ' >=? ',
        \ })

  call smartinput#map_to_trigger('i', '<=?', '<=?', '<=?')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '<=?',
        \ 'input': ' <=? ',
        \ })

  call smartinput#map_to_trigger('i', '=~?', '=~?', '=~?')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '=~?',
        \ 'input': ' =~? ',
        \ })

  call smartinput#map_to_trigger('i', '!~?', '!~?', '!~?')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '!~?',
        \ 'input': ' !~? ',
        \ })

  call smartinput#map_to_trigger('i', '<-', '<-', '<-')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '<-',
        \ 'input': ' <- ',
        \ })

  call smartinput#map_to_trigger('i', '->', '->', '->')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '->',
        \ 'input': ' -> ',
        \ })

  call smartinput#map_to_trigger('i', '=>', '=>', '=>')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '=>',
        \ 'input': ' => ',
        \ })

  call smartinput#map_to_trigger('i', '.=', '.=', '.=')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '.=',
        \ 'input': ' .= ',
        \ })

  call smartinput#map_to_trigger('i', '..=', '..=', '..=')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '..=',
        \ 'input': ' ..= ',
        \ })

  call smartinput#map_to_trigger('i', '=<<', '=<<', '=<<')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '=<<',
        \ 'input': ' =<< ',
        \ })
  " 2}}} Relation "

  " Assign {{{2 "
  call smartinput#map_to_trigger('i', '+=', '+=', '+=')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '+=',
        \ 'input': ' += ',
        \ })
  call smartinput#define_rule({
        \ 'at': 'set .*\%#',
        \ 'char': '+=',
        \ 'input': '+=',
        \ 'filetype': ['vim'],
        \ })
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '+=',
        \ 'input': '+=',
        \ 'filetype': ['bash', 'zsh'],
        \ })

  call smartinput#map_to_trigger('i', '-=', '-=', '-=')
  call smartinput#define_rule({
        \ 'at': '\%#',
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
        \ 'at': '\%#',
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
        \ 'at': '\%#',
        \ 'char': '/=',
        \ 'input': ' /= ',
        \ })

  call smartinput#map_to_trigger('i', '%=', '%=', '%=')
  call smartinput#define_rule({
        \ 'at': '\%#',
        \ 'char': '%=',
        \ 'input': ' %= ',
        \ 'filetype': ['c', 'julia', 'python', 'vim'],
        \ })

  call smartinput#map_to_trigger('i', '&=', '&=', '&=')
  call smartinput#define_rule({
        \ 'at': '\%#',
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
        \ 'at': '\%#',
        \ 'char': '&=',
        \ 'input': '& = ',
        \ 'filetype': ['tex', 'pandoc'],
        \ })

  call smartinput#map_to_trigger('i', '<Bar>=', '<Bar>=', '<Bar>=')
  call smartinput#define_rule({
        \ 'at': '\%#',
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
        \ 'at': '\%#',
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
  " 2}}} Assign "
  " 1}}} Two "
endfunction
" ex: foldmethod=marker
