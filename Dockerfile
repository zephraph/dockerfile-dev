#
# Developement Dockerfile
#
# https://github.com/zephraph/dockerfile-dev
#

# Include base image
FROM dockerfile/python

MAINTAINER Justin Bennett <jtbnnt@gmail.com>

# Copy over useful files
ADD ./config /root
ADD ./scripts /root/scripts

# Install tmux
ENV TMUX_MAJOR_VERSION 1.9
ENV TMUX_MINOR_VERSION a
RUN ~/scripts/install_tmux.sh

# Install vim
RUN sudo apt-get install -y vim

# Setup vundle
RUN mkdir -p ~/.vim/bundle
RUN sudo apt-get install -y git curl
RUN git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
RUN vim +PluginInstall +qall

# Set the default command
CMD ["tmux"]
