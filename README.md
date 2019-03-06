# My (indero) vim config
## Installation:

```bash
    git clone git://github.com/indero/dotvim.git ~/.vim
```

### Create symlinks:

```bash
    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc
```

### Install minpac

```bash
    mkdir -p ~/.vim/pack/minpac/opt
    cd ~/.vim/pack/minpac/opt
    git clone https://github.com/k-takata/minpac.git
    cd
```

### Install all the Plugins
```bash
    vim
    :PackUpdate
```

## Prerequisites

- Patched font for Powerline: https://github.com/Lokaltog/vim-powerline/wiki/Patched-fonts
- 256 Color Terminal

## Whats included:

### Keystrokes

- jj as ESC
- // reset search highlight
- ,p open CTRLP

### F-Keys
- <F4> Toggle paste mode
- <F5> Toggle between number/relative number/no number
- <F6> Toggle Tagbar

### Settings

#### Multiple plugin directories
- Not implemented anymore

#### Multiple vimrcs
Load vimrc from:
- ~/.vim-testing/vimrc.local
- ~/.vim-dev/vimrc.local
- ~/.vim-local/vimrc.local
- ~/.vim/vimrc.local

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
- Powerline needs utf8.

### Functions

#### Folding

Fold and unfold with space key.

### Plugins
- Xuyuanp/nerdtree-git-plugin
- airblade/vim-gitgutter
- ap/vim-css-color
- bronson/vim-trailing-whitespace
- ctrlpvim/ctrlp.vim
- easymotion/vim-easymotion
- godlygeek/tabular
- majutsushi/tagbar
- netdata/vim-puppet
- prettier/vim-prettier
- scrooloose/nerdtree
- shinzui/vim-idleFingers
- tomtom/tcomment_vim
- tpope/vim-eunuch
- tpope/vim-endwise
- tpope/vim-fugitive
- tpope/vim-repeat
- tpope/vim-surround
- vim-airline/vim-airline
- vim-airline/vim-airline-themes
- vim-scripts/SearchComplete
- vim-scripts/YankRing.vim
- vim-scripts/gnupg.vim
- w0rp/ale
