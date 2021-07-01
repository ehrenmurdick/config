call plug#begin('~/.local/share/nvim/plugged')

Plug 'alvan/vim-closetag'
Plug 'brendonrapp/smyck-vim'
Plug 'dag/vim-fish', { 'for': 'fish' }
Plug 'elmcast/elm-vim', { 'for': 'elm' }
Plug 'exu/pgsql.vim', { 'for': 'sql' }
Plug 'fatih/vim-go', { 'for': 'golang' }
Plug 'flazz/vim-colorschemes'
Plug 'godlygeek/tabular'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'maxbane/vim-asm_ca65'
Plug 'mbbill/undotree'
Plug 'mg979/vim-visual-multi'
Plug 'mileszs/ack.vim'
Plug 'mpickering/hlint-refactor-vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'powerline/powerline'
Plug 'purescript-contrib/purescript-vim', { 'for': 'purescript' }
Plug 'rakr/vim-one'
Plug 'sbdchd/neoformat'
Plug 'sheerun/vim-polyglot'
Plug 'sirtaj/vim-openscad'
Plug 'sirver/UltiSnips'
Plug 'skwp/vim-html-escape'
Plug 'slim-template/vim-slim'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-abolish' " bash expansions for :S like :S/child{,ren}/adult{,s}
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/tComment'
Plug 'w0rp/ale'
Plug 'wilsaj/chuck.vim'

call plug#end()


let mapleader=','

syntax enable

filetype on
filetype plugin indent on

set autoindent " copy indent from current line for new line
set autoread " keep buffer in sync with filesystem
set backspace=1 " weaken backspace, use the correct vim commands!
set cursorcolumn
set cursorline
set directory=/var/tmp//
set expandtab " use soft tab for tab key
set hls " hilight search
set ignorecase
set includeexpr+=substitute(v:fname,'s$','','g')
set incsearch " turn on incremental search
set iskeyword+=-
set iskeyword+=? " include ? in words for movement/highlighting/<cword>
set linebreak
set nocompatible " errybody does it
set nolist
set novisualbell
set nowrap
" set nowrapscan
set number " show line numbers
set ruler " turn on line at the bottom right of the window
set rulerformat=%c\ %l\/%L " column current_line/total_lines
set scrolloff=8 " always show n lines of context
set shada^=! " make metadata persist across restarts
set shiftround " When shifting lines, round the indentation to the nearest multiple of “shiftwidth.”
set shiftwidth=2
set showcmd " put COMMAND in the status line in cmd mode
set showtabline=2 " Always show the tab bar
set sidescrolloff=4 " always show n cols of context
set sm " show matching braces
set smartcase
set suffixesadd=.css
set suffixesadd=.js
set suffixesadd=.rb
set sw=2 " soft tab width in spaces
set t_Co=256
set tabstop=2
set textwidth=80
set tildeop
set ts=2
set wildmenu
set wildmode=longest,list,full

" run matchit.vim to enable using % to navigate ruby do...end
runtime! macros/matchit.vim

let g:javascript_plugin_flow = 1
" let g:jsx_ext_required = 0

autocmd bufenter * :syntax sync fromstart
" autocmd bufenter dockerfile* :setf dockerfile

autocmd BufEnter *.asm_ca65 :set ft=asm_ca65
autocmd BufEnter *.s :set ft=asm_ca65

let g:closetag_filenames = "*.xml,*.html,*.xhtml,*.phtml,*.js,*.jsx,*.html.erb"


inoremap <silent> <leader>c <esc>:call ToggleInsertCaps()<cr>a
nnoremap <silent> <leader>c :call ToggleInsertCaps()<cr>

nnoremap <silent> <leader>cn :cnext<cr>
nnoremap <silent> <leader>cp :cprev<cr>
nnoremap <silent> <leader>co :copen<cr>
nnoremap <silent> <leader>cc :cclose<cr>

nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>
nnoremap <leader>t :put =expand('%:p')<cr>
nnoremap <silent> <Leader>m :wincmd w<CR>
nnoremap <silent> <Leader>n :tabn<CR>
nnoremap <silent> <Leader>p :tabp<CR>
nnoremap <silent> <Leader>q :q<CR>
nnoremap <silent> <Leader>u :UndotreeToggle<CR>
nnoremap <silent> <Leader>w :w<CR>

nmap ga <Plug>(EasyAlign)
nnoremap <a-[> :tabp<cr>
nnoremap <a-]> :tabn<cr>
nnoremap <c-p> :FZF<cr>
nnoremap <silent> <Esc> :nohl<CR><Esc>
nnoremap <silent> <c-s> :StripWhitespace<cr>
nnoremap <silent> K :tabp<cr>
nnoremap <silent> T :tabn<cr>
noremap <F3> :Neoformat<cr>
vnoremap s :sort<CR>
xmap ga <Plug>(EasyAlign)




function Hfmt()
  silent! !hfmt -w <afile>
  edit
endfunction

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


" let g:neoformat_enabled_javascript = ['eslint_d']
let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_enabled_elm = ['elm-format']
let g:neoformat_enabled_json = ['jq']


let g:neoformat_ruby_prettier = {
            \ 'args': ['--parser ruby'],
            \ 'exe': '/home/ehren/.config/yarn/bin/prettier',
            \ }

let g:neoformat_enabled_ruby = ['prettier']


" syntax for .cfdg files
au BufNewFile,BufRead *.cfdg,*.CFDG	setf cfdg




au BufNewFile,BufRead *.jsx	setf javascript

" Limit linters used for JavaScript.
let g:ale_linters = {
            \ 'javascript': ['flow', 'eslint'],
            \ 'ruby': [],
            \ 'eruby': [],
            \ 'asm': [],
            \ 'haskell': ['stack-ghc', 'hlint'],
            \ 'sdcc': []
            \ }

let g:ale_fixers = {
            \ 'haskell': ['brittany', 'hlint', 'remove_trailing_lines', 'trim_whitespace'],
            \ 'javascript': ['prettier'],
            \ 'javascript.jsx': ['prettier'],
            \ 'ruby': ['prettier'],
            \ 'sdcc': ['clang-format'],
            \ 'scad': ['remove_trailing_lines', 'trim_whitespace'],
            \ '*': ['remove_trailing_lines', 'trim_whitespace']
            \ }

hi x018_DarkBlue ctermfg=18 guifg=#000087

highlight ALEWarning NONE
" highlight ALEWarning ctermbg=5

set splitbelow
set splitright

highlight clear ALEErrorSign " otherwise uses error bg color (typically red)
highlight clear ALEWarningSign " otherwise uses error bg color (typically red)
let g:ale_sign_error = 'X' " could use emoji
let g:ale_sign_warning = '?' " could use emoji
let g:ale_statusline_format = ['X %d', '? %d', '']
" %linter% is the name of the linter that provided the message
" %s is the error or warning message
let g:ale_echo_msg_format = '%linter% says %s'

" keep the gutter open all the time
let g:ale_sign_column_always = 1

let g:ale_pattern_options = {
      \ '\.avr\.c$': {'ale_linters': ['gcc-avr'],
      \ 'ale_fixers': ['uncrustify', 'remove_trailing_lines', 'trim_whitespace']},
      \ 'jsx$': {'ale_fixers': ['prettier']}
      \}

" let g:neoformat_verbose = 1

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

packadd! matchit

call expand_region#custom_text_objects({
      \ "it": 1,
      \ "at": 1,
      \ "a}": 1,
      \ "i}": 1,
      \ })

let g:capsinsert = 0
function! ToggleInsertCaps()
      if g:capsinsert
            set keymap=
            let g:capsinsert = 0
      else
            set keymap=capsinsert
            let g:capsinsert = 1
      endif
endfunction

let g:javascript_plugin_flow = 1

:g/^\(.*\)$\n\1$/p

function! HighlightRepeats()
  :g/^\(.*\)$\n\1$/p
endfunction

command! HighlightRepeats :call HighlightRepeats()

if executable("rg")
      let g:ctrlp_user_command = 'rg --files --sort=none'
      let g:ctrlp_use_caching = 0
      set grepprg=rg\ --vimgrep\ --no-heading
      set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
