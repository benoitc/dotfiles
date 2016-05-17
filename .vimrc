set nocompatible
set encoding=utf-8

" use the system clipboard by default, requires a Vim compiled
" " with +clipboard - `brew install vim` is the easiest way
set clipboard=unnamed



source ~/.vim/bundles.vim

filetype plugin indent on
filetype plugin on
syntax on

" allow backspacing over everything in insert mode
set backspace=indent,eol,start


set nobackup		" keep a backup file
set history=50		" keep 50 lines of command line history
set incsearch		" do incremental searching


set listchars=tab:>.,trail:.
set tw=80

map Q gq

syntax on
set hlsearch

filetype on

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on
  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=80

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")


" personnal config

set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set softtabstop=4
set number
set ruler
set scrolloff=10
set showcmd
set showmode
set updatetime=250
"set enc=utf-8;

" no error or visual error annoyance
set noerrorbells
set visualbell t_vb=

if exists('+colorcolum:n')
    set colorcolumn=80
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif


"set ls=2
set statusline=%<%F%h%m%r%h%w%y\ %{&ff}\ %{strftime(\"%d/%m/%Y-%H:%M\")}%=\ %c%V\ %l\,%L\ %P

filetype plugin on
filetype plugin indent on

if has("multi_byte")
     set encoding=utf-8
     setglobal fileencoding=utf-8
     "set bomb
     set termencoding=utf-8
     set fileencodings=utf-8,ucs-bom,iso-8859-15,iso-8859-3
else
     echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif

" Preview des <Tab>
"set list listchars=tab:»\



if has("gui_running")
    set ch=2		" Make command line two lines high

    set encoding=utf-8
    set mousehide		" Hide the mouse when typing text

    " Make shift-insert work like in Xterm
    map <S-Insert> <MiddleMouse>
    map! <S-Insert> <MiddleMouse>


    set hlsearch
    let c_comment_strings=1

    set guioptions-=T
    set guioptions-=m
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R

    set guifont="Sans 8"
else
    if has("mouse")
        set mouse=a
        set mousehide
    endif

    if has("mouse_sgr")
        set ttymouse=sgr
    endif
endif



set directory=~/.backup/vim/swap
set backupdir=~/.backup/vim
set backup

" don't resize automatically
let g:golden_ratio_autocommand = 0
"
"let &winheight = &lines * 7 / 10
"let &winheight = 999

" netrw options
"let g:netrw_altv            = 1
let g:netrw_fastbrowse      = 0
let g:netrw_keepdir         = 1 
let g:netrw_liststyle       = 1
let g:netrw_retmap          = 0
"let g:netrw_silent          = 1
"let g:netrw_special_syntax  = 1
"let g:netrw_use_errorwindow = 0
"let g:netrw_banner          = 0
let g:netrw_browse_split    = 0
"let g:netrw_errorlvl        = 0
"
"
"

" erlang options
let g:erl_author = "Benoit Chesneau"

" disable preview window
"set completeopt-=preview

" ctags
let Tlist_Ctags_Cmd = '/usr/local/bin/ectags' " Location of ctags
let Tlist_Sort_Type = "name" " order by 
let Tlist_Use_Right_Window = 1 " split to the right side of the screen
let Tlist_Compart_Format = 1 " show small meny
let Tlist_Exist_OnlyWindow = 1 " if you are the last, kill yourself
let Tlist_File_Fold_Auto_Close = 1 " Do not close tags for other files
let Tlist_Enable_Fold_Column = 0 " Do not show folding tree
    
" minibuffer explorer
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1


noremap <silent> <F4> :Tlist<CR>

" Source .vimrc on save
autocmd! bufwritepost ~/.vimrc  source ~/.vimrc
