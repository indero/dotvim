"Thanks to Derek Wyatt
"and Jeffrey Way.

"This changes the values of a LOT of options, enabling features which are not Vi compatible but really really nice.
set nocp

"Note that you need to invoke the pathogen functions before invoking “filetype plugin indent on” if you want it to load ftdetect files. On Debian (and probably other distros), the system vimrc does this early on, so you actually need to “filetype off” before “filetype plugin indent on” to force reloading.

"Pathogen
call pathogen#runtime_append_all_bundles()
filetype off
syntax on
filetype plugin indent on
call pathogen#helptags()


"My colorscheme
colorscheme idleFingers


" Set filetype stuff to on
filetype on

"From Derek Wyatt

" Set the status line the way i like it
"set stl=%f\ %m\ %r%{fugitive#statusline()}\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]
" tell VIM to always put a status line in, even if there is only one window
" "https://wincent.com/wiki/Set_the_Vim_statusline
set statusline=%<\ %f\%m%r\ %y\ %{fugitive#statusline()}\ %=%-35.(Line:\ %l\ of\ %L,\ Col:\ %c%V\ Buf:#%n\ (%P)%)

set laststatus=2
" Make command line two lines high
set ch=2

" set visual bell -- i hate that damned beeping
set vb

" Make the 'cw' and like commands put a $ at the end instead of just deleting
" the text and replacing it
"set cpoptions=ces$
"To use the snipmate plugin ces$ does not work. Use B$ instead.
set cpoptions=B$

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
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpe?g,*.png,*.xpm,*.gif,*.pyc

" Enable search highlighting
set hlsearch

" I don't like it when the matching parens are automatically highlighted
let loaded_matchparen = 1

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


"From Jeffrey Way

"Change zen coding plugin expansion key to shift + e
let g:user_zen_expandabbr_key = '<C-e>'

"Spelling corrects. Just for example. Add yours below.
iab teh the
iab Teh The

"From dasrecht

"jj = <esc>  Very useful for keeping your hands on the home row   
imap jj <Esc>


"My Settings

"Begin search while typing
set incsearch

"don't beep 
set noerrorbells
set novisualbell

" change the mapleader from \ to ,
let mapleader=","

" paste mode toggle
set pastetoggle=<f4>

" toggle number
nmap <F5> :set number! number?<CR>

" set indenting for puppet files
autocmd FileType puppet setlocal shiftwidth=4 tabstop=4

" disable cursor keys in normal mode
map <Left>  :echo "no!"<cr>
map <Right> :echo "no!"<cr>
map <Up>    :echo "no!"<cr>
map <Down>  :echo "no!"<cr>

set expandtab
set shiftwidth=2
set softtabstop=2

"Powerline Config
let g:Powerline_symbols = 'unicode'
set encoding=utf-8

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


" More Stuff
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces

set list                          " Show invisible characters
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots

autocmd Filetype tex setlocal nofoldenable " I don't like autofold from vim-latex


"Load a host specific file
if filereadable(expand("$HOME/.vim/vimrc.local"))
  source $HOME/.vim/vimrc.local
endif
