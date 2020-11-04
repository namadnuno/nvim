" js, ts        npm install -g typescript typescript-language-server
" vue           npm install -g typescript vls
"
lua require'lsp_config'

" lsp mappings
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<cr>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<cr>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<cr>
nnoremap <silent> gn    <cmd>lua vim.lsp.buf.rename()<cr>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<cr>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<cr>
nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<cr>
vnoremap <silent> ga    <cmd>'<,'>lua vim.lsp.buf.range_code_action()<cr>

set omnifunc=v:lua.vim.lsp.omnifunc
set completeopt=menuone,noinsert,noselect
set shortmess+=c

autocmd Filetype typescript      autocmd BufWritePre * silent! lua document_format_sync()
autocmd Filetype vue             autocmd BufWritePre * silent! lua document_format_sync()

" the bar on the left symbols
call sign_define('LspDiagnosticsErrorSign',       {'text': 'ee', 'texthl': 'LspDiagnosticsError'})
call sign_define('LspDiagnosticsWarningSign',     {'text': 'ww', 'texthl': 'LspDiagnosticsWarning'})
call sign_define('LspDiagnosticsInformationSign', {'text': 'ii', 'texthl': 'LspDiagnosticsInformation'})
call sign_define('LspDiagnosticsHintSign',        {'text': 'hh', 'texthl': 'LspDiagnosticsHint'})

