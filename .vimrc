syntax on

" Splitting creates a new window to the right and below
set splitbelow
set splitright

set nowrap

" FZF -- Control-P to search for file
nmap <C-p> :FZF<CR>

" Line numbers - by default current line is absolute,
" while all others are relative. Press Ctrl-N twice to
" toggle the relativenumber option
set relativenumber
set number
set textwidth=79

" highlight when searching
set nohlsearch

" Tab completion made easier
set wildmode=longest,list,full
set wildmenu

" Underline current line - switched on by default.
" Type Ctrl-U twice to toggle this option
" Pres Leader-l to highlight some line
set cursorline


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

noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

" Remove trailing whitespace before saving
autocmd BufWritePre * %s/\s\+$//e

" Run command into temporary buffer
function! Scratch()
    tabe
    noswapfile hide enew
    setlocal buftype=nofile
    setlocal bufhidden=hide
endfunction

command -nargs=1 Search call Scratch() | r! ag --nogroup <args>

" Ctrl+s opens a new scratch tab
nnoremap <C-s> :call Scratch()<cr>
" nnoremap <C-n> :call Scratch | r! ag --nogroup <C-r><C-w>

"------------------------
" PLUGINS
"------------------------

" To install Vim-Plug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin()

" For commenting
Plug 'scrooloose/nerdcommenter'

" Rust
Plug 'rust-lang/rust.vim'

" git-blame
Plug 'zivyangll/git-blame.vim'
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

" For folding paragraphs
Plug 'ymattw/vim-fold-paragraph'
set foldmethod=manual
nmap <Leader><Space> :call ToggleFoldParagraph()<CR>

" Tab completion
Plug 'ervandew/supertab'

" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Git stuff
Plug 'tpope/vim-fugitive'

" Nerdtree
Plug 'vim-nerdtree/nerdtree'

" Colorschemes
Plug 'romainl/flattened'

" Python imports
Plug 'mgedmin/python-imports.vim'

" Black
Plug 'psf/black'

" Autoflake
Plug 'tell-k/vim-autoflake'

call plug#end()

" tags
set tags=tags
nnoremap <silent><Leader><C-]> <C-w><C-]><C-w>T

" Python imports
nmap <C-m> : ImportName<CR>
command Isort :%! isort - -w 79 -m 0

" Workaround for NERDTree
let g:NERDTreeNodeDelimiter = "\u00a0"

" Type :Help to open help vertically
command -nargs=* -complete=help Help vertical belowright help <args>

" Make the active window more visible and highlight the text width
nnoremap <C-L><C-L> :execute "set colorcolumn=" . (&colorcolumn == "" ? "80" : "")<CR>
set colorcolumn=80
augroup BgHighlight
    autocmd!
    autocmd WinEnter * set colorcolumn=80
    autocmd WinLeave * set colorcolumn=0
augroup END

" Type C-k to go to definitions backwards (python)
nnoremap <C-k> ?^\s*def\\|^\s*class<CR>

" Type gb to see list of buffers and select one
nnoremap gb :buffers<CR>:buffer<Space>

nmap <C-h> : hide<CR>

" open ctag in tab/vertical split
 map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
 map <leader><C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Local .lvimrc
if filereadable(expand(printf('%s/%s', getcwd(), '.lvimrc')))
  exec printf('source %s/%s', getcwd(), '.lvimrc')
endif
