set background=dark
highlight clear
let g:colors_name="ehren"

let save_cpo = &cpo
set cpo&vim

" basic highlight groups (:help highlight-groups) {{{

" text {{{

hi Normal       guifg=#ffffff       guibg=#050505       gui=NONE
hi Folded       guifg=#c2bfa5       guibg=#050505       gui=underline
hi LineNr       guifg=#928c75       guibg=NONE          gui=NONE
hi Directory    guifg=#00D9FE       guibg=NONE          gui=NONE
hi NonText      guifg=#77ff22       guibg=NONE          gui=bold
hi SpecialKey   guifg=#5DFF1C       guibg=NONE          gui=NONE
hi SpellBad     guifg=NONE          guibg=NONE          gui=undercurl
hi SpellCap     guifg=NONE          guibg=NONE          gui=undercurl
hi SpellLocal   guifg=NONE          guibg=NONE          gui=undercurl
hi SpellRare    guifg=NONE          guibg=NONE          gui=undercurl
hi DiffAdd      guifg=#ffffff       guibg=#126493       gui=NONE
hi DiffChange   guifg=#000000       guibg=#976398       gui=NONE
hi DiffDelete   guifg=#000000       guibg=#be1923       gui=bold
hi DiffText     guifg=#ffffff       guibg=#976398       gui=bold

" }}}
" borders / separators / menus {{{

hi FoldColumn   guifg=#c8bcb9       guibg=#786d65       gui=bold            
            \   ctermfg=lightgray   ctermbg=darkgray    cterm=NONE
hi SignColumn   guifg=#c8bcb9       guibg=#786d65       gui=bold
            \   ctermfg=lightgray   ctermbg=darkgray    cterm=NONE

hi Pmenu        guifg=#000000       guibg=#a6a190       gui=NONE
            \   ctermfg=white       ctermbg=darkgray    cterm=NONE
hi PmenuSel     guifg=#ffffff       guibg=#133293       gui=NONE
            \   ctermfg=white       ctermbg=lightblue   cterm=NONE
hi PmenuSbar    guifg=NONE          guibg=#555555       gui=NONE
            \   ctermfg=black       ctermbg=black       cterm=NONE
hi PmenuThumb   guifg=NONE          guibg=#cccccc       gui=NONE
            \   ctermfg=gray        ctermbg=gray        cterm=NONE

hi StatusLine   guifg=#000000       guibg=#c2bfa5       gui=bold    
            \   ctermfg=black       ctermbg=white       cterm=bold
hi StatusLineNC guifg=#444444       guibg=#c2bfa5       gui=NONE    
            \   ctermfg=darkgray    ctermbg=white       cterm=NONE
hi WildMenu     guifg=#ffffff       guibg=#133293       gui=bold
            \   ctermfg=white       ctermbg=darkblue    cterm=bold
hi VertSplit    guifg=#c2bfa5       guibg=#c2bfa5       gui=NONE
            \   ctermfg=white       ctermbg=white       cterm=NONE

hi TabLine      guifg=#000000       guibg=#c2bfa5       gui=NONE
            \   ctermfg=black       ctermbg=white       cterm=NONE
hi TabLineFill  guifg=#000000       guibg=#c2bfa5       gui=NONE
            \   ctermfg=black       ctermbg=white       cterm=NONE
hi TabLineSel   guifg=#ffffff       guibg=#133293       gui=NONE
            \   ctermfg=white       ctermbg=black       cterm=NONE

"hi Menu
"hi Scrollbar
"hi Tooltip

" }}}
" cursor / dynamic / other {{{

hi Cursor       guifg=#303030 guibg=#00ff5f

hi CursorIM     guifg=#000000       guibg=#aaccff       gui=NONE
            \   ctermfg=black       ctermbg=white       cterm=reverse
hi CursorLine   guifg=NONE          guibg=#1b1b1b       gui=NONE
            \   ctermfg=NONE        ctermbg=NONE        cterm=NONE
hi CursorColumn guifg=NONE          guibg=#1b1b1b       gui=NONE
            \   ctermfg=NONE        ctermbg=NONE        cterm=NONE

hi Visual       guifg=#ffffff       guibg=#606070       gui=NONE
            \   ctermfg=white       ctermbg=lightblue   cterm=NONE

hi IncSearch    guifg=#000000       guibg=#eedd33       gui=bold 
            \   ctermfg=white       ctermbg=yellow      cterm=NONE
hi Search       guifg=#efefd0       guibg=#937340       gui=NONE
            \   ctermfg=white       ctermbg=darkgreen   cterm=NONE

hi MatchParen   guifg=NONE          guibg=#3377aa       gui=NONE
            \   ctermfg=white       ctermbg=blue        cterm=NONE

"hi VisualNOS

" }}}
" listings / messages {{{

hi ModeMsg      guifg=#eecc18       guibg=NONE          gui=NONE
            \   ctermfg=yellow      ctermbg=NONE        cterm=NONE
hi Title        guifg=#dd4452       guibg=NONE          gui=bold
            \   ctermfg=red         ctermbg=NONE        cterm=bold
hi Question     guifg=#66d077       guibg=NONE          gui=NONE
            \   ctermfg=green       ctermbg=NONE        cterm=NONE
hi MoreMsg      guifg=#39d049       guibg=NONE          gui=NONE
            \   ctermfg=green       ctermbg=NONE        cterm=NONE

hi ErrorMsg     guifg=#ffffff       guibg=#ff0000       gui=bold
            \   ctermfg=white       ctermbg=red         cterm=bold
hi WarningMsg   guifg=#ccae22       guibg=NONE          gui=bold    
            \   ctermfg=yellow      ctermbg=NONE        cterm=bold

" }}}

" }}}
" syntax highlighting groups (:help group-name) {{{

hi Comment      guifg=#ff9922       guibg=NONE          gui=NONE
            \   ctermfg=brown       ctermbg=NONE        cterm=NONE

hi Constant     guifg=#ff6050       guibg=NONE          gui=NONE
            \   ctermfg=red         ctermbg=NONE        cterm=NONE
hi Boolean      guifg=#ff6050       guibg=NONE          gui=bold  
            \   ctermfg=red         ctermbg=NONE        cterm=bold

hi Identifier   guifg=#eecc44       guibg=NONE          gui=NONE
            \   ctermfg=yellow      ctermbg=NONE        cterm=NONE

hi Statement    guifg=#66d077       guibg=NONE          gui=bold
            \   ctermfg=green       ctermbg=NONE        cterm=bold

hi PreProc      guifg=#bb88dd       guibg=NONE          gui=NONE
            \   ctermfg=darkmagenta ctermbg=NONE        cterm=NONE

hi Type         guifg=#4093cc       guibg=NONE          gui=bold
            \   ctermfg=lightblue   ctermbg=NONE        cterm=bold

hi Special      guifg=#9999aa       guibg=NONE          gui=bold  
            \   ctermfg=lightgray   ctermbg=NONE        cterm=bold

hi Underlined   guifg=#80a0ff       guibg=NONE          gui=underline
            \   ctermfg=NONE        ctermbg=NONE        cterm=underline
            \   term=underline 

hi Ignore       guifg=#888888       guibg=NONE          gui=NONE
            \   ctermfg=darkgray    ctermbg=NONE        cterm=NONE

hi Error        guifg=#ffffff       guibg=#ff0000       gui=NONE
            \   ctermfg=white       ctermbg=red         cterm=NONE

hi Todo         guifg=#ffffff       guibg=#ee7700       gui=bold
            \   ctermfg=black       ctermbg=yellow      cterm=bold

" }}}

let &cpo = save_cpo

" vim: fdm=marker fdl=0
