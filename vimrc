" =============== indero's vim config ===============

" Modeline and Notes {
" vim:foldmarker={,}:foldmethod=marker
"
"   This is the personal .vimrc file of indero.
"   While much of it is beneficial for general use, I would
"   recommend picking out the parts you want and understand.
"
" }

" This changes the values of a LOT of options, enabling features which
" are not Vi compatible but really really nice.
set nocp

" ========== MinPac Initialization ========== {1

" For a paranoia.
" Normally `:set nocp` is not needed, because it is done automatically
" when .vimrc is found.
if &compatible
  " `:set nocp` has many side effects. Therefore this should be done
  " only when 'compatible' is set.
  set nocompatible
endif

packadd minpac
call minpac#init({'verbose': 3})
call minpac#add("k-takata/minpac", {'type': 'opt'})

" Plugins :call#minpac#update()
" call minpac#add('')

" Looks and Feel
call minpac#add('Xuyuanp/nerdtree-git-plugin') " git plugin for nerdtree
call minpac#add('scrooloose/nerdtree') " Nice file explorer
call minpac#add('shinzui/vim-idleFingers') " Color Theme
call minpac#add('vim-airline/vim-airline') " Vim Airline, Fancy Statusbar
call minpac#add('vim-airline/vim-airline-themes') " Themes for Airline
call minpac#add('ryanoasis/vim-devicons') " Add devicons if a Nerd Font is installed
call minpac#add('luochen1990/rainbow') " Color matching braces

" Functionality
call minpac#add('bronson/vim-trailing-whitespace') " add the command :FixWhitespace
call minpac#add('ctrlpvim/ctrlp.vim') " Adds the ctrl-p, fuzzy file, buffer, nru ...
call minpac#add('easymotion/vim-easymotion') " Helps with navigating. <Leader><Leader>w
call minpac#add('godlygeek/tabular') " helps with alignment of text
call minpac#add('tpope/vim-eunuch') " Vim sugar for Unix shell commands (:SudoWrite)
call minpac#add('tpope/vim-surround') " Adds the surround motion to vim

" Utility
call minpac#add('vim-scripts/gnupg.vim', {'type': 'opt'})

" Invisible Helpers
call minpac#add('ap/vim-css-color') " Highlight css style colors aprooximatly
call minpac#add('tpope/vim-endwise') " Autocloses some construct in some languages.
call minpac#add('tpope/vim-repeat') " Changes the way . works by allowing plugins to use it
call minpac#add('vim-scripts/SearchComplete') " Autocomplete your searches in the file
call minpac#add('vim-scripts/YankRing.vim') " Better yanking and pasting

" Programming Support
call minpac#add('airblade/vim-gitgutter') " have git info in the SignColumn
call minpac#add('majutsushi/tagbar') " Have a list of function and classes to jump to
call minpac#add('prettier/vim-prettier') " Prettier web development files
call minpac#add('tomtom/tcomment_vim') " use gcc to comment out a line
call minpac#add('tpope/vim-fugitive') " Git wrapper for vim
call minpac#add('w0rp/ale') " async syntax checker and linter
call minpac#add('airblade/vim-rooter') "Rooter changes the working directory to the project root when you open a file or directory.
call minpac#add('tpope/vim-dispatch') " Leverage the power of Vim's compiler plugins without being bound by synchronicity


" Autocompletion
call minpac#add('Shougo/deoplete.nvim') " deoplete completer
call minpac#add('roxma/nvim-yarp') " helper for deoplete
call minpac#add('roxma/vim-hug-neovim-rpc') " helper for deoplete
call minpac#add('Shougo/neco-vim') " deoplete vim completion
call minpac#add('deoplete-plugins/deoplete-jedi') "deoplete python completion

" Go Language Support
call minpac#add('fatih/vim-go') " go plugin

" Puppet Language Support
call minpac#add('netdata/vim-puppet')

" Python Language Support
call minpac#add('tmhedberg/SimpylFold') "No-BS Python code folding for Vim

" Markdown Support
call minpac#add('plasticboy/vim-markdown') " Markdown Vim Mode
call minpac#add('tenfyzhong/tagbar-markdown.vim') "
call minpac#add('PratikBhusal/vim-grip') " Grip Wrapper for Vim
call minpac#add('mzlogin/vim-markdown-toc') "Generate table of contents for Markdown files.

"Yaml Support
call minpac#add('pedrohdz/vim-yaml-folds') "Very simple folding configuration for YAML

" Optional Plugins
call minpac#add('guns/xterm-color-table.vim', {'type': 'opt'})
"call minpac#add('')


" minpac utility commands {2
command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
command! PackStatus packadd minpac | source $MYVIMRC | call minpac#status()
"}2


" Load built in Plugins {2
packadd! matchit
packadd! justify
" }2

" Basic config {2
filetype off
syntax on
filetype plugin indent on
" }2

" }1

" ========== Colorscheme ========== {1

" My colorscheme
try
  colorscheme idleFingers
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
endtry


" Ensure SignColumn, FoldColumn and LineNr
highlight LineNr ctermbg=238 ctermfg=250 guibg=#444444 guifg=#bcbcbc

" Ensure SignColumn is a little bit lighter than LineNr
highlight SignColumn ctermbg=239 ctermfg=250 guibg=#4e4e4e

" Foldcolumn in better color
highlight FoldColumn ctermbg=239 ctermfg=251 guibg=#4e4e4e

" ColorColumn, show where column 80 is
set colorcolumn=80
hi ColorColumn ctermbg=234 guibg=#1c1c1c

" Enable Cursorline but make it invisible
set cul
hi clear CursorLine
augroup CLClear
  autocmd! ColorScheme * hi clear CursorLine
augroup END

" Highlight the Cursorline Number
hi clear CursorLineNr
hi CursorLineNR ctermbg=NONE ctermfg=202 guifg=#ff5f00
augroup CLNRSet
  autocmd! ColorScheme * hi CursorLineNR ctermbg=NONE ctermfg=202
augroup END



" }1

" ========== Special Buttons ========== {

" Paste mode toggle to F4
set pastetoggle=<f4>

" Toggle Line number
" <F5>

" Toggle Tagbar (ensure ctags are installed)
nmap <F6> :TagbarToggle<CR>

" Disable cursor keys in normal mode
  nnoremap <Left>  :echo "Use HJKL!"<cr>
  nnoremap <Right> :echo "Use HJKL!"<cr>
  nnoremap <Up>    :echo "Use HJKL!"<cr>
  nnoremap <Down>  :echo "Use HJKL!"<cr>

  " Use Shift and direction to resize splits
  nnoremap <S-Up>    :resize +2<CR>
  nnoremap <S-Down>  :resize -2<CR>
  nnoremap <S-Left>  :vertical resize +2<CR>
  nnoremap <S-Right> :vertical resize -2<CR>


" Change the mapleader from \ to ,
let mapleader=","

" Use Double j as ESC button.
" jj = <esc>
" Very useful for keeping your hands on the home row
imap jj <Esc>

" Use // to disable highlighted search
nmap <silent> // :nohlsearch<CR>

" }

" ========== General Config ========== {1

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

"Turn linenumber on
set number

" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=4

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

" Save session
"au BufWinLeave * silent! mkview
"au BufWinEnter * silent! loadview
" Create a view-dir
set viewdir=~/.vim-cache/view

" Read per file settings {2
set modeline

" First and last four lines can contain settings
set modelines=4
" }2

" Diffrent background color after char 80
" if has ('colorcolumn')
"   set colorcolumn=80
"   let &colorcolumn=join(range(81,237),",")
"   highlight ColorColumn ctermbg=234 guibg=#1c1c1c
" endif

" ===== Tabstops stuff ===== {
" a tab is two spaces
set tabstop=2

" an autoindent (with <<) is two spaces
set shiftwidth=2

" convert tabs in to spaces
set expandtab

" This makes the backspace key treat the two spaces like a tab
" (so one backspace goes back a full 2 spaces).
set softtabstop=2

" Fix Backspace in insert mode
set backspace=indent,eol,start

" Fix pasting with middle mousebutton
" https://unix.stackexchange.com/questions/364047/stop-vim-pasting-selections-as-text
set t_BE=

" }

" ===== Invisible Chars ===== {

" Show invisible characters set listchars="" " Reset the listchars
set list
" A tab should display as "‣-", trailing whitespace as "•"
" set listchars=tab:>-
set listchars=tab:‣-
" extended chars when wrap is off
set listchars+=extends:»,
" precedes chars when wrap is off
set listchars+=precedes:«
" Show trailing spaces as dots
set listchars+=trail:•
" nonbreakable space
set listchars+=nbsp:¬
" no char at eol
set listchars-=eol
" set listchars+=eol:¶
set showbreak=↪\ 
" }

" ===== Undo ===== {

function! EnsureDirExists (dir)
  if !isdirectory(a:dir)
    if exists("*mkdir")
      call mkdir(a:dir,'p')
      echo "Created directory: " . a:dir
    else
      echo "Please create directory: " . a:dir
    endif
  endif
endfunction

call EnsureDirExists($HOME . '/.vim-cache/undodir')

" Create a undo history. Even if the file was closed you can do an undo.
if has('undofile')
  set undodir=~/.vim-cache/undodir
  set undofile
  set undoreload=10000 "maximum number lines to save for undo on a buffer reload
endif
set undolevels=1000 "maximum number of changes that can be undone
" }

" ===== Plugin and Language Settings ===== {2
"

" Set encoding
set encoding=utf-8

" === Zen Coding Config ===
" Change zen coding plugin expansion key to shift + e
let g:user_zen_expandabbr_key = '<C-e>'

" === neocomplcache ===
let g:neocomplcache_enable_at_startup = 1
let g:acp_enableAtStartup = 0

" === CTRLP ===
let g:ctrlp_map = '<LEADER>p'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_cache_dir = $HOME.'/.vim-cache/ctrlp'

" === Airline ===
" Use Fancy symbols
" Get one of the fonts from:
" https://github.com/Lokaltog/vim-powerline/wiki/Patched-fonts
let g:airline_theme='powerlineish'
let g:airline_section_x ='%y [%b|0x%B]'
let g:airline_powerline_fonts = 1
" Add a segment
"call Pl#Theme#InsertSegment('charcode', 'before', 'fileformat')

" === Tagbar ===
" Autofocus on opening Tagbar
let g:tagbar_autofocus = 1

" === Latex Config ===
" Latex plugin does autofold. I don't like this.
autocmd Filetype tex setlocal nofoldenable " I don't like autofold from vim-latex

" === vim-gitgutter ===
let g:gitgutter_override_sign_column_highlight = 0
highlight GitGutterAdd ctermfg=darkgreen ctermbg=239 guibg=#4e4e4e guifg=#00ff00
highlight GitGutterChange ctermfg=yellow ctermbg=239 guibg=#4e4e4e guifg=#808000
highlight GitGutterDelete ctermfg=red ctermbg=239 guibg=#4e4e4e guifg=#800000
highlight GitGutterChangeDelete ctermfg=yellow ctermbg=239 guibg=#4e4e4e
autocmd BufWritePost * GitGutter

if exists('&signcolumn')  " Vim 7.4.2201
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif

" === ale ===
highlight ALEErrorSign ctermfg=203
highlight ALEWarningSign ctermfg=136

let g:ale_echo_msg_error_str = 'Error'
let g:ale_echo_msg_warning_str = 'Warning'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_sign_error = '✗'
let g:ale_sign_warning = '!'
let g:ale_list_window_size = 5

let g:ale_python_flake8_args = '--ignore=E,W,F403,F405 --select=F,C'
let b:ale_linters = ['flake8', 'pylint']

" enable golint for golang
let b:ale_linters = {'go': ['golint']}

" === SimplyFold (Python) ===
let g:SimpylFold_docstring_preview = 1

" === Markdown ===
"
" Hide Markdown source until cursor is on element
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

let g:vim_markdown_conceal_code_blocks = 0


let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading 1 (Title)',
        \ 'i:Heading 2',
        \ 'k:Heading 3'
    \ ]
\ }

" Content of ~/.ctags
" --langdef=markdown
" --langmap=markdown:.mkd
" --regex-markdown=/^#[ \t]+(.*)/\1/h,Heading_1_Title/
" --regex-markdown=/^##[ \t]+(.*)/\1/i,Heading_2/
" --regex-markdown=/^###[ \t]+(.*)/\1/k,Heading_3/

" === Asciidoc ===
"
let g:tagbar_type_asciidoc = {
      \ 'ctagstype' : 'asciidoc',
      \ 'kinds' : [
          \ 'h:table of contents',
        \ 'a:anchors:1',
        \ 't:titles:1',
        \ 'n:includes:1',
        \ 'i:images:1',
        \ 'I:inline images:1'
    \ ],
    \ 'sort' : 0
\ }

" === Rainbow ===
" Adding color braces
"
let g:rainbow_conf = {
      \ 'guifgs': ['lightblue', 'green', 'yellow', 'purple', 'lightgreen', 'orangered', 'pink' ],
      \ 'ctermfgs': ['lightblue', '34', '11', '68', '46', '130', '211' ],
      \ 'operators': '_,_',
      \ 'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
      \ 'separately': {
      \   '*': {},
      \   'tex': {
      \     'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
      \   },
      \   'lisp': {
      \     'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
      \   },
      \   'vim': {
      \     'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
      \   },
      \   'html': {
      \     'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
      \   },
      \   'css': 0,
      \ }
      \}


" === NERDTree ===
"

map <F7> :NERDTreeToggle<CR>

let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

let g:NERDTreeNodeDelimiter = "\u00a0"

let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeGitStatusNodeColorization = 1

let NERDTreeShowHidden = 1
" let g:NERDTreeShowIgnoredStatus = 1
let NERDTreeIgnore = ['\.git$', '\.pioenvs$', '\.swp']

" NERDTree coloring¶
hi nerdtreeDir guifg=#FFC66D ctermfg=143
hi nerdtreeDirSlash guifg=#FFC66D ctermfg=173
hi nerdtreefile guifg=#FFC66D ctermfg=248


let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" }2

" ========== Custom Functions ========== {1

" ===== Folding function ===== {2

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

"}2


" ===== Ovlerlenght Fucntion===== {2

nnoremap <leader>h :call ToggleOverLengthHighlight()<CR>
let g:overlength_enabled = 0
highlight OverLength ctermbg=237 guibg=#212121

function! ToggleOverLengthHighlight()
    if g:overlength_enabled == 0
        match OverLength /\%80v.*/
        let g:overlength_enabled = 1
        echo 'OverLength highlighting turned on'
    else
        match
        let g:overlength_enabled = 0
        echo 'OverLength highlighting turned off'
    endif
endfunction


"}2

" ===== Toggle numbers function ===== {2

" This function lets you toggle between:
" number, hybrid, nonumber
if exists('+relativenumber')
  function! ToggleNumbers()
    if &number && &relativenumber == 0
      set relativenumber       " was number, now relanum
    elseif &relativenumber && &number
      set nonumber norelativenumber " was relativenumber and number now nothing
      set foldcolumn=0
      set signcolumn=no
      set nolist
    else
      set number " was nothing, now number
      set foldcolumn=2
      set signcolumn=auto
      set list
    endif
  endfunction
else
  function! ToggleNumbers()
    set number! number?
  endfunction
endif

nmap <F5> :silent call ToggleNumbers()<CR>
" }2


" ===== Close final Buffer===== {2
" Close Vim if the only Buffer remainig is a NerdTree window or a Quickfix
" Window
"
augroup finalcountdown
 au!
 "autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw" || &buftype == 'quickfix' |q|endif
 autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) || &buftype == 'quickfix' | q | endif
 "nmap - :Lexplore<cr>
 nmap - :NERDTreeToggle<cr>
augroup END
" }2


"}1

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
