" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif


" Pre-Vundle Setup
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'
" Vundle Bundles
Plugin 'Solarized'
Plugin 'StripWhiteSpaces'
Plugin 'fatih/vim-go'
Plugin 'flazz/vim-colorschemes'
Plugin 'godlygeek/tabular.git'
Plugin 'junegunn/vim-easy-align'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'mileszs/ack.vim'
Plugin 'slim-template/vim-slim'
Plugin 'surround.vim'
Plugin 'tComment'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'vim-coffee-script'
Plugin 'vim-ruby/vim-ruby'


" Remap the leader key
:let mapleader = ','

" Rspec keyboard shortcuts
" map <Leader>t :call RunCurrentSpecFile()<CR>
" map <Leader>s :call RunNearestSpec()<CR>
" map <Leader>l :call RunLastSpec()<CR>
" map <Leader>a :call RunAllSpecs()<CR>
" map <Leader>/ :nohl<CR>

" Golang shortcuts
map <Leader>a :%!goimports<CR>

syntax enable
set background=dark
colorscheme solarized

filetype plugin indent on
set autoindent " copy indent from current line for new line
set autoread " keep buffer in sync with filesystem
set backspace=indent,eol,start " make backspace always work
set directory=/var/tmp//
set expandtab " use soft tab for tab key
set hls
set ignorecase
set includeexpr+=substitute(v:fname,'s$','','g')
set incsearch " turn on incremental search
set iskeyword+=-
set iskeyword+=? " include ? in words for movement/highlighting/<cword>
set nocompatible " errybody does it
set nowrap
set number " show line numbers
set ruler " turn on line at the bottom right of the window
set rulerformat=%c\ %l\/%L " column current_line/total_lines
set scrolloff=8 " always show 8 lines of context
set shiftwidth=2
set showtabline=2 " Always show the tab bar
set sm " show matching braces
set smartcase
set suffixesadd=.css
set suffixesadd=.js
set suffixesadd=.rb
set sw=2 " soft tab width in spaces
set t_Co=256
set tabstop=2
set tags+=gems.tags
set ts=2
set viminfo^=! " make project list persist across restarts
set visualbell t_vb= " turn off visualbell
set wildmenu
set wildmode=longest,list,full


" run vim-rspec in iTerm
let g:rspec_runner = "os_x_iterm"

imap %% <%=  %><Left><Left><Left>

let g:agprg="ag --column --smart-case"

map <Leader>p :let @" = expand("%")<CR>

let g:ctrlp_extensions = ['funky']
nnoremap <Leader>u :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
nnoremap <Leader>f :CtrlPFunky<Cr>

nnoremap <Leader>- :set iskeyword+=-<CR>
nnoremap <Leader>? :set iskeyword+=?<CR>

nnoremap <Leader>g :Ack <cword><CR>

" run matchit.vim to enable using % to navigate ruby do...end
runtime! macros/matchit.vim

" Ctrl-P custom ignore: do not scan the vendor folder (for large Rails projects)
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](vendor)|(tmp)$'
  \ }

autocmd BufEnter * :syntax sync fromstart

" mapping to make movements operate on 1 screen line in wrap mode
function! ScreenMovement(movement)
   if &wrap
      return "g" . a:movement
   else
      return a:movement
   endif
endfunction
onoremap <silent> <expr> j ScreenMovement("j")
onoremap <silent> <expr> k ScreenMovement("k")
onoremap <silent> <expr> 0 ScreenMovement("0")
onoremap <silent> <expr> ^ ScreenMovement("^")
onoremap <silent> <expr> $ ScreenMovement("$")
nnoremap <silent> <expr> j ScreenMovement("j")
nnoremap <silent> <expr> k ScreenMovement("k")
nnoremap <silent> <expr> 0 ScreenMovement("0")
nnoremap <silent> <expr> ^ ScreenMovement("^")

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
nnoremap <silent> <expr> $ ScreenMovement("$")
