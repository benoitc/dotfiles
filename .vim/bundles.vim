set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim
filetype off


call vundle#begin()

Bundle 'gmarik/vundle'

"Bundle 'kana/fakeclip'
"Bundle 'vim-utils/vim-husk'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'airblade/vim-gitgutter'
"Bundle 'christoomey/vim-tmux-navigator'
Bundle 'elixir-lang/vim-elixir'
"Bundle 'jimenezrick/vimerl'
"Bundle 'rizzatti/dash.vim'
Bundle 'tpope/vim-markdown'
Bundle 'cHoco/vim-togglecursor'
Bundle 'vim-erlang/vim-erlang-runtime'
Bundle 'vim-erlang/vim-erlang-tags'
Bundle 'vim-erlang/vim-erlang-omnicomplete'
Bundle 'vim-erlang/vim-erlang-compiler'
Bundle 'vim-erlang/vim-erlang-skeletons'
Bundle 'scrooloose/nerdtree'
Bundle 'uarun/vim-protobuf'
Plugin 'Xuyuanp/nerdtree-git-plugin'

call vundle#end()
filetype plugin indent on
