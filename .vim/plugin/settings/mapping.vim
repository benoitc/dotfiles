" basic Mappings
nnoremap ; :
nnoremap j gj
nnoremap k gk

"autocompletion when using tab
function! CleverTab()
       if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
               return "\<Tab>"
       else
               return "\<C-N>"
       endif
endfunction

inoremap <Tab> <C-R>=CleverTab()<CR>
imap <C-Space> <C-X><C-O>

noremap <silent> <F4> :Tlist<CR>
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
