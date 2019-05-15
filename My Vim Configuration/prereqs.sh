#!/bin/bash
function dbum() {
    if [[ -e "$1" ]]; then
        mv "$1" "$1.$(date +%y%m%d%H%M%S)"
    fi
}
sudo apt-get -y install ctags silversearcher-ag

dbum ~/.vimrc
cp .vimrc ~/.vimrc
cp .ctags ~/.ctags
cp plugins.vim ~/.vim/plugins.vim

