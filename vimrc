filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on

set nocompatible                  " Break compatibility with vi - Must come up here because it changes other options.

" Security - http://lists.alioth.debian.org/pipermail/pkg-vim-maintainers/2007-June/004020.html
set modelines=0

" -------------------
" --- Tabs/Spaces ---
" -------------------

set tabstop=4                     " Global tab width - Affects tabs already in a file.
set shiftwidth=4                  " Width of > and < commands in visual mode
set softtabstop=4                 " Backspace in insert mode removes X spaces
set expandtab                     " Use spaces instead of tabs

" ---------------------
" --- Basic Options ---
" ---------------------

syntax enable                     " Turn on syntax highlighting.
set background=dark
colorscheme solarized
set encoding=utf-8                " Use UTF-8 everywhere.
set scrolloff=3                   " Show 3 lines of context around the cursor.
set autoindent                    " Next line has same indentation as previous line
set showmode                      " Display the mode you're in.
set showcmd                       " Display incomplete commands.
set hidden                        " Handle multiple buffers better.
set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.
set backspace=indent,eol,start    " Intuitive backspacing.
set nojoinspaces                  " Remove spaces when joining lines
set ttyfast                       " Performance improvement (with remote terminals?)
set ruler                         " Show cursor position.
set visualbell                    " No beeping.
set number                        " Show line numbers.
set cursorline                    " Highlights current line
set directory=/tmp/               " Set temporary directory (don't litter local dir with swp/tmp files)
set wildignore=*.pyc,*.sqlite3,*.db,
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.ico               " Images
set wildignore+=*.eot,*.svg,*.ttf,*.woff                     " Fonts
set wildignore+=*.DS_Store                                   " OS X
set wildignore+=.git                                         " Version control
set wildignore+=*/vendor/bundle/*                            " Rails
"set paste                         " Return to sanity with pasting from OS X clipboard - This breaks indenting?!?!?!?
"set undofile                      " Create undo files for undo history after closing/opening a file
set clipboard=unnamed             " Allow yank etc to work with the OS X clipboard
"set list listchars=tab:›\ ,trail:·,eol:¬ " mark trailing white space
"set ignorecase                    " Case-insensitive searching.
"set smartcase                     " But case-sensitive if expression contains a capital letter.
"set incsearch                     " Highlight matches as you type.
"set hlsearch                      " Highlight matches.
"set title                         " Set the terminal's title
"set nobackup                      " Don't make a backup before overwriting a file.
"set nowritebackup                 " And again.
"set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

" -----------------
" --- Searching ---
" -----------------

" use perl/python regexes
nnoremap / /\v
vnoremap / /\v
set ignorecase                    " do all searches in lowercase...
set smartcase                     " ...unless there's uppercase characters
set gdefault                      " Always substitute globally on a line (To only replace the first instance, add /g at the end)
set incsearch                     " Highlight search patterns while typing
set showmatch                     " Jump to show matching brackets
set hlsearch                      " Highlight previous search pattern
nnoremap <leader><space> :noh<cr> " Quickly clear out search highlighting

" --------------------------
" --- Soft/Hard Wrapping ---
" --------------------------

set nowrap                        " Do not wrap on window width
"set linebreak                     " Don't break words to wrap
set textwidth=79                  " Maximum width of text
"set formatoptions=qrn1
set colorcolumn=80                " Set coloured column at 80 characters
"command! -nargs=* Wrap set wrap linebreak nolist " Quickly turn on line wrapping
"set showbreak=>>>

" -------------------------
" --- Tabstops and EOLs ---
" -------------------------

set list
set listchars=tab:▸\ ,eol:¬

" ------------------
" --- Leader Key ---
" ------------------

let mapleader = ","
let g:mapleader = ","

" -------------------
" --- Status Line ---
" -------------------

set laststatus=2                   " Always show the status line
set statusline=\ %f%m%r%h\ %w\ Line:\ %l/%L:%c " Customise the status line

" ---------------------------
" --- Custom key mappings ---
" ---------------------------

inoremap <Up>    <NOP>              " Turn off nasty cursor keys
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
noremap  <Up>    <NOP>
noremap  <Down>  <NOP>
noremap  <Left>  <NOP>
noremap  <Right> <NOP>
nnoremap <C-h>   <C-w>h             " Window navigation using hjkl
nnoremap <C-j>   <C-w>j
nnoremap <C-k>   <C-w>k
nnoremap <C-l>   <C-w>l

":imap jj <Esc>

" Command-T configuration
let g:CommandTMaxHeight=20

" ctrlp.vim configuration
let g:ctrlp_working_path_mode = 0
nnoremap <c-b> :CtrlPBuffer<CR>

" Simple buffer switching
nnoremap <F5> :buffers<CR>:buffer<Space>

" Execute currently selected lines as Python
vnoremap <f5> :!python<CR>

" Allow toggle of paste mode with F2
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" Omnicomplete
autocmd FileType ruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby let g:rubycomplete_buffer_loading=1
autocmd FileType ruby let g:rubycomplete_classes_in_global=1
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" Custom indentation for different file types
autocmd BufRead,BufNewFile *.js,*.js.coffee,*.js.erb,*.html set tabstop=2 shiftwidth=2

