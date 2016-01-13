" GUI vim options
set guifont=Monaco:h11
set guioptions-=T
set guioptions-=t

set guioptions-=R
set guioptions-=r

set guioptions-=L
set guioptions-=l

nnoremap <silent> <Esc> :nohl<CR><Esc>

set cursorcolumn
set cursorline

autocmd BufEnter * :set noballooneval
