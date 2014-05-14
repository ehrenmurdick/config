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

" Syntax highlighting FTW
syntax on

Plugin 'gmarik/vundle'
" Vundle Bundles
Plugin 'StripWhiteSpaces'
Plugin 'ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'surround.vim'
Plugin 'tComment'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'vim-ruby/vim-ruby'


" Setting Spacing and Indent (plus line no)
set nu
set tabstop=2 shiftwidth=2 expandtab
filetype plugin indent on
set ts=2

" Colorscheme
colorscheme desert

" Don't wrap my lines
set nowrap

" Remap the leader key
:let mapleader = ','

" Set 256 colors
set t_Co=256
set guifont=Monaco:h16

" Rspec keyboard shortcuts
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

hi CursorColumn guibg=#302332
hi CursorLine   guibg=#302332
hi Error        guibg=#744A49
hi IncSearch    gui=underline
hi IncSearch    guibg=#141321
hi IncSearch    guifg=#66418C
hi Pmenu        guibg=#000000
hi Search       gui=NONE
hi Search       guibg=#141321
hi Search       guifg=#66418C

" Also tag gem sources
set tags+=gems.tags


" Always show the tab bar
set showtabline=2

set autoindent " copy indent from current line for new line
set autoread
set backspace=indent,eol,start " make backspace always work
set directory=/var/tmp//
set expandtab " use soft tab for tab key
set gdefault
set hls
set includeexpr+=substitute(v:fname,'s$','','g')
set incsearch " turn on incremental search
set nocompatible " errybody does it
set nowrap
set number
set ruler " turn on line at the bottom right of the window
set rulerformat=%c\ %l\/%L " column current_line/total_lines
set showtabline=2
set sm " show matching braces
set suffixesadd=.css
set suffixesadd=.js
set suffixesadd=.rb
set sw=2 " soft tab width in spaces
set tabstop=2
set tildeop
set viminfo^=! " make project list persist across restarts
set visualbell t_vb= " turn off visualbell
set wildmenu
set wildmode=longest,list,full
set scrolloff=8 " always show 8 lines of context

" search is case sensitive only if you search for an upcase
set ignorecase
set smartcase

" run vim-rspec in iTerm
let g:rspec_runner = "os_x_iterm"

" keep the buffer in sync with filesystem without prompting
set autoread
