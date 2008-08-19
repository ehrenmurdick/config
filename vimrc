"imap ii <Esc>
 
set autoindent
set sw=2

set guioptions-=t

set expandtab
set nocompatible
set sm
syntax on

imap <D-i> 
imap  


  
autocmd BufRead,BufNewFile *.rjs     set filetype=ruby
autocmd BufRead,BufNewFile *.rxml    set filetype=ruby
autocmd BufRead,BufNewFile *.rsel    set filetype=ruby

set ruler
set rulerformat=%c\ %l\/%L

set guioptions-=T
set guioptions-=r


set wildmode=longest,list


set autoindent
set tabstop=2
set sw=2
set columns=102
set lines=23
set nowrap

set showtabline=2

set number

set backspace=2

set guioptions-=t

set expandtab
set nocompatible
set sm

set guifont=Inconsolata:h20
set transp=7

syntax on


imap %% <%=%><Left><Left>


map <S-Left> I<BS><BS>
map <S-Right> I  



autocmd BufRead,BufNewFile *.rjs     set filetype=ruby
autocmd BufRead,BufNewFile *.rxml    set filetype=ruby

colors ehren

set suffixesadd=.rb
set suffixesadd=.css
set suffixesadd=.js
set includeexpr+=substitute(v:fname,'s$','','g')
" or you can add substitution pattern s/ies$/y/g, s/ves$/f/g like this:
" set includeexpr+=substitute(substitute(substitute(v:fname,'s$','','g'),'ie$','y','g'),'ve$','f','g')



" custom tab stuff
" tab navigation like safari
" idea adopted from: http://www.vim.org/tips/tip.php?tip_id=1221
"<apple-]>: Previous Tab
:nmap <D-[> :tabprevious<cr>
:map <D-[> :tabprevious<cr>
:imap <D-[> <ESC>:tabprevious<cr>i<Right>

"<apple-]>: Next Tab
:nmap <D-]> :tabnext<cr>
:map <D-]> :tabnext<cr>
:imap <D-]> <ESC>:tabnext<cr>i<Right>

"#<apple-t> : New Tab
:nmap <D-t> :tabnew<cr>
:imap <D-t> <ESC>:tabnew<cr>

" make backspace always work
set backspace=indent,eol,start

" make project list persist across restarts
set viminfo^=!

fun! FuckForLoopsErb()
  %s/for \(\w*\) in \(.*\)%>/\2.each do |\1| %>/
  %s/\s*.each/.each
endfun

fun! FuckForLoops()
  %s/for \(\w*\) in \(.*\)/\2.each do |\1|/
  %s/\s*.each/.each
endfun

fun! GotoDefaultWd()
  let foo = ''
  redir => foo
  silent ! /Users/ehrenmurdick/bin/iterm_default_wd
  redir END
  let bar = split(foo, "\n")
  execute 'cd ' . fnameescape(bar[1])
  e app/controllers/application.rb
endfun


fun! ProjectList(A,L,P)
  return split(globpath('/Users/ehrenmurdick/projects/', a:A . '*'), "\n")
endfun
com! -nargs=1 -complete=customlist,ProjectList Cd cd <args>


map <D-H> :call GotoDefaultWd()

source ~/.vim/snippets/all.vim
