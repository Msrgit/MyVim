#!/bin/bash
sudo apt-get -y install libncurses5-dev python-dev mercurial ctags silversearcher-ag
cd ~
git clone https://github.com/vim/vim.git
cd vim
make clean distclean
./configure --with-features=huge \
--enable-pythoninterp=yes \
--enable-python3interp=yes \
--enable-multibyte \
--with-python2-command=$(which python2) \
--with-python2-config-dir=$(python2-config --configdir) \
--with-python3-command=$(which python3) \
--with-python3-config-dir=$(python3-config --configdir) \
--prefix=/usr
make VIMRUNTIMEDIR=/usr/share/vim/vim82
sudo make install
