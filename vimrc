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

set encoding=utf-8                " Use UTF-8 everywhere.
set scrolloff=3                   " Show 3 lines of context around the cursor.
set autoindent                    " Next line has same indentation as previous line
set showmode                      " Display the mode you're in.
set showcmd                       " Display incomplete commands.
set hidden                        " Handle multiple buffers better.
set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.
set visualbell                    " No beeping.
set cursorline                    " Highlights current line
set ttyfast                       " Performance improvement (with remote terminals?)
set ruler                         " Show cursor position.
set backspace=indent,eol,start    " Intuitive backspacing.
set relativenumber                " Relative line numbers
set nojoinspaces                  " Remove spaces when joining lines

"set undofile                      " Create undo files for undo history after closing/opening a file
"syntax enable                     " Turn on syntax highlighting.
"runtime macros/matchit.vim        " Load the matchit plugin.
"set clipboard=unnamed             " Allow yank etc to work with the OS X clipboard
"set list listchars=tab:›\ ,trail:·,eol:¬ " mark trailing white space
"set ignorecase                    " Case-insensitive searching.
"set smartcase                     " But case-sensitive if expression contains a capital letter.
"set number                        " Show line numbers.
"set incsearch                     " Highlight matches as you type.
"set hlsearch                      " Highlight matches.
"set title                         " Set the terminal's title
"set directory=/tmp/               " Set temporary directory (don't litter local dir with swp/tmp files)
"set nobackup                      " Don't make a backup before overwriting a file.
"set nowritebackup                 " And again.
"set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location
"set wildignore=*.pyc,*.sqlite3,*.db

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

" Quickly clear out search highlighting
nnoremap <leader><space> :noh<cr> 

" Hit escape to clear a search
" :nnoremap <esc> :noh<return><esc>

" --------------------------
" --- Soft/Hard Wrapping ---
" --------------------------

set wrap                          " Turn on line wrapping.
set linebreak                     " Don't break words on wrap
set textwidth=79                  " Maximum width of text
set formatoptions=qrn1
set colorcolumn=85
command! -nargs=* Wrap set wrap linebreak nolist " Quickly turn on line wrapping

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

set laststatus=2                   " Always hide the statusline
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c

function! CurDir()
    let curdir = substitute(getcwd(), '/Users/tim/', "~/", "g")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    else
        return ''
    endif
endfunction

" --------------
" --- MacVim ---
" --------------

if has("gui_running") 
    set guifont=LuxiMono:h12          " Font family and font size.
    set antialias                     " MacVim: smooth fonts.
    set guioptions-=T                 " Hide toolbar.
    colorscheme railscasts            " Colourscheme!
    set guioptions-=r                 " Don't show right scrollbar
    set guioptions-=L                 " Disable scrollbars in NERDTree
    hi ColorColumn guibg=#3d3d3d
endif 

" Navigate previous and next in the quickfix window (for use with :vimgrep)
nnoremap ]q :cnext<cr>
nnoremap [q :cprevious<cr>

" ---------------------------
" --- Custom key mappings ---
" ---------------------------

" Turn off cursor keys
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
"nnoremap j gj
"nnoremap k gk
" use jj instead of escape to exit insert mode
"noremap jj <esc>                 
" Window navigation using hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" NERDTree shortcut
" nmap <silent> <c-n> :NERDTreeToggle<CR>
" let NERDTreeIgnore=['.vim$', '\~$', '.*\.pyc$', 'pip-log\.txt$']

" NerdCommenter
"<leader>c<space>

" Command-T configuration
let g:CommandTMaxHeight=20

" Simple buffer switching
nnoremap <F5> :buffers<CR>:buffer<Space>

" Execute currently selected lines as Python
vnoremap <f5> :!python<CR>

" File type detection, mostly for Snipmate
au BufRead,BufNewFile *.html set filetype=html.htmldjango
au BufRead,BufNewFile *.htm set filetype=html.htmldjango
au BufRead,BufNewFile *.py set filetype=python.django
au BufRead,BufNewFile *.rb set filetype=ruby.ruby-rails.ruby-rspec.ruby-factorygirl
"au BufRead,BufNewFile *.html.erb set filetype=html.eruby.eruby-rails
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

"autocmd BufNewFile,BufRead *.html.erb set filetype=html.eruby
"autocmd FileType eruby set ft=html.eruby.eruby-rails

" --------------------
" --- Omnicomplete ---
" --------------------

imap <c-space> <c-x><c-o>
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS

if filereadable($VIRTUAL_ENV . '/.vimrc')
    source $VIRTUAL_ENV/.vimrc
endif