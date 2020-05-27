" #PLUGINS {{{
call plug#begin('~/.local/share/nvim/plugged')

" Markdown
Plug 'reedes/vim-pencil'
Plug 'nelstrom/vim-markdown-folding'

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'rhysd/git-messenger.vim'

" Fuzzy Search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'dyng/ctrlsf.vim'
" Syntax Highlighting And Indentation For 100+ Languages
Plug 'sheerun/vim-polyglot'

" Appearance and Themes
Plug 'morhetz/gruvbox'
Plug 'arzg/vim-colors-xcode'
Plug 'kyoz/purify'
Plug 'tomasr/molokai'
Plug 'chriskempson/base16-vim'
Plug 'lithammer/vim-eighties'
Plug 'preservim/nerdtree'
Plug 'webdevel/tabulous'

"Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Autocompletion, Linting & Intellisense
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
"Plug 'SirVer/ultisnips'
Plug 'dense-analysis/ale'
Plug 'honza/vim-snippets'
"Plug 'algotech/ultisnips-php'

" Utilities
Plug 'airblade/vim-rooter'
Plug 'moll/vim-bbye'
Plug 'mattn/emmet-vim'
Plug 'miyakogi/conoline.vim'
Plug 'ervandew/supertab'
Plug 'szw/vim-maximizer'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-obsession'
Plug 'luochen1990/rainbow'
Plug 'ludovicchabant/vim-gutentags'
Plug 'ap/vim-css-color'
Plug 'ryanoasis/vim-devicons'
Plug 'easymotion/vim-easymotion'
Plug 'TaDaa/vimade'
Plug 'voldikss/vim-floaterm'
Plug 'mlaursen/vim-react-snippets'
Plug 'mcchrish/nnn.vim'
call plug#end()
"}}}
