" Change leader key from \ to ,
let mapleader = ","

" Disable F1 bringing up the help doc every time
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" A saner way to save files.<F2> is easy to press
nnoremap <F2> :w<CR>

inoremap <S-Tab> <C-d>

" MOVING LINES
" Normal mode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

" Visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" QuickFix List
nnoremap <leader>co :cw<CR>
nnoremap <leader>cc :ccl<CR>
nnoremap <silent> <leader>cn :cnext<CR>
nnoremap <silent> <leader>cp :cprev<CR>

" Shortcut to open init.vim
nnoremap <leader>ev :vsp $MYVIMRC<CR>

" Save state of open Windows and Buffers
nnoremap <leader>s :mksession<CR>

" Delete buffer completely without messing up window layout
nnoremap <leader>q :Bwipeout<CR>

" turn off search highlights
nnoremap <leader><space> :nohlsearch<CR>

" Reload Vim config
nnoremap <Leader>r :so ~/.config/nvim/init.vim<CR>

" Create file under cursor
:map <leader>gf :e <cfile><cr>

" Switching tabs quickly
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

nnoremap <C-t> :tabnew<CR>
nnoremap <leader>w :tabclose<CR>

" For git diffs
nnoremap <leader>G :Gvdiffsplit<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

noremap <Leader>s :update<CR>

nmap <silent> tt :terminal<CR>
tnoremap <Esc> <C-\><C-n>

inoremap jj <esc>

noremap <leader>S :set spell spelllang=en_us <CR>

nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
