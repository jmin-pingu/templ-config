"
" templ.vim -- syntax file for templ files
"

if exists("b:current_syntax")
    finish
endif

syntax include @HTML $VIMRUNTIME/syntax/html.vim

" This is capturing all the right information; need to modify it to allow for
" templ formatting like {{ CODE }}
syntax region HTMLBlock start=+</+ start=+<+ skip=+\\"+ end=+>+ end=+/>+ 

syntax match templComment "\v//.*$"
syntax match templKeyword "\vpackage|import|for|range|select|if|else|default|case|switch"
syntax match templFunction "\vtempl"
syntax match templFunction "\v\zs\@[a-zA-Z_.]*\ze\("

syntax region TemplString start=+"+  skip=+\\"+  end=+"+

highlight link templComment Comment
highlight link templKeyword Keyword
highlight link templFunction Function
highlight link templString String

highlight link HTMLBlock Identifier

highlight link templHTMLTagStart Function
highlight link templHTMLTagEnd Identifier

let b:current_syntax = "templ"
