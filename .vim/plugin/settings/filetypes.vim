autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType js setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType erlang setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2

autocmd FileType proto setlocal shiftwidth=4 softtabstop=4 tabstop=4 smarttab


au BufRead,BufNewFile *.json set filetype=json
au! Syntax json source /Users/benoitc/.vim/ftplugin/json.vim
au BufRead,BufNewFile *.dtl set filetype=htmldjango

autocmd FileType python autocmd BufWritePre * :%s/\s\+$//e
autocmd FileType erlang autocmd BufWritePre * :%s/\s\+$//e
autocmd FileType js autocmd BufWritePre * :%s/\s\+$//e
autocmd FileType go autocmd BufWritePre * :%s/\s\+$//e
