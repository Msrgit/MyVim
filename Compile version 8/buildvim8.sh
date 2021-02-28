#!/bin/bash
sudo apt-get -y install libncurses5-dev python-dev mercurial ctags silversearcher-ag
cd ~
git clone https://github.com/vim/vim.git
cd vim
make distclean
./configure --with-features=huge --enable-pythoninterp --with-python-config-dir=/usr/lib/python2.7/config \
--enable-python3interp \
--with-python3-config-dir=/usr/lib/python3.5/config-3.5m-arm-linux-gnueabihf \
--prefix=/usr
make VIMRUNTIMEDIR=/usr/share/vim/vim82
sudo make install
