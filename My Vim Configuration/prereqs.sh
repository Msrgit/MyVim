#!/bin/bash
function dbum() {
    if [[ -e "$1" ]]; then
        mv "$1" "$1.$(date +%y%m%d%H%M%S)"
    fi
}
sudo apt-get -y install ctags silversearcher-ag
dbum ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp .vimrc ~/.vimrc
cp .ctags ~/.ctags
mkdir -p ~/.vim && cp plugins.vim ~/.vim/plugins.vim
mkdir -p ~/.vim/colors 
mkdir -p ~/.vim/bundle
cp ./colors/* ~/.vim/colors
vim -c PluginInstall
