" #GRUVBOX Material {{{
set termguicolors
set background=dark
let g:gruvbox_italic = 1
let g:molokai_original = 1
"let g:rehash256 = 1
" colorscheme gruvbox
" colorscheme eighties
" }}}

" #ALE {{{
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

let b:ale_linters = ['eslint', 'vls']
let b:ale_fixers = ['prettier', 'eslint']
let g:ale_fix_on_save = 1 " Fix files automatically on save
"
" Move between linting errors
nmap <leader>e <Plug>(ale_previous_wrap)
nmap <leader>E <Plug>(ale_next_wrap)

nmap <F6> <Plug>(ale_fix)
nnoremap <silent> gd :ALEGoToDefinition<cr>
" }}}

" #SUPERTAB {{{
let g:SuperTabDefaultCompletionType = '<c-n>'
let g:SuperTabClosePreviewOnPopupClose = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<C-x><C-o>"
" }}}

" #Lightline {{{
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
      \ 'colorscheme': 'one dark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'currentfunction', 'cocstatus', 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B'
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'currentfunction': 'CocCurrentFunction',
      \   'cocstatus': 'coc#status'
      \ },
      \ }

" #EMMET {{{
let g:user_emmet_expandabbr_key='<C-@>'
imap <expr> <C-Space> emmet#expandAbbrIntelligent("\<tab>")
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}
"}}}

" #COC {{{

let g:coc_global_extensions = ['coc-vetur', 'coc-tsserver', 'coc-pairs', 'coc-eslint', 'coc-snippets']

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif


" " Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" " Use `[c` and `]c` to navigate diagnosticsU
nmap <silent> ]c <Plug>(coc-diagnostic-next)
nmap <silent> [c <Plug>(coc-diagnostic-prev)

" " Hide floating windows
nmap <silent> <leader>fh <Plug>(coc-float-hide)
" " Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

nmap <leader>qf  <Plug>(coc-fix-current)
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

" #MARKDOWN {{{
let g:pencil#textwidth = 80
let g:vim_markdown_folding_disabled = 1
au BufNewFile,BufRead,BufWrite *.md syntax match Comment /\%^---\_.\{-}---$/
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_gb
let g:markdown_fenced_languages = ['rust', 'css', 'yaml', 'javascript', 'html', 'vim','json']
augroup pencil
  autocmd!
  autocmd FileType md call pencil#init()
augroup END
"}}}
"
" -- Telescope
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For >")})<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <Leader>pf :lua require('telescope.builtin').find_files()<CR>
"
"
"
"UI
"
"
" Editor theme
set background=dark
try
  colorscheme OceanicNext
catch
  colorscheme slate
endtry

"
"
" }}}
" #FZF {{{
let g:fzf_command_prefix = 'FZF'
nnoremap <Leader>b :FZFBuffers<CR>
nnoremap <Leader>h :FZFHistory<CR>
nnoremap <silent> <Leader>x :FZFCommits<CR>
" }}}

" #RIPGREP {{{
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
" }}}

" #CONOLINE {{{
" Highlight the line of the cursor
let g:conoline_auto_enable = 1
let g:conoline_use_colorscheme_default_insert=1
let g:conoline_use_colorscheme_default_normal=1
" }}}
"
" #GUTENTAGS {{{
let g:gutentags_file_list_command = "rg --files --follow --ignore-file '/home/ayo/.vimignore'"
" }}}

" #SIGNIFY {{{
" Check for only Git
let g:signify_vcs_list = [ 'git' ]

" Jump to next and previous hunks
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)

" Hunk text object
omap ic <plug>(signify-motion-inner-pending)
xmap ic <plug>(signify-motion-inner-visual)
" }}}

" #FUGITIVE {{{
nmap <leader>gw :Gwrite<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gs :Gstatus<CR>
" }}}

" VIM-FLOATERM {{{
let g:floaterm_background = "#282828"
let g:floaterm_position = "bottom"
let g:floaterm_border_bgcolor = "#282828"
let g:floaterm_keymap_new    = "<F7>"
let g:floaterm_keymap_prev   = "<F8>"
let g:floaterm_keymap_next   = "<F9>"
let g:floaterm_keymap_toggle = "<F10>"
let g:floaterm_autoclose=1
let g:floaterm_height=0.95
let g:floaterm_width=0.95
" }}}
"
"

" Supertab
let g:SuperTabDefaultCompletionType = "<c-n>"

" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeShowHidden=1

function! ToggleNERDTree()
  NERDTreeToggle
  " Set NERDTree instances to be mirrored
  silent NERDTreeMirror
endfunction
map <C-n> :call ToggleNERDTree()<CR>
map <leader>N :NERDTreeFind<CR>

nmap <expr> <silent> <C-d> <SID>select_current_word()
function! s:select_current_word()
  if !get(g:, 'coc_cursors_activated', 0)
    return "\<Plug>(coc-cursors-word)"
  endif
  return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
endfunc


"Tabolus
let tabulousLabelNameOptions = ':p:.'
let g:tabulousLabelNameTruncate = 0

" Ctrf
nmap     <C-F>f <Plug>CtrlSFPrompt
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath

command! FileHistory execute ":FZFBCommits"
nmap cc :FZFCommands<CR>
command! B execute "FZFBuffers"
nmap <leader>a :CtrlSF -R ""<Left>
nmap <leader>t :call NeoI18nShow() <CR>
nmap <leader>T :call NeoI18nAdd() <CR>

nmap <leader>g :FloatermNew! EDITOR=floaterm bash -c 'lazygit'; exit<CR>
nmap <leader>d :FloatermNew! EDITOR=floaterm bash -c 'lazydocker'; exit<CR>

"" Prettier settings"
let g:prettier#config#single_quote = 'true'
let g:prettier#config#bracket_spacing = 'true'
" let g:prettier#autoformat = 1
let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#config#arrow_parens = 'avoid'
let g:prettier#config#trailing_comma = 'all'
let g:prettier#config#print_width = '100'

command! Filename execute ":echo expand('%:p')"
command! Config execute ":tabe ~/.config/nvim/init.vim"
command! SourceConfig execute ":so ~/.config/nvim/init.vim"

autocmd FileType scss setl iskeyword+=@-@
autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}
