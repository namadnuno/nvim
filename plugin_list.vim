" #PLUGINS {{{
call plug#begin('~/.local/share/nvim/plugged')

" Markdown
Plug 'reedes/vim-pencil'
Plug 'nelstrom/vim-markdown-folding'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'rhysd/git-messenger.vim'

" Fuzzy Search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'
Plug 'dyng/ctrlsf.vim'
" Syntax Highlighting And Indentation For 100+ Languaged
Plug 'sheerun/vim-polyglot'

" Appearance and Themes
Plug 'mhartington/oceanic-next'
Plug 'morhetz/gruvbox'
Plug 'arzg/vim-colors-xcode'
Plug 'kyoz/purify'
Plug 'tomasr/molokai'
Plug 'chriskempson/base16-vim'
Plug 'lithammer/vim-eighties'
Plug 'webdevel/tabulous'
Plug 'joshdick/onedark.vim'

" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
 Plug 'itchyny/lightline.vim'
" Plug 'halkn/lightline-lsp'

" Autocompletion, Linting & Intellisense
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
" Plug 'dense-analysis/ale'

" Neovim lsp Plugins
" Plug 'neovim/nvim-lspconfig'
" Plug 'nvim-lua/completion-nvim'
" Plug 'tjdevries/nlua.nvim'
" Plug 'tjdevries/lsp_extensions.nvim'
" Plug 'nvim-lua/diagnostic-nvim'
" Plug 'nvim-treesitter/nvim-treesitter' " nvim treesiter

" Plug 'honza/vim-snippets'
" Plug 'SirVer/ultisnips'
"Plug 'algotech/ultisnips-php'
Plug 'vim-test/vim-test'
Plug 'cakebaker/scss-syntax.vim'

" Utilitied
Plug 'preservim/nerdtree'
Plug 'airblade/vim-rooter'
Plug 'moll/vim-bbye'
Plug 'mattn/emmet-vim'
Plug 'miyakogi/conoline.vim'
Plug 'ervandew/supertab'
Plug 'szw/vim-maximizer'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-obsession'
Plug 'luochen1990/rainbow'
Plug 'ludovicchabant/vim-gutentags'
Plug 'ap/vim-css-color'
Plug 'ryanoasis/vim-devicons'
Plug 'voldikss/vim-floaterm'
Plug 'mlaursen/vim-react-snippets'
Plug 'pechorin/any-jump.vim'
Plug 'mhinz/vim-startify'
Plug 'lifepillar/vim-solarized8'
Plug '~/Code/neoi18n'
Plug 'vimwiki/vimwiki'
" Lua
" Plug 'nvim-lua/completion-nvim'

"}}}
call plug#end()

silent! helptags ALL
