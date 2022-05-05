" must go before plugins are loaded
" let g:polyglot_disabled = ['javascript']

" disable YCM while working on c
let g:loaded_youcompleteme = 1

call plug#begin('~/.local/share/nvim/plugged')

" auto-close xml tags: >> close tag and newline
Plug 'alvan/vim-closetag'


" syntax highlighting for KSP
Plug 'KSP-KOS/EditorTools', {'rtp': 'VIM/vim-kerboscript'}


" syntax, formatting, etc for languages
" Plug 'elmcast/elm-vim', { 'for': 'elm' }
" Plug 'maxbane/vim-asm_ca65'
" Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'purescript-contrib/purescript-vim', { 'for': 'purescript' }
" Plug 'sirtaj/vim-openscad'

" one syntax megapack
Plug 'sheerun/vim-polyglot'

" completion with nvims built in LSP
" Plug 'nvim-lua/completion-nvim'

" large selection of colors
Plug 'flazz/vim-colorschemes'

" :Tab /=
Plug 'godlygeek/tabular'

" snippets
Plug 'sirver/UltiSnips'
" collection of snippets for UltiSnips
Plug 'honza/vim-snippets'

" fancy mode line thingy
Plug 'itchyny/lightline.vim'

" fuzzy file finder
Plug 'junegunn/fzf.vim'

" use ripgrep with Rg
Plug 'jremmen/vim-ripgrep'

" show marks in the sign column
Plug 'kshenoy/vim-signature'

" <leader>u to open undo history
Plug 'mbbill/undotree'

" highlight eol whitespace in red, and :StripWhitespace
Plug 'ntpeters/vim-better-whitespace'

" Plug 'powerline/powerline'

" format source code with <F3>
Plug 'sbdchd/neoformat'

" auto closes code blocks opened on the current line
Plug 'tpope/vim-endwise'

" useful shell commands like :SudoWrite and :Rename
Plug 'tpope/vim-eunuch'

" enable . repeat for other plugins
Plug 'tpope/vim-repeat'

" C-X and C-A for dates and ordinals
Plug 'tpope/vim-speeddating'

" select inside and change surrounding brackets, quotes etc
Plug 'tpope/vim-surround'

" use gc to toggle commenting lines or selection
Plug 'vim-scripts/tComment'

" linting and fixing and formatting for lots of languages
Plug 'w0rp/ale'

" fuzzy code completion w/ LSPs
Plug 'ycm-core/YouCompleteMe'

" coerce case with crc etc
Plug 'tpope/vim-abolish'

call plug#end()
let mapleader=','

syntax enable

filetype on
filetype plugin indent on

" set iskeyword+=-
" set iskeyword+=? " include ? in words for movement/highlighting/<cword>
" set nowrapscan
" set t_Co=256
set autoindent " copy indent from current line for new line
set autoread " keep buffer in sync with filesystem
set backspace=indent,eol,start
set cursorcolumn
set cursorline
set directory=/var/tmp//
set expandtab " use soft tab for tab key
set gdefault " switch /g on :s is default
set hls " hilight search
set ignorecase
set includeexpr+=substitute(v:fname,'s$','','g')
set incsearch " turn on incremental search
set linebreak
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
set signcolumn=yes
set sm " show matching braces
set smartcase
set splitbelow
set splitright
set suffixesadd=.css
set suffixesadd=.js
set suffixesadd=.rb
set sw=2 " soft tab width in spaces
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

autocmd bufenter * :set cursorline
autocmd bufenter * :set cursorcolumn

autocmd BufEnter *.asm_ca65 :set ft=asm_ca65
autocmd BufEnter *.s :set ft=asm_ca65

autocmd BufEnter ALEPreviewWindow :set wrap

let g:closetag_filenames = "*.xml,*.html,*.xhtml,*.phtml,*.js,*.jsx,*.html.erb,*.tsx"


" nnoremap <silent> <Leader>n :tabn<CR>
" nnoremap <silent> <Leader>p :tabp<CR>
inoremap <silent> <C-c> <esc>:call ToggleInsertCaps()<cr>a
inoremap <silent> <Esc> <esc>:call DeactivateInsertCaps()<cr>
nnoremap <silent> <Esc> :nohl<CR>:call DeactivateInsertCaps()<cr><Esc>

nnoremap <C-t> :lua gettype()<cr>
nnoremap <F1> :execute "normal! /\\%<" . ( virtcol(".") ) . "v"<cr>
nnoremap <F2> vi):Tab monolith<cr>
nnoremap <F3> :Neoformat<cr>
nnoremap <F4> :ALEDetail<cr>
nnoremap <F6> :Rg
nnoremap <F7> :call ToggleQFList()<cr>
nnoremap <F8> :cp<cr>
nnoremap <F9> :cn<cr>
nnoremap <leader><C-a> :lua bsearch("up")<cr>
nnoremap <leader><C-s> :lua searching = false<cr>
nnoremap <leader><C-x> :lua bsearch("down")<cr>
nnoremap <silent> <C-c> :call ToggleInsertCaps()<cr>
nnoremap <silent> <C-l> :BLines<cr>
nnoremap <silent> <C-p> :Files<cr>
nnoremap <silent> <Leader>. @:
nnoremap <silent> <Leader>f :put =expand('%:p')<cr>
nnoremap <silent> <Leader>m :wincmd w<CR>
nnoremap <silent> <Leader>q :q<CR>
nnoremap <silent> <Leader>u :UndotreeToggle<CR>
nnoremap <silent> <Leader>v "+p
nnoremap <silent> <Leader>w :w<CR>
nnoremap <silent> <Leader>x :set cursorline cursorcolumn<cr>
nnoremap <silent> <S-s> :tabp<cr>
nnoremap <silent> <c-s> :StripWhitespace<cr>
nnoremap <silent> [e :ALEPreviousWrap<cr>
nnoremap <silent> ]e :ALENextWrap<cr>
nnoremap <silent> s :tabn<cr>

vnoremap <silent> <Leader>c "+y
vnoremap s :sort<CR>

colors Tomorrow-Night

highlight Pmenu ctermfg=gray
highlight PmenuSel ctermfg=white

highlight Normal ctermbg=none
highlight NonText ctermbg=none

highlight NonText ctermbg=none
highlight SpellCap ctermbg=none

highlight ALEWarning NONE
" highlight ALEWarning ctermbg=5

highlight clear ALEErrorSign " otherwise uses error bg color (typically red)
highlight clear ALEWarningSign " otherwise uses error bg color (typically red)

let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_enabled_elm = ['elm-format']
let g:neoformat_enabled_json = ['jq']
let g:neoformat_enabled_jsonc = ['jq']
let g:neoformat_enabled_haskell = ['sortimports', 'ormolu']

let g:neoformat_ruby_prettier = {
                  \ 'args': ['--parser ruby'],
                  \ 'exe': '/home/ehren/.config/yarn/bin/prettier',
                  \ }

let g:neoformat_enabled_ruby = ['prettier']

" Limit linters used for JavaScript.
let g:ale_linters = {
                  \ 'javascript': ['flow', 'eslint'],
                  \ 'graphql': [],
                  \ 'c': [],
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
                  \ 'sdcc': [],
                  \ 'c': [],
                  \ 'scad': ['remove_trailing_lines', 'trim_whitespace'],
                  \ '*': ['remove_trailing_lines', 'trim_whitespace']
                  \ }

hi x018_DarkBlue ctermfg=18 guifg=#000087
hi clear CursorLineNr

let g:ale_sign_error = 'X' " could use emoji
let g:ale_sign_warning = '?' " could use emoji
let g:ale_statusline_format = ['X %d', '? %d', '']
" %linter% is the name of the linter that provided the message
" %s is the error or warning message
let g:ale_echo_msg_format = '%linter% says %s'

" keep the gutter open all the time
let g:ale_sign_column_always = 1

let g:ale_pattern_options = {
                  \ 'jsx$': {'ale_fixers': ['prettier']}
                  \}

" let g:neoformat_verbose = 1

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

packadd! matchit

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

function! DeactivateInsertCaps()
      if g:capsinsert
            set keymap=
            let g:capsinsert = 0
      endif
endfunction

function! ActivateInsertCaps()
      if !g:capsinsert
            set keymap=capsinsert
            let g:capsinsert = 1
      endif
endfunction

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
                  \ 'fg+':     ['fg', 'Normal'],
                  \ 'bg+':     ['bg'],
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

let g:closetag_close_shortcut = '<leader>>'

autocmd BufNewFile,BufRead *.cfdg,*.CFDG  setf cfdg
autocmd BufNewFile,BufRead *.jsx  setf javascript
autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=150}
autocmd bufenter * :syntax sync fromstart

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
      str = vim.fn.expand("<cWORD>")
      match = string.match(str, "(%d*%.?%d+)")

      current_line_number = vim.fn.line(".")

      current = tonumber(match)

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

      current_line = vim.fn.getline(current_line_number)
      newline = string.gsub(current_line, match, nextnum)
      vim.fn.setline(current_line_number, newline)
      max = (nextnum + delta)
      min = (nextnum - delta)
      print("max=".. max .. " min=" .. min)
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


let g:neoformat_openscad_openscad_format = {
                  \ 'exe': '/home/ehren/.local/bin/openscad-format',
                  \ 'stdin': 1,
                  \ }

let g:neoformat_enabled_openscad = ['openscad_format']

let g:neoformat_purescript_purstidy = {
                  \ 'exe': 'purs-tidy',
                  \ 'args': ['format'],
                  \ 'stdin': 1,
                  \ 'env': [],
                  \ 'valid_exit_codes': [0, 23],
                  \ 'no_append': 1,
                  \ 'name': 'purstidy',
                  \ }
let g:neoformat_enabled_purescript = ['purstidy']

" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1


augroup fixlist
      autocmd!
      autocmd BufWinEnter quickfix call SetQFControlVariable()
      autocmd BufWinLeave * call UnsetQFControlVariable()
augroup END

fun! SetQFControlVariable()
      if getwininfo(win_getid())[0]['loclist'] == 1
            let g:the_primeagen_qf_l = 1
      else
            let g:the_primeagen_qf_g = 1
      end
endfun

fun! UnsetQFControlVariable()
      if getwininfo(win_getid())[0]['loclist'] == 1
            let g:the_primeagen_qf_l = 0
      else
            let g:the_primeagen_qf_g = 0
      end
endfun

fun! ToggleQFList()
      if g:the_primeagen_qf_g == 1
            cclose
      else
            copen
      end
endfun
