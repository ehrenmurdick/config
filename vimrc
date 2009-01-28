"imap ii <Esc>
 
set incsearch

set tildeop

set autoindent
set sw=2

set guioptions-=t

set expandtab
set nocompatible
set sm
syntax on

imap <D-i> 
imap  


" http://items.sjbach.com/319/configuring-vim-right
nnoremap ' `
nnoremap ` '

runtime macros/matchit.vim

set hidden

set ignorecase
set smartcase
set scrolloff=6

set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" end http://items.sjbach.com/319/configuring-vim-right


autocmd BufRead,BufNewFile *.rjs     set filetype=ruby
autocmd BufRead,BufNewFile *.rxml    set filetype=ruby
autocmd BufRead,BufNewFile *.rsel    set filetype=ruby

set ruler
set rulerformat=%c\ %l\/%L

set guioptions-=T
set guioptions-=r


set wildmenu


set autoindent
set tabstop=2
set sw=2
set columns=120
set lines=35
set nowrap

set showtabline=2

set number

set backspace=2

set guioptions-=t

set expandtab
set nocompatible
set sm

set guifont=Panic\ Sans:h15
set transp=7

syntax on


imap %% <%=%><Left><Left>


map <S-Left> I<BS><BS>
map <S-Right> I  



autocmd BufRead,BufNewFile *.rjs     set filetype=ruby
autocmd BufRead,BufNewFile *.rxml    set filetype=ruby

colors ir_black

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

map <D-H> :call GotoDefaultWd()

hi IncSearch guifg=#66418C 
hi CursorColumn guibg=#131320
hi CursorLine guibg=#131320
set cursorline
set cursorcolumn

set hls
hi Search guifg=#66418c
hi Search gui=NONE

" fuzzyfindertextmate: cmd-e to trigger, cmd-enter to open selected file in new tab
let g:FuzzyFinderOptions = { 'Base':{}, 'Buffer':{}, 'File':{}, 'Dir':{}, 'MruFile':{}, 'MruCmd':{}, 'FavFile':{}, 'Tag':{}, 'TaggedFile':{}}
let g:FuzzyFinderOptions.Base.key_open_tab = '<D-CR>'
map <D-e> :FuzzyFinderTextMate<CR>

let g:FuzzyFinderOptions.Base.abbrev_map  = {
      \   "^conf" : [
      \     '../config/',
      \   ],
      \ }
