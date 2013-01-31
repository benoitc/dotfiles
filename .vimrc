
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start


set nobackup		" keep a backup file
set history=50		" keep 50 lines of command line history
set incsearch		" do incremental searching


set listchars=tab:>.,trail:.
set tw=78

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
  autocmd FileType text setlocal textwidth=78

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
"set enc=utf-8


if exists('+colorcolumn')
    set colorcolumn=80
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif


"set ls=2
set statusline=%<%F%h%m%r%h%w%y\ %{&ff}\ %{strftime(\"%d/%m/%Y-%H:%M\")}%=\ %c%V\ %l\,%L\ %P

color wombat

filetype plugin on
"filetype plugin indent on

if has("multi_byte")
     set encoding=utf-8
     setglobal fileencoding=utf-8
     "set bomb
     set termencoding=iso-8859-15
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
    color wombat

    set guioptions-=T
    set guioptions-=m
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R

    set guifont="Sans 8"
endif


" autocompletion when using tab
function! CleverTab()
       if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
               return "\<Tab>"
       else
               return "\<C-N>"
       endif
endfunction


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


" mappings
inoremap <Tab> <C-R>=CleverTab()<CR>
imap <C-Space> <C-X><C-O>

noremap <silent> <F4> :Tlist<CR>
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" html5
"set makeprg=/home/benoitc/bin/validate-html.sh\ %
set errorformat=%f:%l.%c-%m

autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType js setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascripts setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4

au BufRead,BufNewFile *.json set filetype=json
au! Syntax json source /Users/benoitc/.vim/ftplugin/json.vim
au BufRead,BufNewFile *.dtl set filetype=htmldjango

autocmd FileType python autocmd BufWritePre * :%s/\s\+$//e
autocmd FileType erlang autocmd BufWritePre * :%s/\s\+$//e
autocmd FileType js autocmd BufWritePre * :%s/\s\+$//e
autocmd FileType javascript autocmd BufWritePre * :%s/\s\+$//e

set directory=~/.backup/vim/swap
set backupdir=~/.backup/vim
set backup 
