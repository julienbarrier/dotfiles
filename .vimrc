"
" vimrc
" Julien Barrier
" julien.barrier@espci.org
"

set nocompatible                "we want vim, not vi

filetype plugin indent on       "load plugins according to detected filetype
syntax on                       "syntax highlighting

set autoindent                  "indent according to previous line
set expandtab                   "use spaces instead of tabs
set softtabstop =4              "tab key indents by 4 spaces
set shiftwidth  =4              ">> indents by 4 sapeces
set shiftround                  ">> indents to next multiple of 'shiftwidth'

set backspace=indent,eol,start  "backspace works as we can expect
set hidden                      "switch between buffers without having to save
set laststatus  =2              "always sho statusline
set display     =lastline       "show as much as possible of the last line

set showmode                    "show current mode in command-line
set showcmd                     "show typed key when more are expected

set incsearch                   "highlight while searching
set hlsearch                    "keep matches highlighted

set ttyfast                     "faster redrawing
set lazyredraw                  "only redraw when necessary

set splitbelow                  "open new windws below the current window
set splitright                  "open new windows right of the current window

set cursorline                  "find current line quickly
set wrapscan                    "searches wrap around end-of-file
set report      =0              "always report changed lines
set textwidth   =81             "the lines are 81 characters long

"set list                       "show non-printable characters


"set nowrap
set showmatch
set ignorecase
set smartcase
set autowrite
set nomodeline
set history=50
set ruler
set number
set title
set visualbell
set backup
"set backupdir=~/.vim_backup
set noswapfile


set t_Co=256
set encoding=utf-8
set fileencoding=utf-8

"theme molokai
let g:molokai_original = 1
colorscheme molokai

" colorise nbsp
highlight NbSp ctermbg=lightgray guibg=lightred
match NbSp /\%xa0/

source ~/.vimrc_bepo            "French dvorak keyboard layourt (bépo)

"spelling
set spellfile   =~/.vim/spell/en.utf-8.add,~/.vim/spell/fr.utf-8.add
set spelllang   =en,fr

"breaking
set wrap
set nolinebreak
set breakindent
set breakindentopt  =min:40


if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif







"Pluggins vim. here the list of all installed (or to be installed) plugins
call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug' "let Plug update itself
Plug 'junegunn/goyo.vim' "minimalist theme
Plug 'itchyny/lightline.vim' "the bar
Plug 'vim-latex/vim-latex'
Plug 'godlygeek/tabular' "necessary for markdown
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-fugitive' "git
Plug 'junegunn/gv.vim' "git commit browser
Plug 'whatyouhide/vim-lengthmatters'
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
Plug 'junegunn/seoul256.vim'
Plug 'tomasr/molokai'
call plug#end()
