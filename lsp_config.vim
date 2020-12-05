" js, ts        npm install -g typescript typescript-language-server
" vue           npm install -g typescript vls
"

let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_virtual_text_prefix = '━ '
let g:diagnostic_enable_underline = 1

sign define LspDiagnosticsSignError text=❌ texthl=LspDiagnosticsSignError linehl= numhl=
sign define LspDiagnosticsSignWarning text=⚠️ texthl=LspDiagnosticsSignWarning linehl= numhl=
sign define LspDiagnosticsSignInformation text=i texthl=LspDiagnosticsSignInformation linehl= numhl=
sign define LspDiagnosticsSignHint text=💡 texthl=LspDiagnosticsSignHint linehl= numhl=


lua require'lsp_config'

" diagnostic-nvim {{{
  
  " autocmd BufWritePre *.vue,*.ts,*.js lua vim.lsp.buf.formatting_sync(nil, 1000)

  " Use <Tab> and <S-Tab> to navigate through popup menu
imap <silent> <c-p> <Plug>(completion_trigger)
imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)
let g:completion_confirm_key = ""
imap <expr> <cr>  pumvisible() ? complete_info()["selected"] != "-1" ?
                 \ "\<Plug>(completion_confirm_completion)"  : "\<c-e>\<CR>" :  "\<CR>"
let g:completion_matching_ignore_case = 1

nnoremap <leader>e <cmd>lua vim.lsp.diagnostic.goto_next { wrap = false }<CR>
nnoremap <leader>E <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>

autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()

" Set completeopt to have a better completion experience
" Snippets
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

let g:completion_enable_auto_popup = 1
let g:completion_enable_snippet = 'UltiSnips'
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/snips']
let g:UltiSnipsExpandTrigger="<tab>"                                            
let g:UltiSnipsJumpForwardTrigger="<tab>"                                       
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"

" let g:ale_set_highlights = 0
" let g:ale_fix_on_save = 1
" let g:ale_lint_on_enter = 0
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_insert_leave = 0
" let g:ale_set_quickfix = 1
" let g:ale_set_loclist = 0

" let b:ale_linters = {
"       \ 'php': [],
"       \ 'vue': [ 'vls', 'eslint' ],
"       \ 'typescript': [ 'eslint' ],
"       \ 'javascript': [ 'eslint' ],
"       \ }
" let b:ale_fixers = { 
"       \ 'javascript': ['prettier', 'eslint'],
"       \ 'typescript': ['prettier', 'eslint'],
"       \ 'vue': ['eslint', 'vls'],
"       \ 'php': ['phpcbf']
"       \ }

" }}}
"
" Provided by setup function
"

" let g:neoformat_verbose = 1 " only affects the verbosity of Neoformat
" let g:neoformat_php_phpcbf = {
"       \ 'exe': 'phpcbf',
"       \ 'args': [
"       \ '--extensions=php',
"       \ '%',
"       \ '||',
"       \ 'true'
"       \ ],
"       \ 'stdin': 1,
"       \ 'no_append': 1
"       \ }
" let g:neoformat_enabled_php = ['phpcbf']

" let g:neoformat_enabled_javascript = ['prettier', 'eslint']
" let g:neoformat_enabled_typescript = ['prettier', 'eslint']
" let g:neoformat_enabled_vue = ['eslint']

" function Eslint()
"   execute '!eslint "'. expand('%:p') . '" --fix' 
" endfunction

" autocmd FileType php,js,ts nnoremap <leader>f :Neoformat<cr>
" autocmd FileType vue nnoremap <leader>f :call Eslint()<cr>
"
 function! LspStatus() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval("require('lsp-status').status()")
  endif

  return ''
endfunction
