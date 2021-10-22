" syn keyword flowKeyword type nextgroup=flowTypeName
"
syn keyword flowPrimitiveType string number null void boolean
"
" syn match flowTypeName '\w\+'
"
hi def link flowPrimitiveType Type
" hi def link flowKeyword PreProc
" hi def link flowTypeName PreProc
