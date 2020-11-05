"" #COC {{{
let g:coc_global_extensions = ['coc-css', 'coc-vetur', 'coc-tsserver', 'coc-pairs', 'coc-eslint', 'coc-snippets']

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif


" " Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" " Use `[c` and `]c` to navigate diagnosticsU
nmap <leader>e  <Plug>(coc-diagnostic-next)
nmap <leader>E <Plug>(coc-diagnostic-prev)

" " Hide floating windows
nmap <silent> <leader>fh <Plug>(coc-float-hide)
" " Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

"nmap <leader>qf  <Plug>(coc-fix-current)
"
" Show autocomplete when Tab is pressed
inoremap <silent><expr> <Tab> coc#refresh()

" " Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)"

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <silent> <leader>f <Plug>(coc-format-selected)

" " Show all diagnostics
nnoremap <silent> <space>a  :CocList diagnostics<cr>
" " Manage extensions
nnoremap <silent> <space>e  :CocList extensions<cr>
" " Show commands
nnoremap <silent> <space>c  :CocList commands<cr>
" " Find symbol of current document
nnoremap <silent> <space>o  :CocList outline<cr>
" " Search workspace symbols
nnoremap <silent> <space>s  :CocList -I symbols<cr>
" " Do default action for next item.
nnoremap <silent> <space>j  :CocNext<CR>

nnoremap <silent> qf  :CocFix<CR>

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" " Do default action for previous item.
nnoremap <silent> <space>k  :CocPrev<CR>
" " Resume latest coc list
nnoremap <silent> <space>p  :CocListResume<CR>

noremap <silent> <Leader>k :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

"}}}


nmap <expr> <silent> <C-d> <SID>select_current_word()
function! s:select_current_word()
  if !get(g:, 'coc_cursors_activated', 0)
    return "\<Plug>(coc-cursors-word)"
  endif
  return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
endfunc

