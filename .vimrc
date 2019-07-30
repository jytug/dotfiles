syntax on

colorscheme elflord

" Line numbers - by default current line is absolute,
" while all others are relative. Press Ctrl-N twice to
" toggle the relativenumber option
set relativenumber
set number
nmap <C-N><C-N> :set invrelativenumber<CR>
set textwidth=79

" highlight when searching
set hlsearch

" Tab completion made easier
set wildmode=longest,list,full
set wildmenu

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

"------------------------
" PLUGINS
"------------------------

" To install Vim-Plug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin()


" To install pathogen
" mkdir -p ~/.vim/autoload ~/.vim/bundle && \
" curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
execute pathogen#infect()

" For commenting
Plug 'scrooloose/nerdcommenter'

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

call plug#end()

" tags
set tags=tags
nnoremap <silent><Leader><C-]> <C-w><C-]><C-w>T

" Python completion
filetype plugin on
let g:pydiction_location = '/Users/filip/.pydiction/complete-dict'

" Python imports
nmap <C-m> : ImportName<CR>
command Isort :%! isort - -w 79 -m 0

" Workaround for NERDTree
let g:NERDTreeNodeDelimiter = "\u00a0"

" Type :Help to open help vertically
command -nargs=* -complete=help Help vertical belowright help <args>

" Make the active window more visible
set colorcolumn=80
augroup BgHighlight
    autocmd!
    autocmd WinEnter * set colorcolumn=80
    autocmd WinLeave * set colorcolumn=0
augroup END

" Type '' to copy selection to system clipboard (Mac)
vmap '' :w !pbcopy<CR><CR>

" Type gb to see list of buffers and select one
nnoremap gb :buffers<CR>:buffer<Space>

nmap <C-h> : hide<CR>

" open ctag in tab/vertical split
 map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
 map <leader><C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
