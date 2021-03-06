" Disallow detection of filetypes
filetype off

filetype plugin indent on    " required
" runtime macros/matchit.vim

syntax enable

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif

if has("patch-7.4.710")
    set listchars=eol:~,tab:>.,trail:~,extends:>,precedes:<,space:_
else
    set listchars=eol:~,tab:>.,trail:~,extends:>,precedes:<
endif

scriptencoding utf-8
set encoding=utf-8

set t_8b=^[[48;2;%lu;%lu;%lum
set t_8f=^[[38;2;%lu;%lu;%lum

" #TEMPLATES {{{
" Prefill new files created by vim with contents from the following templates
augroup templates
  autocmd BufNewFile *.html 0r ~/.config/nvim/templates/skeleton.html
  autocmd BufNewFile *.scss 0r ~/.config/nvim/templates/skeleton.scss
  autocmd BufNewFile *.css 0r ~/.config/nvim/templates/skeleton.scss
  autocmd BufNewFile *.rs 0r ~/.config/nvim/templates/skeleton.rs
  autocmd BufNewFile LICENCE 0r ~/.config/nvim/templates/skeleton.LICENCE
  autocmd BufNewFile LICENSE 0r ~/.config/nvim/templates/skeleton.LICENCE
  autocmd BufNewFile .gitignore 0r ~/.config/nvim/templates/skeleton.gitignore
  autocmd BufNewFile .stylelintrc.json 0r ~/.config/nvim/templates/skeleton.stylelintrc
  autocmd BufNewFile .eslintrc.json 0r ~/.config/nvim/templates/skeleton.eslintrc
  autocmd BufNewFile .prettierrc.json 0r ~/.config/nvim/templates/skeleton.prettierrc
augroup END
"}}}

" More natural split opening.
set splitbelow
set splitright

" Show leader key
set showcmd

" #TABS AND SPACES {{{
set expandtab " On pressing tab, insert 2 spaces
set tabstop=2 " show existing tab with 2 spaces width
set softtabstop=2
set shiftwidth=2 " when indenting with '>', use 2 spaces width
"}}}

set number " Show line numbers
set noswapfile " No swap file
set nobackup
set nowritebackup

set textwidth=80
set formatoptions+=t
set colorcolumn=+1
set showmatch
set lazyredraw

" #FINDING FILES
" Use the `:find` command to fuzzy search files in the working directory
" The `:b` command can also be used to do the same for open buffers

" Search all subfolders
set path+=**

" Display matching files on tab complete
set wildmenu

" Ignore node_modules and images from search results
set wildignore+=**/node_modules/**,**/dist/**,**_site/**,*.swp,*.png,*.jpg,*.gif,*.webp,*.jpeg,*.map

" Use the system register for all cut yank and paste operations
set clipboard=unnamedplus

" Toggle Hybrid Numbers in insert and normal mode
" :set number relativenumber

" Show Invisibles
set list
set listchars=tab:→→,eol:¬

" Automatically hide buffer with unsaved changes without showing warning
set hidden

" Treat all numbers as decimal regardless of whether they are padded with zeros
set nrformats=

" Highlight matches when using :substitute
set hlsearch

" Predicts case sensitivity intentions
set smartcase

" Jump to match when searching
set incsearch

set updatetime=300

" Enable word completion
set complete+=kspell
set mouse=a

hi NonText guifg=#4a4a59
hi SpecialKey guifg=white guibg=#cc0000

" Strip trailing whitespace from all files
" autocmd BufWritePre * %s/\s\+$//e
" autocmd BufWritePre * %s/\s\+$//e
" autocmd BufWritePre * %s/\s\+$//e

" Automatically remove the preview window after autocompletion
autocmd CompleteDone * pclose

au BufRead,BufNewFile,BufReadPost *.json set syntax=json

set guifont=DroidSansMono\ Nerd\ Font:h11
let g:airline_powerline_fonts = 1

let g:python3_host_prog = '/usr/local/bin/python3'
let html_no_rendering = 1

let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.blade.php"
autocmd Filetype php setlocal tabstop=4 softtabstop=4 shiftwidth=4
autocmd BufNewFile,BufRead *.blade.php set ft=blade
