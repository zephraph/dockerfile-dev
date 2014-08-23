#!/bin/bash

# Script for installing tmux on systems where you don't have root access.
# tmux will be installed in /usr/bin.
# It's assumed that wget and a C/C++ compiler are installed.

# exit on error
set -e

TMUX_VERSION=${TMUX_MAJOR_VERSION}${TMUX_MINOR_VERSION}
TMUX_FILE=tmux-${TMUX_VERSION}.tar.gz

# create our directories
mkdir -p /usr/ $HOME/tmux_tmp
cd $HOME/tmux_tmp

# download source files for tmux, libevent, and ncurses
wget -O ${TMUX_FILE} http://sourceforge.net/projects/tmux/files/tmux/tmux-${TMUX_MAJOR_VERSION}/${TMUX_FILE}/download
wget https://github.com/downloads/libevent/libevent/libevent-2.0.19-stable.tar.gz
wget ftp://ftp.gnu.org/gnu/ncurses/ncurses-5.9.tar.gz

# extract files, configure, and compile

############
# libevent #
############
tar xvzf libevent-2.0.19-stable.tar.gz
cd libevent-2.0.19-stable
./configure --prefix=/usr --disable-shared
make
make install
cd ..

############
# ncurses  #
############
tar xvzf ncurses-5.9.tar.gz
cd ncurses-5.9
./configure --prefix=/usr
make
make install
cd ..

############
# tmux     #
############
tar xvzf ${TMUX_FILE}
cd tmux-${TMUX_VERSION}
./configure CFLAGS="-I/usr/local/include -I/usr/include/ncurses" LDFLAGS="-L/usr/lib -L/usr/include/ncurses -L/usr/include"
CPPFLAGS="-I/usr/local/include -I/usr/include/ncurses" LDFLAGS="-static -L/usr/include -L/usr/include/ncurses -L/usr/lib" make
cp tmux /usr/bin
cd ..

# cleanup
rm -rf $HOME/tmux_tmp
