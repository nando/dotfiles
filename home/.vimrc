set nocompatible
syntax on
filetype plugin indent on
set encoding=utf-8
"set mouse=a
set ruler
" set number
set smartindent
set ts=2  " Tabs are 2 spaces
set bs=2  " Backspace over everything in insert mode
set shiftwidth=2  " Tabs under smart indent
set expandtab
set ruler

" A really status line
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
if &statusline == ''
  "set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
  set statusline=[%n]\ %<%.99f\ %h%w%m%r%y%=%-16(\ %l,%c-%v\ %)%P
end
set laststatus=2

" Store temporary files in a central spot
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

let g:browser = 'firefox -new-tab '
"let g:browser = 'konqueror '
" Open the Ruby ApiDock page for the word under cursor, in a new Firefox tab
function! OpenRubyDoc(keyword)
  let url = 'http://apidock.com/ruby/'.a:keyword
  exec '!'.g:browser.' '.url.' &'
endfunction
noremap RB :call OpenRubyDoc(expand('<cword>'))<CR>
 
" Open the Rails ApiDock page for the word under cursos, in a new Firefox tab
function! OpenRailsDoc(keyword)
  let url = 'http://apidock.com/rails/'.a:keyword
  exec '!'.g:browser.' '.url.' &'
endfunction
noremap RR :call OpenRailsDoc(expand('<cword>'))<CR>

" Open the WordReference to translate an Spanish word
function! OpenWordreferenceSpanish(keyword)
  let url = 'http://www.wordreference.com/es/en/translation.asp?spen='.a:keyword
  exec '!'.g:browser.' '.url.' &'
endfunction
noremap WS :call OpenWordreferenceSpanish(expand('<cword>'))<CR>

" Open the WordReference to translate an English word to Spanish
function! OpenWordreferenceEnglish(keyword)
  let url = 'http://www.wordreference.com/es/translation.asp?tranword='.a:keyword
  exec '!'.g:browser.' '.url.' &'
endfunction
noremap WE :call OpenWordreferenceEnglish(expand('<cword>'))<CR>

" Open DRAE2
function! OpenDRAE2(keyword)
  let url = 'http://www.drae2.es/'.a:keyword
  exec '!'.g:browser.' '.url.' &'
endfunction
noremap RAE :call OpenDRAE2(expand('<cword>'))<CR>

" Tell vim to remember certain things when we exit
" "  '10  : marks will be remembered for up to 10 previously edited files
" "  "100 : will save up to 100 lines for each register
" "  :20  : up to 20 lines of command-line history will be remembered
" "  %    :   saves and restores the buffer list
" "  n... :   where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

function! ResCur()
    if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END
