syntax on
set number

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

let mapleader=" "

"####################
"# Vim-Plug plugins #
"####################
"
" To install:
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
