" Vim syntax file
" Language:	CFDG
" Maintainer:	unmaintained
" Last Change:	Fri Oct 27 15:27 GMT 2006
" Adapted from cpp.vim

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Read the C syntax to start with
if version < 600
  so <sfile>:p:h/c.vim
else
  runtime! syntax/c.vim
  unlet b:current_syntax
endif

" CFDG extentions
syn keyword cfdgStatement		startshape include rule
syn keyword cfdgPrimitiveShape	SQUARE TRIANGLE CIRCLE
syn keyword cfdgTransform		x y z skew size s rotate r flip f
syn keyword cfdgColor			hue h saturation sat brightness b alpha a
syn match	cfdgTargetModifier	"|"
syn match   cfdgComment			"#.*$"

" Default highlighting
if version >= 508 || !exists("did_cfdg_syntax_inits")
  if version < 508
    let did_cfdg_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink cfdgStatement			Keyword
  HiLink cfdgPrimitiveShape		PreProc
  HiLink cfdgTransform			Type
  HiLink cfdgColor				String
  HiLink cfdgTargetModifier		Keyword
  HiLink cfdgComment			Comment
  delcommand HiLink
endif

let b:current_syntax = "cfdg"

" vim: ts=8
