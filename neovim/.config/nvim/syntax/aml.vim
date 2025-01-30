" syntax enable
syn clear

syntax match anathemaBracket /\v[\(\)\[\]\{\}]/
syntax match anathemaPreProc /@\w+/

syntax match anathemaIdentifier /\v([a-zA-Z_][a-zA-Z0-9_]*)/
syntax match anathemaVariable /\$[a-zA-Z_][a-zA-Z0-9_]*/

syntax match anathemaOperator /\v[+\-*/=<>!&|^%~]/

syntax keyword anathemaKeywords for loop in if else

syntax match anathemaString /".*"/
syntax match anathemaNumber /\v\d+(\.\d+)?/

syntax keyword anathemaWidgets vstack hstack zstack text zstack span

" syn sync fromstart
" syn sync maxlines=100

" syn clear amlArcCmd
" syn clear amlTabCmd
" syn clear amlInfoCmd
" syn clear amlVtrCmd
" syn clear amlFormedCmd
" syn clear amlVtrCmd
" syn clear amlFunction
" syn clear amlDir
" syn clear amlDir2
" syn clear amlOutput
" syn clear amlDirSym
" syn clear amlDirective
" syn clear amlVar
" syn clear amlFunc
" syn clear amlFunc2
" syn clear amlQuote
" syn clear amlAppCmd
" syn clear amlVar2
" syn clear amlSkip
" syn clear amlComment
" syn clear amlFormed
" syn clear amlTab


hi def link anathemaWidgets Keyword
hi def link anathemaBracket Special
hi def link anathemaPreProc PreProc
hi def link anathemaKeywords Keyword
hi def link anathemaString String
hi def link anathemaNumber Number
hi def link anathemaIdentifier Identifier
hi def link anathemaVariable Identifier
hi def link anathemaOperator Operator
hi def link anathemaWidgets Keyword

" syntax
