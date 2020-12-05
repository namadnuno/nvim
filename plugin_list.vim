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
Plug 'dyng/ctrlsf.vim'

" Syntax Highlighting And Indentation For 100+ Languaged
"Plug 'sheerun/vim-polyglot'
Plug 'sbdchd/neoformat'
Plug 'jwalton512/vim-blade'

" Appearance and Themes
Plug 'mhartington/oceanic-next'
Plug 'morhetz/gruvbox'
Plug 'arzg/vim-colors-xcode'
Plug 'kyoz/purify'
Plug 'lithammer/vim-eighties'
Plug 'webdevel/tabulous'
Plug 'joshdick/onedark.vim'
Plug 'psliwka/vim-smoothie'

" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'
Plug 'terryma/vim-multiple-cursors'
" Autocompletion, Linting & Intellisense
" Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
" Plug 'dense-analysis/ale'

" Neovim lsp Plugins
Plug 'neovim/nvim-lsp'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'tjdevries/nlua.nvim'
Plug 'tjdevries/lsp_extensions.nvim'
Plug 'nvim-treesitter/nvim-treesitter' " nvim treesiter
Plug 'Iron-E/nvim-highlite'
Plug 'nvim-lua/lsp-status.nvim'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'

Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'vim-test/vim-test'
Plug 'cakebaker/scss-syntax.vim'

" Utilitied
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-rooter'
Plug 'moll/vim-bbye'
Plug 'mattn/emmet-vim'
Plug 'miyakogi/conoline.vim'
" Plug 'ervandew/supertab'
Plug 'szw/vim-maximizer'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'godlygeek/tabular'
" Plug 'tpope/vim-unimpaired'
" Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-obsession'
Plug 'ludovicchabant/vim-gutentags'
Plug 'ap/vim-css-color'
Plug 'ryanoasis/vim-devicons'
Plug 'voldikss/vim-floaterm'
Plug 'mlaursen/vim-react-snippets'
Plug 'pechorin/any-jump.vim'
Plug 'mhinz/vim-startify'
Plug '~/Code/neoi18n'
Plug 'vimwiki/vimwiki'
Plug 'jiangmiao/auto-pairs'

" Plug 'Rigellute/shades-of-purple.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'Rigellute/rigel'

"}}}
call plug#end()

silent! helptags ALL
