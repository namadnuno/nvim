" #GRUVBOX Material {{{
set termguicolors
set background=dark
let g:gruvbox_italic = 1
let g:molokai_original = 1
"let g:rehash256 = 1
" colorscheme gruvbox
" colorscheme eighties
" }}}

" " #Lightline {{{

let g:lightline = {
      \ 'colorscheme': 'one dark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B'
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
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

" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeShowHidden=1

function! ToggleNERDTree()
  NERDTreeToggle
  " Set NERDTree instances to be mirrored
  silent NERDTreeMirror
endfunction
map <C-n> :call ToggleNERDTree()<CR>
map <leader>N :NERDTreeFind<CR>

" Snippets
" let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/snips']
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<c-b>"


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

