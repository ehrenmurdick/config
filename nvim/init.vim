call plug#begin('~/.local/share/nvim/plugged')


Plug 'alvan/vim-closetag'
Plug 'brendonrapp/smyck-vim'
Plug 'chrisbra/unicode.vim'
Plug 'dag/vim-fish', { 'for': 'fish' }
Plug 'elmcast/elm-vim', { 'for': 'elm' }
Plug 'euclidianAce/BetterLua.vim'
Plug 'exu/pgsql.vim', { 'for': 'sql' }
Plug 'fatih/vim-go', { 'for': 'golang' }
Plug 'flazz/vim-colorschemes'
Plug 'godlygeek/tabular'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'maxbane/vim-asm_ca65'
Plug 'mbbill/undotree'
Plug 'mg979/vim-visual-multi'
Plug 'mileszs/ack.vim'
Plug 'mpickering/hlint-refactor-vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'nvim-lua/completion-nvim'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'powerline/powerline'
Plug 'purescript-contrib/purescript-vim', { 'for': 'purescript' }
Plug 'rafcamlet/nvim-luapad'
Plug 'rakr/vim-one'
Plug 'sbdchd/neoformat'
Plug 'sheerun/vim-polyglot'
Plug 'sirtaj/vim-openscad'
Plug 'sirver/UltiSnips'
Plug 'skwp/vim-html-escape'
Plug 'slim-template/vim-slim'
Plug 'terryma/vim-expand-region'
Plug 'tjdevries/nlua.nvim'
Plug 'tpope/vim-abolish' " bash expansions for :S like :S/child{,ren}/adult{,s}
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/tComment'
Plug 'w0rp/ale'
Plug 'wilsaj/chuck.vim'
Plug 'ycm-core/YouCompleteMe'
call plug#end()

let mapleader=','

syntax enable

filetype on
filetype plugin indent on

" set nowrapscan
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

autocmd bufenter * :syntax sync fromstart

autocmd bufleave * :set nocursorline
autocmd bufleave * :set nocursorcolumn

autocmd bufenter * :set cursorline
autocmd bufenter * :set cursorcolumn

autocmd BufEnter *.asm_ca65 :set ft=asm_ca65
autocmd BufEnter *.s :set ft=asm_ca65

au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

let g:closetag_filenames = "*.xml,*.html,*.xhtml,*.phtml,*.js,*.jsx,*.html.erb"

nnoremap <silent> QQ :qa!<cr>

nnoremap <silent> <leader>an :ALENextWrap<cr>
nnoremap <silent> <leader>ap :ALEPreviousWrap<cr>
nnoremap <silent> <leader>cc :cclose<cr>
nnoremap <silent> <leader>cn :cnext<cr>
nnoremap <silent> <leader>co :copen<cr>
nnoremap <silent> <leader>cp :cprev<cr>

inoremap <silent> <leader>c <esc>:call ToggleInsertCaps()<cr>a

nnoremap <silent> <C-l> :BLines<cr>
nnoremap <silent> <C-m> :Marks<cr>
nnoremap <silent> <C-p> :Files<cr>
nnoremap <silent> <Leader>c :call ToggleInsertCaps()<cr>
nnoremap <silent> <Leader>f :put =expand('%:p')<cr>
nnoremap <silent> <Leader>m :wincmd w<CR>
nnoremap <silent> <Leader>n :tabn<CR>
nnoremap <silent> <Leader>p :tabp<CR>
nnoremap <silent> <Leader>q :q<CR>
nnoremap <silent> <Leader>t :Gtf<CR>
nnoremap <silent> <Leader>u :UndotreeToggle<CR>
nnoremap <silent> <Leader>w :w<CR>
nnoremap <slient> <Leader>1 :tabn 1<cr>
nnoremap <slient> <Leader>2 :tabn 2<cr>
nnoremap <slient> <Leader>3 :tabn 3<cr>
nnoremap <slient> <Leader>4 :tabn 4<cr>
nnoremap <slient> <Leader>5 :tabn 5<cr>
nnoremap <slient> <Leader>6 :tabn 6<cr>
nnoremap <slient> <Leader>7 :tabn 7<cr>
nnoremap <slient> <Leader>8 :tabn 8<cr>
nnoremap <slient> <Leader>9 :tabn 9<cr>

nnoremap <a-[> :tabp<cr>
nnoremap <a-]> :tabn<cr>
nnoremap <silent> <Esc> :nohl<CR><Esc>
nnoremap <silent> <c-s> :StripWhitespace<cr>
nnoremap <silent> K :tabp<cr>
nnoremap <silent> T :tabn<cr>
noremap <F3> :Neoformat<cr>
vnoremap s :sort<CR>

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
            \ 'javascript': ['prettier', 'eslint'],
            \ 'javascript.jsx': ['prettier', 'eslint'],
            \ 'jsonc': ['jq'],
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

function! HighlightRepeats()
  :g/^\(.*\)$\n\1$/p
endfunction

command! HighlightRepeats :call HighlightRepeats()

if executable("rg")
      set grepprg=rg\ --vimgrep\ --no-heading
      set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
                  \ { 'fg':    ['fg', 'Normal'],
                  \ 'bg':      ['bg', 'Normal'],
                  \ 'hl':      ['fg', 'Comment'],
                  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
                  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
                  \ 'hl+':     ['fg', 'Statement'],
                  \ 'info':    ['fg', 'PreProc'],
                  \ 'border':  ['fg', 'Ignore'],
                  \ 'prompt':  ['fg', 'Conditional'],
                  \ 'pointer': ['fg', 'Exception'],
                  \ 'marker':  ['fg', 'Keyword'],
                  \ 'spinner': ['fg', 'Label'],
                  \ 'header':  ['fg', 'Comment'] }

let g:fzf_history_dir='/tmp'

func! s:insert_file_name(lines)
      let @@ = fnamemodify(a:lines[0], "")
      normal! p
endfunc
let g:fzf_action = {
                  \ 'ctrl-r': function('s:insert_file_name'),
                  \ 'ctrl-t': 'tab split',
                  \ 'ctrl-x': 'split',
                  \ 'ctrl-v': 'vsplit',
                  \ 'ctrl-s': 'split' }

nmap   <C-LeftMouse>         <Plug>(VM-Mouse-Cursor)
nmap   <C-RightMouse>        <Plug>(VM-Mouse-Word)
nmap   <M-C-RightMouse>      <Plug>(VM-Mouse-Column)

let g:closetag_close_shortcut = '<leader>>'

function! s:Saving_scroll(cmd)
  let save_scroll = &scroll
  execute 'normal! ' . a:cmd
  let &scroll = save_scroll
endfunction
nnoremap <C-J> :call <SID>Saving_scroll("10<C-V><C-D>")<CR>
vnoremap <C-J> <Esc>:call <SID>Saving_scroll("gv1<C-V><C-D>")<CR>
nnoremap <C-K> :call <SID>Saving_scroll("10<C-V><C-U>")<CR>
vnoremap <C-K> <Esc>:call <SID>Saving_scroll("gv1<C-V><C-U>")<CR>

au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=150}

nnoremap <leader><C-a> :lua bsearch("up")<cr>
nnoremap <leader><C-x> :lua bsearch("down")<cr>

lua << EOF

searching = false
prev = 0
start = 0

function toggle_searching()
      searching = not searching
      if(searching)
            then
            print("bsearch on")
            prev = 0
            start = 0
      else
            print("bsearch off")
      end
end

function orig_or_continue_bsearch(dir)
      if (not searching)
            then
            current = tonumber(vim.fn.expand("<cword>"))
            if (dir == "up")
                  then
                  vim.fn.execute("silent normal ciw" .. current + 1)
            else
                  vim.fn.execute("silent normal ciw" .. current - 1)
            end
      else
            bsearch(dir)
      end
end

function bsearch(dir)
  current = tonumber(vim.fn.expand("<cword>"))
  if (not searching)
    then
    searching = true
    start = current
    prev = current * 2
  end
  delta = math.abs((prev - current) / 2)
  prev = current
  if(dir == "up")
    then
    nextnum = current + delta
  else
    nextnum = current - delta
  end
  vim.fn.execute("normal ciw" .. math.floor(nextnum))
  vim.fn.execute("write")
  max = math.floor(nextnum + delta)
  min = math.floor(nextnum - delta)
  print("max=".. max .. " min=" .. min .. " current=" .. current .. " delta=" .. delta .. " next=" .. nextnum)
end

function gettype()
  pos  = vim.fn.getcurpos()
  line = pos[2]
  col  = pos[3]
  file = vim.fn.expand("%")
  handle = io.popen("yarn run flow type-at-pos " .. file .. " " .. line .. " " .. col)

  contents = handle:read("*a")
  handle:close()

  local lines = {}

  for line in contents:gmatch("([^\n]*)\n?") do
    lines[#lines + 1] = line
  end

  result = table.slice(lines, 3, #lines - 3)

  local str = ""

  for i = 1, #result do
        str = str .. result[i]
  end

  vim.fn.setreg('t', str)
  print(str)
end

function table.slice(tbl, first, last, step)
      local sliced = {}
      for i = first or 1, last or #tbl, step or 1 do
            sliced[#sliced+1] = tbl[i]
      end
      return sliced
end

function fzf_tab()
      local fzf = require("fzf")
      coroutine.wrap(function()
            local tabns = vim.api.nvim_list_tabpages()
            local tabnames = nil
            for n, i in ipairs(tabns) do
                  tabnames = { next = tabnames, value = vim.fn.bufname(i-1) }
            end
            local result = fzf.fzf(tabnames, "--ansi")
            -- result is a list of lines that fzf returns, if the user has chosen
            if result then
                  print(result[1])
            end
      end)()
end

EOF


let g:VM_mouse_mappings = 1

let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

let g:fzf_tags_command = 'ctags -R --exclude=node_modules'

let g:ycm_filetype_blacklist = {
      \ 'tagbar': 1,
      \ 'notes': 1,
      \ 'markdown': 1,
      \ 'netrw': 1,
      \ 'unite': 1,
      \ 'text': 1,
      \ 'vimwiki': 1,
      \ 'pandoc': 1,
      \ 'infolog': 1,
      \ 'leaderf': 1,
      \ 'mail': 1
      \}
