if !exists("main_syntax")
  if exists("b:current_syntax")
    finish
  endif
  let main_syntax='java'
endif

command! -nargs=+ JavaHiLink hi def link <args>

syn keyword javaExternal native package
syn match javaExternal "\<import\(\s\+static\>\)\?"
syn keyword javaError goto const
syn keyword javaConditional if else switch case default
syn keyword javaRepeat while for do
syn keyword javaBoolean true false
syn keyword javaConstant null
syn keyword javaTypedef this super
syn keyword javaOperator new instanceof
syn keyword javaType boolean char byte short int long float double
syn keyword javaType void
syn keyword javaStatement return
syn keyword javaStorageClass static synchronized transient volatile final strictfp serializable
syn keyword javaExceptions throw try catch finally
syn keyword javaAssert assert
syn keyword javaMethodDecl synchronized throws
syn keyword javaClassDecl extends implements interface
syn keyword javaClassDecl enum
syn keyword javaClassDecl class
syn keyword javaBranch break continue nextgroup=javaUserLabelRef skipwhite
syn match javaUserLabelRef "\k\+" contained
syn keyword javaScopeDecl public protected private abstract

syn keyword javaTodo		 contained TODO FIXME XXX
if exists("java_comment_strings")
  syn region  javaCommentString    contained start=+"+ end=+"+ end=+$+ end=+\*/+me=s-1,he=s-1 contains=javaSpecial,javaCommentStar,javaSpecialChar,@Spell
  syn region  javaComment2String   contained start=+"+  end=+$\|"+  contains=javaSpecial,javaSpecialChar,@Spell
  syn match   javaCommentCharacter contained "'\\[^']\{1,6\}'" contains=javaSpecialChar
  syn match   javaCommentCharacter contained "'\\''" contains=javaSpecialChar
  syn match   javaCommentCharacter contained "'[^\\]'"
  syn cluster javaCommentSpecial add=javaCommentString,javaCommentCharacter,javaNumber
  syn cluster javaCommentSpecial2 add=javaComment2String,javaCommentCharacter,javaNumber
endif
syn region  javaComment		 start="/\*"  end="\*/" contains=@javaCommentSpecial,javaTodo,@Spell
syn match   javaCommentStar      contained "^\s*\*[^/]"me=e-1
syn match   javaCommentStar      contained "^\s*\*$"
syn match   javaLineComment      "//.*" contains=@javaCommentSpecial2,javaTodo,@Spell
JavaHiLink javaCommentString javaString
JavaHiLink javaComment2String javaString
JavaHiLink javaCommentCharacter javaCharacter

syntax case ignore
"syntax include @javaHtml <sfile>:p:h/xml.vim
"unlet b:current_syntax
syn region  javaDocComment    start="/\*\*"  end="\*/" keepend contains=javaCommentTitle,@javaHtml,javaDocTags,javaTodo,@Spell
syn region  javaCommentTitle  contained matchgroup=javaDocComment start="/\*\*"   matchgroup=javaCommentTitle keepend end="\.$" end="\.[ \t\r<&]"me=e-1 end="[^{]@"me=s-2,he=s-1 end="\*/"me=s-1,he=s-1 contains=@javaHtml,javaCommentStar,javaTodo,@Spell,javaDocTags

syn region javaDocTags  contained start="{@\(link\|linkplain\|inherit[Dd]oc\|doc[rR]oot\|value\)" end="}"
syn match  javaDocTags  contained "@\(see\|param\|exception\|throws\|since\)\s\+\S\+" contains=javaDocParam
syn match  javaDocParam contained "\s\S\+"
syn match  javaDocTags  contained "@\(version\|author\|return\|deprecated\|serial\|serialField\|serialData\)\>"
syntax case match

" match the special comment /**/
syn match   javaComment		 "/\*\*/"

syn region  javaString		start=+"+ end=+"+ end=+$+ contains=javaSpecialChar,javaSpecialError,@Spell
syn match   javaCharacter	 "'[^']*'" contains=javaSpecialChar,javaSpecialCharError
syn match   javaCharacter	 "'\\''" contains=javaSpecialChar
syn match   javaCharacter	 "'[^\\]'"
syn match   javaNumber		 "\<\(0[0-7]*\|0[xX]\x\+\|\d\+\)[lL]\=\>"
syn match   javaNumber		 "\(\<\d\+\.\d*\|\.\d\+\)\([eE][-+]\=\d\+\)\=[fFdD]\="
syn match   javaNumber		 "\<\d\+[eE][-+]\=\d\+[fFdD]\=\>"
syn match   javaNumber		 "\<\d\+\([eE][-+]\=\d\+\)\=[fFdD]\>"

" unicode characters
syn match   javaSpecial "\\u\d\{4\}"

syn match  Title  "[{}]"

syn match Identifier "\<[A-Z]\+[a-z]\+[A-Za-z]*\>"

if !exists("java_minlines")
  let java_minlines = 0 
endif
exec "syn sync ccomment javaComment minlines=" . java_minlines

"" Fold method definitions
syn region javaFuncDef start="^\z(\s*\)\(\(public\|protected\|private\|static\|abstract\|final\|native\|synchronized\)[ \n]\+\)*\(void\|boolean\|char\|byte\|short\|int\|long\|float\|double\|\([A-Z][A-Za-z0-9_]*\)\)[ \n]\+[a-z][A-Za-z0-9_]*[ \n]*(\_[^)]*)[ \n]*\(\<throws\>[ \n]\+[A-Z]\w\+\([ \n]*,[ \n]*[A-Z]\w\+\)*[ \n]*\)\?{" end="^\z1}$" keepend transparent fold

"" Uncomment this if you want to fold all {}
"syn region javaFuncDef start="^\z(\s*\){" end="^\z1}" keepend transparent fold

" The default highlighting.
if version >= 508 || !exists("did_java_syn_inits")
  if version < 508
    let did_java_syn_inits = 1
  endif
  JavaHiLink javaFuncDef		Function
  JavaHiLink javaFuncBody               PreProc
  JavaHiLink javaBraces			PreProc
  JavaHiLink javaBranch			Conditional
  JavaHiLink javaUserLabelRef		javaUserLabel
  JavaHiLink javaLabel			Label
  JavaHiLink javaUserLabel		Label
  JavaHiLink javaConditional		Conditional
  JavaHiLink javaRepeat			Repeat
  JavaHiLink javaExceptions		Exception
  JavaHiLink javaAssert			Statement
  JavaHiLink javaStorageClass		StorageClass
  JavaHiLink javaMethodDecl		javaStorageClass
  JavaHiLink javaClassDecl		javaStorageClass
  JavaHiLink javaScopeDecl		javaStorageClass
  JavaHiLink javaBoolean		Boolean
  JavaHiLink javaSpecial		Special
  JavaHiLink javaSpecialError		Error
  JavaHiLink javaSpecialCharError	Error
  JavaHiLink javaString			String
  JavaHiLink javaCharacter		Character
  JavaHiLink javaSpecialChar		SpecialChar
  JavaHiLink javaNumber			Number
  JavaHiLink javaError			Error
  JavaHiLink javaStringError		Error
  JavaHiLink javaStatement		Statement
  JavaHiLink javaOperator		Operator
  JavaHiLink javaComment		Comment
  JavaHiLink javaDocComment		Comment
  JavaHiLink javaLineComment		Comment
  JavaHiLink javaConstant		Constant
  JavaHiLink javaTypedef		Typedef
  JavaHiLink javaTodo			Todo

  JavaHiLink javaCommentTitle		SpecialComment
  JavaHiLink javaDocTags		Special
  JavaHiLink javaDocParam		Function
  JavaHiLink javaCommentStar		javaComment

  JavaHiLink javaType			Type
  JavaHiLink javaExternal		Include

"  JavaHiLink xmlComment		Special
"  JavaHiLink xmlCommentPart		Special
  JavaHiLink javaSpaceError		Error
endif

delcommand JavaHiLink

let b:current_syntax = "java"

if main_syntax == 'java'
  unlet main_syntax
endif

let b:spell_options="contained"
runtime plugin/RainbowParenthsis.vim 
" vim: ts=8
