" #GRUVBOX Material {{{
set termguicolors
let g:gruvbox_italic = 1
let g:molokai_original = 1
"let g:rehash256 = 1
" colorscheme gruvbox
" colorscheme eighties
" }}}

" AirLine {{{

" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#show_tabs = 1
" let g:shades_of_purple_airline = 1
" let g:airline_theme='nord'
"
" LightLine
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

let g:rigel_lightline = 1
let g:lightline = {
      \ 'colorscheme': 'rigel',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified', 'lspstatus' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'lspstatus': 'LspStatus'
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

"UI
"
"
" Editor theme
" set background=dark
try
  colorscheme xcodedark
catch
  colorscheme slate
endtry

"
"
" }}}
" #FZF {{{
let g:fzf_command_prefix = 'FZF'

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

nnoremap <c-b> :FZFBuffers<CR>
nnoremap <c-p> :FZFFiles<CR>
nnoremap <c-h> :FZFHistory<CR>
nnoremap <c-s> :FZFRg<CR>
nnoremap <c-l> :FZFBLines<CR>

let g:fzf_preview_window = ['up:0%', 'ctrl-/']
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

" Supertab
let g:SuperTabDefaultCompletionType = "<c-n>"

autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeShowHidden=1

function! ToggleNERDTree()
  NERDTreeToggle
  " Set NERDTree instances to be mirrored
  silent NERDTreeMirror
endfunction
map <C-\> :call ToggleNERDTree()<CR>
map <leader>N :NERDTreeFind<CR>


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
" nmap <leader>t :call NeoI18nShow() <CR>
" nmap <leader>T :call NeoI18nAdd() <CR>

nmap <leader>g :FloatermNew! EDITOR=floaterm bash -c 'lazygit'; exit<CR>
nmap <leader>d :FloatermNew! EDITOR=floaterm bash -c 'lazydocker'; exit<CR>
let g:floaterm_keymap_new = '<leader>f'

let g:floaterm_keymap_new    = '<leader>tn'
let g:floaterm_keymap_prev   = '<leader>tp'
let g:floaterm_keymap_next   = '<leader>tN'
let g:floaterm_keymap_toggle = '<leader>t'

"" Prettier settings"Leader>
" let g:prettier#config#single_quote = 'true'
" let g:prettier#config#bracket_spacing = 'true'
" " let g:prettier#autoformat = 1
" let g:prettier#config#jsx_bracket_same_line = 'false'
" let g:prettier#config#arrow_parens = 'avoid'
" let g:prettier#config#trailing_comma = 'all'
" let g:prettier#config#print_width = '100'

command! Filename execute ":echo expand('%:p')"
command! Config execute ":tabe ~/.config/nvim/init.vim"
command! SourceConfig execute ":so ~/.config/nvim/init.vim"

autocmd FileType scss setl iskeyword+=@-@
"autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}


"NERDTree
""
"let NERDTreeShowHidden = 1
"let NERDTreeMinimalUI = 1
"let NERDTreeDirArrows = 1
"let NERDTreeIgnore = []
"let NERDTreeStatusline = ''

""nerdtree-git-plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }


nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

