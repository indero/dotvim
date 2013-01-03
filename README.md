# My (indero) vim config
## Installation:

    git clone git://github.com/indero/dotvim.git ~/.vim

### Create symlinks:

    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc

Switch to the `~/.vim` directory, and fetch submodules:

    cd ~/.vim
    git submodule update --init.

## Whats included:

### Keystrokes

- jj as ESC
- // reset search highlight

### Settings

#### Multiple plugin directories
Load plugins from ~/.vim/bundle, ~/.vim-testing/bundle, ~/.vim-dev/bundle and
~/.vim-local/bundle/

#### Multiple vimrcs
Load vimrc from ~/.vim-testing/vimrc.local,~/.vim-dev/vimrc.local,
~/.vim-local/vimrc.local,~/.vim/vimrc.local

#### General Settings
- Keep 100 lines of command history
- By scrolling, keep the cursor 8 lines from top and bottom
- Use the wildmenu
- highlight search results
- Begin search while typing
- No bells
- Tab is 2 spaces
- Trailing whitspaces are displayed as a dot.
- Have undo kept.

#### Plugin Settings
- ZenCoding Abbrev Key CTRL-E
- Powerline needs utf8.

### Functions

#### Folding

Fold and unfold with space key.



### Plugins
- pathogen
- Fugitive
- gpg
- tcomment
- tabular
- tagbar
- matchit
- latex-suite
- zencoding
- powerline
- nerdtree
- neocomplcache
- snipmate
- trailing-whitespace
- searchcomplete
- vim-repeat
