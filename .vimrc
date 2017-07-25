syntax on

" Line numbers - by default current line is absolute,
" while all others are relative. Press Ctrl-N twice to
" toggle the relativenumber option
set relativenumber
set number
nmap <C-N><C-N> :set invrelativenumber<CR>

" Underline current line - switched on by default.
" Type Ctrl-U twice to toggle this option
" Pres Leader-l to highlight some line
set cursorline
nnoremap <C-U><C-U> :set cursorline!<CR>
nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>


" Set <leader> to space
let mapleader=" "

" At the lower right corner show current line and column
set ruler

" Sane indentation options
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" To install Vim-Plug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin()

" For commenting
Plug 'scrooloose/nerdcommenter'

" For folding paragraphs
Plug 'ymattw/vim-fold-paragraph'
set foldmethod=manual
nmap <Leader><Space> :call ToggleFoldParagraph()<CR>

call plug#end()
