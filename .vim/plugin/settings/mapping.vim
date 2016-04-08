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

nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" minibuffer explorer
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
