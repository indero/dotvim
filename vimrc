"Pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()


"My Colorscheme
colorscheme xoria256


" Set filetype stuff to on
filetype on
filetype plugin on
filetype indent on



" Set the status line the way i like it
set stl=%f\ %m\ %r%{fugitive#statusline()}\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]
" tell VIM to always put a status line in, even if there is only one window

set laststatus=2
" Make command line two lines high
set ch=2
" set visual bell -- i hate that damned beeping

set vb

" Make the 'cw' and like commands put a $ at the end instead of just deleting
" the text and replacing it
set cpoptions=ces$

" tell VIM to always put a status line in, even if there is only one window
set laststatus=2

" Show the current mode
set showmode

" Hide the mouse pointer while typing
set mousehide

" Keep some stuff in the history
set history=100

" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=8

" Make the command-line completion better
set wildmenu

" Enable search highlighting
set hlsearch

" Add the unnamed register to the clipboard
set clipboard+=unnamed

" Switch on syntax highlighting.
syntax on

" When completing by tag, show the whole tag, not just the function name
set showfulltag

" get rid of the silly characters in separators
set fillchars = ""

" Automatically read a file that has changed on disk
set autoread


"Jeffrey Way
"
"Change zen coding plugin expansion key to shift + e
let g:user_zen_expandabbr_key = '<C-e>'

"Spelling corrects. Just for example. Add yours below.
iab teh the
iab Teh The
