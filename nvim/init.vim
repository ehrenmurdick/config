call plug#begin('~/.local/share/nvim/plugged')

Plug 'alvan/vim-closetag'
Plug 'brendonrapp/smyck-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dag/vim-fish'
Plug 'elmcast/elm-vim'
Plug 'exu/pgsql.vim'
Plug 'fatih/vim-go'
Plug 'flazz/vim-colorschemes'
Plug 'godlygeek/tabular'
Plug 'idris-hackers/idris-vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/vim-easy-align'
Plug 'mattn/emmet-vim'
Plug 'mbbill/undotree'
Plug 'ntpeters/vim-better-whitespace'
Plug 'pangloss/vim-javascript'
Plug 'powerline/powerline'
Plug 'purescript-contrib/purescript-vim'
Plug 'rakr/vim-one'
Plug 'sbdchd/neoformat'
Plug 'sheerun/vim-polyglot'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/tComment'
Plug 'wilsaj/chuck.vim'

call plug#end()

let mapleader=','

syntax enable

filetype on
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
set cursorline
set cursorcolumn
set sw=2 " soft tab width in spaces
set t_Co=256
set tabstop=2
set ts=2
set viminfo^=! " make project list persist across restarts
set visualbell t_vb= " turn off visualbell
set wildmenu
set wildmode=longest,list,full

" run matchit.vim to enable using % to navigate ruby do...end
runtime! macros/matchit.vim

let g:javascript_plugin_flow = 1
" let g:jsx_ext_required = 0

let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/](vendor)|(tmp)|(node_modules)|(output)|(bower_components)$'
      \ }

autocmd BufEnter * :syntax sync fromstart
" autocmd BufEnter Dockerfile* :setf dockerfile

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

let g:closetag_filenames = "*.xml,*.html,*.xhtml,*.phtml,*.js,*.jsx,*.html.erb"
nnoremap <Leader>c :CloseTagToggleBuffer<CR>


nnoremap <silent> <Esc> :nohl<CR><Esc>

nnoremap <silent> <Leader>s :StripWhitespace<CR><Esc>

nnoremap <silent> <Leader>w :w<CR>
nnoremap <silent> <Leader>q :q<CR>
nnoremap <silent> <Leader>r :e %<CR>

nnoremap <silent> <Leader>n :tabn<CR>
nnoremap <silent> <Leader>p :tabp<CR>

nnoremap <silent> <Leader>m :wincmd w<CR>

nnoremap <silent> <Leader>u :UndotreeToggle<CR>

noremap <F3> :Neoformat<CR>

vnoremap s :sort<CR>

function Hfmt()
  silent! !hfmt -w <afile>
  edit
endfunction
autocmd BufWritePost *.hs call Hfmt()

" let g:lightline = {
"     \ 'active': {
"     \   'left': [ [ 'mode', 'paste' ],
"     \             [ 'filename', 'gitbranch', 'modified', ] ],
"     \   'right': [ [ 'lineinfo' ],
"     \              [ 'percent' ],
"     \              [ 'filetype', ] ]
"     \ },
"     \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
"     \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
"     \ 'component': {
"     \ },
"     \ 'component_function': {
"     \   'gitbranch': 'gitbranch#name'
"     \ },
"     \ }

set background=dark
colors Tomorrow-Night

highlight Pmenu ctermfg=gray
highlight PmenuSel ctermfg=white

highlight Normal ctermbg=none
highlight NonText ctermbg=none


let g:neoformat_enabled_javascript = ['eslint_d']
let g:neoformat_enabled_json = ['jq']


" syntax for .cfdg files
au BufNewFile,BufRead *.cfdg,*.CFDG	setf cfdg
