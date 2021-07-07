#!/bin/bash
function dbum() {
    if [[ -e "$1" ]]; then
        mv "$1" "$1.$(date +%y%m%d%H%M%S)"
    fi
}
sudo apt-get -y install ctags silversearcher-ag
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

dbum ~/.vimrc

cp .vimrc ~/.vimrc
cp .ctags ~/.ctags
mkdir -p ~/.vim && cp plugins.vim ~/.vim/plugins.vim
mkdir -p ~/.vim/colors 
mkdir -p ~/.vim/bundle
cp ./colors/* ~/.vim/colors
