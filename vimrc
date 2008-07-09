"imap ii <Esc>

set autoindent
set sw=2
set columns=90

set guioptions-=t

set expandtab
set nocompatible
set sm
syntax on

map s I  <Down>
map S I<BS><BS><Down>
map <S-Left> I<BS><BS>
map <S-Right> I  

  
autocmd BufRead,BufNewFile *.rjs     set filetype=ruby
autocmd BufRead,BufNewFile *.rxml    set filetype=ruby
autocmd BufRead,BufNewFile *.rsel    set filetype=ruby
