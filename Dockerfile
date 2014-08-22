#
# Developement Dockerfile
#
# https://github.com/zephraph/dockerfile-dev
#

# Include base image
FROM dockerfile/python

MAINTAINER Justin Bennett <jtbnnt@gmail.com>

RUN sudo apt-get install -y vim
RUN sudo apt-get install -y tmux

ADD ./.vimrc /root
ADD ./.tmux.conf /root

# Setup vundle
RUN mkdir ~/.vim/bundle
RUN sudo apt-get install -y git curl
RUN git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
RUN vim +PluginInstall +qall