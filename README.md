I personally use this with Macvim which I installed via homebrew with `brew install macvim` and run in the OS X Terminal using the command `mvim -v` which I have aliased to `vim` in my `.profile`.

## Installation:

    git clone git://github.com/TimFletcher/dotvim.git ~/.vim

## Create symlinks:

    ln -s ~/.vim/vimrc ~/.vimrc

## Switch to the `~/.vim` directory, and fetch submodules:

    cd ~/.vim
    git submodule init
    git submodule update
