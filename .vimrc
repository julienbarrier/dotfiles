"
" .vimrc
" Julien Barrier
" julien.barrier@espci.org
"

set nocompatible                "we want vim, not vi

filetype plugin indent on       "load plugins according to detected filetype
syntax on                       "syntax highlighting

set shell=sh

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

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
set nobackup "everything is in git anyway
set nowb
"set backupdir=~/.vim_backup
set noswapfile

" persistent mode to undo stuff even after closing a file
try
set undodir=~/.vim_runtime/temp_dirs/undodir
set undofile
catch
endtry


set t_Co=256
set encoding=utf8
set fileencoding=utf-8


" colorise nbsp
highlight NbSp ctermbg=lightgray guibg=lightred
match NbSp /\%xa0/

source ~/.vimrc_bepo            "French dvorak keyboard layourt (bépo)

"spelling
set spellfile   =~/.vim/spell/en.utf-8.add,~/.vim/spell/fr.utf-8.add
set spelllang   =en,fr

" parenthesis/bracket
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a`<esc>`<i`<esc>

" Map auto complete of (, ", ', [
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i

"breaking
set wrap
set nolinebreak
set breakindent
set breakindentopt  =min:40

"set gfn=IBM\ Plex\ Mono:h14 ",DroidSansMono\ Nerd\ Font:h11,Hack:h14,Source\ Code\ Pro:h15,Menlo:h15 "Source code pro font

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
Plug 'joshdick/onedark.vim'
Plug 'julienbarrier/bogster.vim'
Plug 'HenryNewcomer/vim-theme-papaya'
Plug 'RohanPoojary/pleasant.vim'
Plug 'nickaroot/vim-xcode-dark-theme'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'amix/vim-zenroom2'
Plug 'tpope/vim-commentary'
Plug 'groenewege/vim-less'
Plug 'pangloss/vim-javascript'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-perl/vim-perl'
Plug 'preservim/vim-wordy'
Plug 'gko/vim-coloresque'
Plug 'preservim/nerdtree' |
    \ Plug 'Xuyuanp/nerdtree-git-plugin' |
    \ Plug 'tiagofumo/vim-nerdtree-syntax-highlight' |
    \ Plug 'PhilRunninger/nerdtree-buffer-ops' |
    \ Plug 'PhilRunninger/nerdtree-visual-selection' |
    \ Plug 'ryanoasis/vim-devicons' | "better to load this one at the end
call plug#end()

"plugin dependent config
set termguicolors
"let g:molokai_original = 1
let g:rehash256 = 1
let g:seoul256_background = 233
colorscheme molokai "pleasant papaya default theme
let g:vim_markdown_folding_disabled = 1 "on plug:vim-markdown, disable default folding

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
" open NERDTree on any tab
autocmd BufWinEnter * silent NERDTreeMirror


" ========================
" programming: autocompile
" ========================

map <F5> :call CompileRun()<CR>
imap <F5> <Esc>:call CompileRun()<CR>
vmap <F5> <Esc>:call CompileRun()<CR>

func! CompileRun()
exec "w"
if &filetype == 'c'
    exec "!gcc % -o %<"
    exec "!time ./%<"
elseif &filetype == 'cpp'
    exec "!g++ % -o %<"
    exec "!time ./%<"
elseif &filetype == 'sh'
    exec "!time bash %"
elseif &filetype == 'python'
    exec "!time python3 %"
elseif &filetype == 'html'
    exec "!open -a Safari % &"
    exec "!time go run %"
endif
endfunc
