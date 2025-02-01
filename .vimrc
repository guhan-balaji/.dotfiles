" initialization
if filereadable($VIMRUNTIME)
  source $VIMRUNTIME/defaults.vim
endif

if has("syntax")
  syntax on;
endif

if has("autocmd")
  filetype plugin indent on
endif

" Leader key
nnoremap <SPACE> <Nop>
let mapleader=" "

" disable compatibility to old vi
set nocompatible

set autoindent
set smartindent

set background=dark

" Show partial command in status line.
set showcmd

" Show matching brackets.
set showmatch

" Do case insensitive matching
set ignorecase

" Do smart case matching
set smartcase

" Don't persist highlight after search
set nohlsearch

" Incremental search
set incsearch

" Automatically save before commands like :next and :make
set autowrite

" Hide buffers when they are abandoned
set hidden

" Enable mouse usage on all modes
set mouse=a

"Default commented settings from /etc/vim/vimrc ends.

" backspace settings starts 

set backspace=start,eol,indent  
" indent    allow backspacing over autoindent
" eol       allow backspacing over line breaks join lines
" start     allow backspacing over the start of insert; CTRL-W and CTRL-U stop once at the start of insert.

" backspace settings ends

" tab settings start

" enter spaces when tab is pressed
set expandtab

" tabstop is effectively how many columns of whitespace a \t character is worth.
set tabstop=4

" softtabstop is how many columns of whitespace a tab keypress or a backspace keypress
set softtabstop=4

" shiftwidth is how many columns of whitespace a “level of indentation” is worth...
" ...The > action indents by 1 level.
set shiftwidth=4


" tab settings ends

" break lines when line length increases
set textwidth=80

" show line number on left and show relative line numbers 
set nu rnu

" using system clipboard
"set clipboard=unnamedplus

" highlight cursorline
"set cursorline

" speedup scrolling
set ttyfast

" cursor settings starts.

let &t_EI = "\<Esc>[1 q"    " default cursor usually blinking block otherwise
let &t_SI = "\<Esc>[5 q"    " blinking I-beam in insert mode
let &t_SR = "\<Esc>[3 q"    " blinking underline in replace mode

" Ps = 0  -> blinking block.
" Ps = 1  -> blinking block (default).
" Ps = 2  -> steady block.
" Ps = 3  -> blinking underline.
" Ps = 4  -> steady underline.
" Ps = 5  -> blinking bar (xterm).
" Ps = 6  -> steady bar (xterm).

" cursor settings ends.

" mappings for escape key in insert and visual mode starts.
inoremap jk <Esc><Space>
inoremap kj <Esc><space>
vnoremap jk <Esc>
vnoremap kj <Esc>

" move line or visually selected block - alt+j/k
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Doom emacs like bindings.
"
" file operations
nnoremap <Space>bs :w
nnoremap <Space>bd :q
nnoremap <Space>wd :q
nnoremap <Space>fr :saveas 
nnoremap <Space>qq :q!

" map space <-> ctrl for splitting panes
nnoremap <Space>ws <C-w>s
nnoremap <Space>wv <C-w>v
nnoremap <Space>ww <C-w>w
nnoremap <Space>wh <C-w>h
nnoremap <Space>wj <C-w>j
nnoremap <Space>wk <C-w>k
nnoremap <Space>wl <C-w>l

" map space <-> ctrl for adjusting window size
nnoremap <Space>w+    <C-w>+
nnoremap <Space>w-    <C-w>-
nnoremap <Space>w>    <C-w>>
nnoremap <Space>w<    <C-w><
nnoremap <Space>wmm   100<C-w>+

" move split panes to left/bottom/top/right
nnoremap <A-h> <C-W>H
nnoremap <A-j> <C-W>J
nnoremap <A-k> <C-W>K
nnoremap <A-l> <C-W>L

" move between panes to left/bottom/top/right
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" disable swap files
set noswapfile

" centralizes swp and backup files in one location starts.

set backupdir=~/.cache/vim/backup//
"set directory=~/.cahce/vim/swap//
"set undodir=~/.cache/vim/undo//

" with two trailing slashes vim will create swap files using the whole path of
" the files being edited to avoid collisions (slashes in the file's path will be
" replaced by percent symbol %).
" For example, if you edit /path/one/foobar.txt and /path/two/foobar.txt, then
" you will see two swap files in ~/.vim/swap/ that are named
" %path%one%foobar.txt and %path%two%foobar.txt, respectively.

" centralizes swp and backup files in one location ends.

" Plugins

call plug#begin("~/.vim/plugged")

Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'honza/vim-snippets'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
"Plug 'SirVer/ultisnips'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" plugin custom keys:

" nerdtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <Space>n :NERDTree<CR>
nnoremap <Space>op :NERDTreeToggle<CR>
nnoremap <Space>f :NERDTreeFind<CR>

