scriptencoding utf-8
function! init#quickui#source() abort
  " vim-troll-stopper renders 3's =
  let g:quickui_border_style = 2
  nnoremap <silent> <Space> :<C-U>call quickui#menu#open()<CR>
  xnoremap <silent> <Space> :<C-U>call quickui#menu#open()<CR>
  nnoremap <silent> , :<C-U>call quickui#context#open(g:init#quickui#context, {})<CR>
  xnoremap <silent> , :<C-U>call quickui#context#open(g:init#quickui#vcontext, {})<CR>
  let g:init#quickui#context = [
        \ ['&NR', 'NR'],
        \ ['R&ainbowDelim', 'RainbowDelim'],
        \ ['--', ''],
        \ ['&Table-mode ▶', 'call quickui#context#open(g:init#quickui#context_table_mode, {})'],
        \ ['&Coc ▶', 'call quickui#context#open(g:init#quickui#context_coc, {})'],
        \ ]
  let g:init#quickui#vcontext = [
        \ ['&NRV', 'NRV'],
        \ ['--', ''],
        \ ['&Table-mode ▶', 'call quickui#context#open(g:init#quickui#vcontext_table_mode, {})'],
        \ ['&Coc ▶', 'call quickui#context#open(g:init#quickui#vcontext_coc, {})'],
        \ ]

  let g:init#quickui#context_table_mode = [
        \ ['&Tableize', '&Tableize'],
        \ ['Table&AddFormula', 'TableAddFormula'],
        \ ['Table&EvalFormulaLine', 'TableEvalFormulaLine'],
        \ ['TableMode&Realign', 'TableModeRealign'],
        \ ['TableModeEcho&Cell', 'call tablemode#spreadsheet#EchoCell()'],
        \ ['--', ''],
        \ ['DeleteRo&w', 'call tablemode#spreadsheet#DeleteRow()'],
        \ ['DeleteCo&lumn', 'call tablemode#spreadsheet#DeleteColumn()'],
        \ ['--', ''],
        \ ['&InsertColumnBefore', 'call tablemode#spreadsheet#InsertColumn(0)'],
        \ ['InsertColumn&After', 'call tablemode#spreadsheet#InsertColumn(1)'],
        \ ]
  let g:init#quickui#vcontext_table_mode = [
        \ ['&Tableize', '*Tableize'],
        \ ['Table&AddFormula', '*TableAddFormula'],
        \ ['Table&EvalFormulaLine', '*TableEvalFormulaLine'],
        \ ['TableMode&Realign', '*TableModeRealign'],
        \ ['TableizeBy&Delimiter', 'call tablemode#TableizeByDelimiter()'],
        \ ]

  let g:init#quickui#context_coc = [
        \ ['&Implementation', 'call CocAction("jumpImplementation")'],
        \ ['&TypeDefinition', 'call CocAction("jumpTypeDefinition")'],
        \ ['&Called References', 'call CocAction("jumpReferences")'],
        \ ['Re&name', 'call CocAction("rename")'],
        \ ['Re&factor', 'call CocAction("refactor")'],
        \ ['--', ''],
        \ ['Trans&late', 'call coc#rpc#notify("doKeymap", ["translator-p"])'],
        \ ['Translate &Replace', 'call coc#rpc#notify("doKeymap", ["translator-r"])'],
        \ ['--', ''],
        \ ['&Browser', 'CocCommand git.browserOpen'],
        \ ['C&hunk', 'CocCommand git.chunkInfo'],
        \ ['Stag&e', 'CocCommand git.chunkStage'],
        \ ['&Undo', 'CocCommand git.chunkUndo'],
        \ ['C&ommit', 'CocCommand git.showCommit'],
        \ ]
  let g:init#quickui#vcontext_coc = [
        \ ['Trans&late', 'call coc#rpc#notify("doKeymap", ["translator-pv"])'],
        \ ['Translate &Replace', 'call coc#rpc#notify("doKeymap", ["translator-rv"])'],
        \ ]
endfunction

function! init#quickui#post_source() abort
  let g:quickui_show_tip = 1
  call quickui#menu#install('&File', map([
        \ ['&File', 'Fern -drawer .'],
        \ ['&Go', 'Fern -drawer %:p:h'],
        \ ['--', ''],
        \ ['&Downloads', 'Fern -drawer ~/Downloads'],
        \ ['D&ocuments', 'Fern -drawer ~/Documents'],
        \ ['D&esktop', 'Fern -drawer ~/Desktop'],
        \ ['P&ictures', 'Fern -drawer ~/Pictures'],
        \ ['&Trash', 'Fern -drawer ~/.local/share/Trash/files'],
        \ ['--', ''],
        \ ['Vim &config', 'Fern -drawer ' . $XDG_CONFIG_HOME . '/nvim'],
        \ ['&Vim data', 'Fern -drawer ' . $XDG_DATA_HOME . '/nvim'],
        \ ['--', ''],
        \ ['&UDISK', 'Fern -drawer /run/media/' . $USER],
        \ ['&Phone', 'Fern -drawer /run/user/1000/gvfs'],
        \ ['&Mount', 'Fern -drawer /mnt'],
        \ ] , {_, v -> v + [get(v, 1)]}))
  call quickui#menu#install('&Edit', map([
        \ ['T&emplate', 'Template'],
        \ ['&TemplateHere', 'TemplateHere'],
        \ ['--', ''],
        \ ['Trail &Fix', 'TrailGuide fix'],
        \ ['--', ''],
        \ ['&Delete', 'Delete'],
        \ ['Chmod +&x', 'Chmod +x'],
        \ ] , {_, v -> v + [get(v, 1)]}))
  call quickui#menu#install('&View', map([
        \ ['&Snippet', 'CocCommand snippets.editSnippets'],
        \ ['S&nippets', 'CocCommand snippets.openSnippetFiles'],
        \ ['--', ''],
        \ ['S&tartify', 'Startify'],
        \ ['&Fern', 'Fern .'],
        \ ['&Undotree', 'UndotreeToggle'],
        \ ['Filet&ype', 'execute "edit $XDG_CONFIG_HOME/nvim/ftplugin/" . split(&filetype, ''\.'')[0] . ".vim"'],
        \ ] , {_, v -> v + [get(v, 1)]}))
  call quickui#menu#install('&Git', map([
        \ ['&Git', 'Gina status'],
        \ ['&Add All', 'Gina add -A'],
        \ ['Add &.', 'Gina add .'],
        \ ] , {_, v -> v + [get(v, 1)]}))
  call quickui#menu#install('&Z-fold', map([
        \ ['&Z-fold Last pattern', 'Fl'],
        \ ['&Word', 'Fw'],
        \ ['&Find search', 'Fs'],
        \ ['&Spell', 'FS'],
        \ ['&Context', 'Fc'],
        \ ['Ex&pression', 'Fp'],
        \ ['&Increment', 'Fi'],
        \ ['&Decrement', 'Fd'],
        \ ['--', ''],
        \ ['&End', 'Fe'],
        \ ['--', ''],
        \ ['&Unchanged', 'CocCommand git.foldUnchanged'],
        \ ['--', ''],
        \ ['&AnyFoldActivate', 'AnyFoldActivate'],
        \ ] , {_, v -> v + [get(v, 1)]}))
  call quickui#menu#install('&Plugins', map([
        \ ['Ch&eckhealth', 'checkhealth'],
        \ ['--', ''],
        \ ['&StartupTime', 'StartupTime'],
        \ ['--', ''],
        \ ['&Update', 'SPUpdate'],
        \ ['&Install', 'SPInstall'],
        \ ['--', ''],
        \ ['&Clean', 'Dein clean'],
        \ ['&Recache', 'Dein recache_runtimepath'],
        \ ['--', ''],
        \ ['CocU&pdate', 'CocUpdate'],
        \ ] , {_, v -> v + [get(v, 1)]}))
endfunction
