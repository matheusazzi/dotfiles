filetype off " required

" The mapleader has to be set before loading the plugins.
let mapleader=','

call plug#begin()
Plug 'dracula/vim'
Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'
Plug 'chrisbra/Colorizer.git'

Plug 'scrooloose/nerdtree.git', { 'on': 'NERDTreeToggle' }
Plug 'jistr/vim-nerdtree-tabs.git', { 'on': 'NERDTreeToggle' }
Plug 'kien/ctrlp.vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install -all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'bogado/file-line'
Plug 'prettier/vim-prettier'
Plug 'tpope/vim-fugitive'
Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'
call plug#end()

" ================ General Config ====================

set encoding=utf-8
scriptencoding utf-8
set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=500                 "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
"set showmode                   "Show current mode down the bottom
set noshowmode                  "Use lightline
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set t_vb=                       "Disable screen flash
set autoread                    "Reload files changed outside vim
set laststatus=2
set mouse=a                     "Allow mouse

set guioptions=                 "Hide right scrollbar

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

"set nowrap      "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital
set inccomand=split

let g:ackprg = 'ag --nogroup --nocolor --column'
set colorcolumn=80    "Have a line after 80 char

set spelllang=en_us   "Set the spellchecking language

nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
nnoremap j gj
nnoremap k gk

nnoremap <C-\> :NERDTreeToggle<CR>
nnoremap <C-p> :Files<CR>
nnoremap <C-f> :Ag<CR>

let g:dracula_colorterm = 0
let g:dracula_italic = 0

colorscheme dracula
set guifont=OperatorMono-Book:h19
set ruler               " Add ruler at the bottom of vim

if has('gui_running')
  set macligatures      " ligatures (only for MacVIM)
end
