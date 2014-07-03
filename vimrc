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
Plugin 'godlygeek/tabular.git'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'slim-template/vim-slim'
Plugin 'surround.vim'
Plugin 'tComment'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'vim-coffee-script'
Plugin 'vim-ruby/vim-ruby'

" Remap the leader key
:let mapleader = ','

" Rspec keyboard shortcuts
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
map <Leader>/ :nohl<CR>

syntax enable
set background=dark
colors solarized

filetype plugin indent on
set autoindent " copy indent from current line for new line
set autoread " keep buffer in sync with filesystem
set backspace=indent,eol,start " make backspace always work
set cursorcolumn
set cursorline
set directory=/var/tmp//
set expandtab
set expandtab " use soft tab for tab key
set gdefault
set hls
set ignorecase
set includeexpr+=substitute(v:fname,'s$','','g')
set incsearch " turn on incremental search
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
set tildeop
set ts=2
set viminfo^=! " make project list persist across restarts
set visualbell t_vb= " turn off visualbell
set wildmenu
set wildmode=longest,list,full

let g:agprg="ag --column --smart-case"

" run vim-rspec in iTerm
let g:rspec_runner = "os_x_iterm"

let g:ctrlp_extensions = ['funky']
nnoremap <Leader>u :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
nnoremap <Leader>f :CtrlPFunky<Cr>

" run matchit.vim to enable using % to navigate ruby do...end
runtime! macros/matchit.vim
