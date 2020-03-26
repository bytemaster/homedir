"----- pridkett's .vimrc file
"----- designed for vim 5.3
"----- october 10th, 1998

"----- all of this stuff should also be performed
"----- remember to include it in your .Xdefaults file
"----- it requires the pixmap slate.xpm for the menus

" Vim*useSchemes: all
" Vim*sgiMode: true
" Vim*useEnhancedFSB: true
" Vim*foreground: Wheat
" Vim*background: #000020
" Vim*menuBar*backgroundPixmap: ~/graphics/slate.xpm
" Vim*menuForeground: Wheat
" Vim*menuBackground: #2f4f4f
" Vim*scrollbarWidth: 12
" Vim*scrollForeground: #3f6262
" Vim*scrollBackground: #2f4f4f
" Vim*font: fixed


"----- set up the stuff for color highlighing in an xterm
"if &term =~ "xterm"
 if has("terminfo")
  set t_Co=16
  set t_Sf=[3%p1%dm
  set t_Sb=[4%p1%dm
  set t_vb=
 else
  set t_Co=16
  set t_Sf=[3%dm
  set t_Sb=[4%dm
  set t_vb=
 endif
"endif

let java_highlight_functions="style"

set tags=./tags,$HOME/projects/guss/tags


set nocp " non vi compatible mode
filetype plugin on " enable plugins

autocmd InsertLeave * if pumvisible() == 0|pclose|endif
set completeopt=menu,menuone

let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 1
let OmniCpp_ShowPrototypeInAbbr = 1

"----- only turn on syntax highlighting of there are more than one color
	syntax on
"----- don't start out in insert mode
set noinsertmode
"----- allow us to backspace before an insert
set backspace=2
"----- tabs are to be set at 4 spaces
set tabstop=2
"----- show the ruler for editing
set ruler
"----- turn off the mouse in the xterm
set mouse=a
"----- show the command in the status line
set showcmd
set cino=(0
set shiftwidth=4
set expandtab
"----- you need digraphs for uumlauts
" set digraph

"----- always have a status line
set laststatus=2

set directory=/tmp

set mp=make\ -j8
map  <f5> :w<cr> :make -j3<cr>
imap <f5> <esc>:w<cr> :make -j3 <cr>
map  <f6> :w<cr> :make -j3 install<cr>
imap <f6> <esc>:w<cr> :make -j3 install<cr>
map  <f2> :cnext<cr>
imap <f2> :cnext<cr>
map  <f1> :cprevious<cr>
imap <f1> :cprevious<cr>

nmap <C-S-tab> :tabprevious<cr>
nmap <C-tab> :tabnext<cr>
map <C-S-tab> :tabprevious<cr>
map <C-tab> :tabnext<cr>


nmap s <C-w>
nmap <C-t> :tabnew<cr>
imap <C-t> <ESC>:tabnew<cr>

map th :tabnext<cr>
map tl :tabprev<cr>
map tn :tabnew<cr>
map td :tabclose<cr>

com -nargs=1 Vta :vs :ta <args> 
command Ant set makeprg=ant\ -emacs\ -find\ build.xml
command Make set makeprg=make\ -j3
command Xcode set makeprg=xcodebuild\ -activebuildstyle

"------ this clears out the old colors before we begin
highlight Constant    NONE
highlight Delimiter   NONE
highlight Directory   NONE
highlight Error       NONE
highlight ErrorMsg    NONE
highlight Identifier  NONE
highlight LineNr      NONE
highlight ModeMsg     NONE
highlight MoreMsg     NONE
highlight Normal      NONE
highlight NonText     NONE
highlight PreProc     NONE
highlight Question    NONE
highlight Search      NONE
highlight Special     NONE
highlight SpecialKey  NONE
highlight Statement   NONE
highlight StatusLine  NONE
highlight Title       NONE
highlight Todo        NONE
highlight Type        NONE
highlight Visual      NONE
highlight WarningMsg  NONE
"----- these are the new superior colors
highlight Comment     term=bold ctermfg=5 ctermbg=0 guifg=#FF005F guibg=gray
highlight Constant    term=underline ctermfg=6 guifg=#FF2f8f
highlight Delimiter   term=bold cterm=bold ctermfg=1 gui=bold guifg=Red
highlight Directory   term=bold ctermfg=DarkBlue guifg=Blue
highlight Error       term=standout cterm=bold ctermbg=1 ctermfg=1 gui=bold guifg=red
highlight ErrorMsg    term=standout cterm=bold ctermfg=1 gui=bold guifg=red
highlight Identifier  term=underline ctermfg=3 guifg=yellow3
highlight LineNr      term=underline cterm=bold ctermfg=3 guifg=Brown
highlight ModeMsg     term=bold cterm=bold ctermfg=3 ctermbg=1 guifg=yellow2 guibg=red
highlight MoreMsg     term=bold cterm=bold ctermfg=2 gui=bold guifg=Green
highlight NonText     term=bold ctermfg=2 guifg=green3
highlight Normal      ctermfg=white ctermbg=black guifg=grey90 guibg=#000020
highlight PreProc     term=underline ctermfg=14 guifg=cyan
highlight Question    term=standout cterm=bold ctermfg=2 gui=bold guifg=Green
highlight Search      term=reverse ctermbg=2 guibg=Yellow
highlight Special     term=bold ctermfg=5 guifg=SlateBlue
highlight SpecialKey  term=bold ctermfg=DarkBlue guifg=Blue
highlight Statement   term=bold ctermfg=2 gui=bold guifg=green3
highlight StatusLine  term=reverse cterm=bold ctermfg=3 ctermbg=4 guifg=wheat guibg=#2f4f4f
highlight StatusLineNC term=bold ctermfg=3 ctermbg=2 guifg=#071f1f guibg=#5f9f9f
highlight Title       term=bold cterm=bold ctermfg=4 gui=bold guifg=Blue
highlight Todo        term=bold ctermfg=red ctermbg=yellow guifg=red guibg=yellow1 gui=bold
highlight Type        term=underline cterm=bold ctermfg=3 guifg=yellow3 gui=bold
highlight Visual      term=reverse cterm=bold ctermfg=6 ctermbg=5 guifg=yellow guibg=blue
highlight WarningMsg  term=standout cterm=bold ctermfg=1 ctermbg=4 guifg=Red

"edit my .vimrc file
map ,vrc :e ~/.vimrc

map ,mf :source ~/.vim_makefunction

"update the system settings from my vimrc file
map ,u :source ~/.vimrc

map ,c :w! ~/.vim_cpy_pst<cr>
map ,v :r ~/.vim_cpy_pst<cr>
map ,f :r ~/.functionheader<cr>

"map ,x :r ~/.vim_cpy_pst<cr>d


au BufEnter * cd %:p:h

map [1;5C :next
map [1;5D :prev
au BufEnter [Mm]akefile* set noexpandtab
au BufLeave [Mm]akefile* set expandtab
au BufEnter *.java Ant
au BufLeave *.java Make 
au BufEnter *.java set keywordprg=man
au BufLeave *.java set keywordprg=man
au BufEnter *.m set keywordprg=man
au BufLeave *.m set keywordprg=man
au BufEnter *.mm set keywordprg=man
au BufLeave *.mm set keywordprg=man
au BufEnter *.h set keywordprg=man
au BufLeave *.h set keywordprg=man
au BufEnter *.cpp set keywordprg=man
au BufLeave *.cpp set keywordprg=man
au BufEnter *.m Xcode 
au BufLeave *[hc]* Make
au BufEnter *.mm Xcode 
au BufLeave *[hc]* Make
au BufEnter *.cpp  set syntax=cpp11
au BufEnter *.hpp  set syntax=cpp11
au BufEnter *.ipp  set syntax=cpp11
au BufEnter *.h  set syntax=cpp11

set listchars=eol:\|,trail:_,tab:>-


"----- test the auto commands
" set verbose=9

"----- change make so it runs javac when we have java programs being edited
autocmd BufRead BufNewFile *.java set makeprg=javac\ %
"----- set up the error format for vim, this works for javac
autocmd BufRead BufNewFile *.java set errorformat=\"%f\"\\\,\ line\ %l.%c:%m\,\ %f:%l:%m
"----- make it recognize tcsh resource files
autocmd BufReadPost *tcshrc* source $VIM/syntax/csh.vim 
"----- also make sure it knows mlvwm resource files
autocmd BufReadPost *mlvwmrc* source $VIM/syntax/mlvwm.vim
"------ all of this stuff allows me to write gzipped files natively...cool eh?
autocmd BufRead *.gz set bin|%!gunzip
autocmd BufRead *.gz set nobin
autocmd BufWritePre *.gz %!gzip
autocmd BufWritePre *.gz set bin
autocmd BufWritePost *.gz undo|set nobin
autocmd FileReadPost *.gz set bin|'[,']!gunzip
autocmd FileReadPost set nobin

"set ai

map  :w!<cr>:!aspell check %<cr>:e! %<cr>

"----- have java highlight our functions
let java_highlight_functions=1
"set foldclose=
set foldcolumn=1
set foldmethod=syntax
set foldenable
set foldlevel=10

"syn region foldRegion start=+{+ end="}" fold
"syn region commentDef start=+/\*+ end="*/" keepend  fold

map ,fa :set foldclose=all<cr>
map ,fm :set foldclose=<cr>
"----- instructions for VIM on processing this file
" vim:ts=3
runtime plugin/RainbowParenthsis.vim 
"et foldclose=<cr>
set cindent
set autoindent
set shiftwidth=3


