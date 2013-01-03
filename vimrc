" ================ indero's vim config ==============

" Modeline and Notes {
" vim: set foldmarker={,} foldmethod=marker
"
"   This is the personal .vimrc file of indero.
"   While much of it is beneficial for general use, I would
"   recommend picking out the parts you want and understand.
"
" }

" This changes the values of a LOT of options, enabling features which
" are not Vi compatible but really really nice.
set nocp

" ========== Pathogen Initialization ========== {

" This loads all the plugins in ~/.vim/bundle
" Use tpope's pathogen plugin to manage all other plugins
"
" Note that you need to invoke the pathogen functions before invoking
" 'filetype plugin indent' on if you want it to load ftdetect files.
" On Debian (and probably other distros), the system vimrc does this early on,
" so you actually need to “filetype off”
" before “filetype plugin indent on” to force reloading.

" Call general plugins
call pathogen#infect('bundle')
" Call plugins to be tested and might end up in general
call pathogen#infect('~/.vim-testing/bundle')
" Call plugins I develop
call pathogen#infect('~/.vim-dev/bundle')
" Call plugins only installed for this machine
call pathogen#infect('~/.vim-local/bundle')
filetype off
syntax on
filetype plugin indent on
call pathogen#helptags()

" }

" My colorscheme
colorscheme idleFingers

" ========== Special Buttons ========== {

" Paste mode toggle to F4
set pastetoggle=<f4>

" Toggle Line number
nmap <F5> :set number! number?<CR>

" Toggle Tagbar (ensure ctags are installed)
nmap <F6> :TagbarToggle<CR>

" Disable cursor keys in normal mode
map <Left>  :echo "no!"<cr>
map <Right> :echo "no!"<cr>
map <Up>    :echo "no!"<cr>
map <Down>  :echo "no!"<cr>

" Change the mapleader from \ to ,
let mapleader=","

" Use Double j as ESC button.
" jj = <esc>
" Very useful for keeping your hands on the home row
imap jj <Esc>

" }

" ========== General Config ========== {

" ==== Alternate Statusline (without powerline) ====
" Set the status line the way i like it
"set stl=%f\ %m\ %r%{fugitive#statusline()}\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]
" tell VIM to always put a status line in, even if there is only one window
" "https://wincent.com/wiki/Set_the_Vim_statusline
set statusline=%<\ %f\%m%r\ %y\ %{fugitive#statusline()}\ %=%-35.(Line:\ %l\ of\ %L,\ Col:\ %c%V\ Buf:#%n\ (%P)%)

" Tell VIM to always put a status line in, even if there is only one window
set laststatus=2

" Make command line two lines high
set ch=2

" Set visual bell -- i hate that damned beeping
set vb

" Make the 'cw' and like commands put a $ at the end instead of just deleting
" the text and replacing it
" set cpoptions=ces$
" To use the snipmate plugin ces$ does not work. Use B$ instead.
set cpoptions=B$

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
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpe?g,*.png,*.xpm,*.gif,*.pyc

" Enable search highlighting
set hlsearch

" I don't like it when the matching parens are automatically highlighted
let loaded_matchparen = 1

" Add the unnamed register to the clipboard
set clipboard+=unnamed

" When completing by tag, show the whole tag, not just the function name
set showfulltag

" Get rid of the silly characters in separators if a window is split
set fillchars = ""

" Automatically read a file that has changed on disk
set autoread

" Spelling corrects. Just for example. Add yours below.
iab teh the
iab Teh The

" Begin search while typing
set incsearch

" Don't beep
set noerrorbells
set novisualbell

" Set indenting for puppet files
autocmd FileType puppet setlocal shiftwidth=4 tabstop=4

" ===== Tab stuff ===== {
" a tab is two spaces
set tabstop=2
" an autoindent (with <<) is two spaces
set shiftwidth=2
" convert tabs in to spaces
set expandtab
" This makes the backspace key treat the two spaces like a tab
" (so one backspace goes back a full 2 spaces).
set softtabstop=2

" }

" ===== Invisible Chars ===== {

" Show invisible characters set listchars=""                  " Reset the listchars
set list
" A tab should display as "  ", trailing whitespace as "."
set listchars=tab:\ \
" Show trailing spaces as dots
set listchars+=trail:.

" }

" ===== Undo ===== {

" Create a undo history. Even if the file was closed you can do an undo.
set undodir=~/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload
" }

" ===== Plugin specific ====== {

" == Powerline Config ==
" Use unicode for the symbols
let g:Powerline_symbols = 'unicode'
set encoding=utf-8

" == Zen Coding Config ==
" Change zen coding plugin expansion key to shift + e
let g:user_zen_expandabbr_key = '<C-e>'

" == Latex Config ==

" Latex plugin does autofold. I don't like this.
autocmd Filetype tex setlocal nofoldenable " I don't like autofold from vim-latex

" }

" ========== Folding function ========== {

" Automatically fold everything, but open all folds.
" To fold simply press <RETURN>

"http://stackoverflow.com/questions/849084/what-fold-should-i-use-in-vim
" Folding stuff
"hi Folded guibg=red guifg=Red cterm=bold ctermbg=DarkGrey ctermfg=lightblue
"hi FoldColumn guibg=grey78 gui=Bold guifg=DarkBlue
set foldcolumn=2
set foldclose=
set foldmethod=indent
set foldnestmax=10
set foldlevel=999
"set fillchars=vert:\|,fold:\
"set foldminlines=1
" Toggle fold state between closed and opened.

" If there is no fold at current line, just moves forward.
" If it is present, reverse it's state.
fu! ToggleFold()
  if foldlevel('.') == 0
    normal! l
  else
    if foldclosed('.') < 0
      . foldclose
    else
      . foldopen
    endif
  endif
  echo
endf
" Map this function to Space key.
noremap <space> :call ToggleFold()<CR>

"}

"}

" ========== Load More vim configs ========== {
" load vimrc for testing
if filereadable(expand("$HOME/.vim-testing/vimrc.local"))
  source $HOME/.vim-testing/vimrc.local
endif

" load vimrc for development
if filereadable(expand("$HOME/.vim-dev/vimrc.local"))
  source $HOME/.vim-dev/vimrc.local
endif

" load vimrc for local machine
if filereadable(expand("$HOME/.vim-local/vimrc.local"))
  source $HOME/.vim-local/vimrc.local
endif

"Load a host specific file
if filereadable(expand("$HOME/.vim/vimrc.local"))
  source $HOME/.vim/vimrc.local
endif

" }

" ============== Thanks to =================
" Derek Wyatt
" dasrecht
" skwp (yadr)
" The Internet
