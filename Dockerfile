#
# Developement Dockerfile
#
# https://github.com/zephraph/dockerfile-dev
#

# Include base image
FROM dockerfile/python

MAINTAINER Justin Bennett <jtbnnt@gmail.com>

# Update ubuntu
RUN sudo apt-get update
RUN sudo apt-get upgrade

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

# Configure terminal colors
printf '\n# Set terminal color to 256\n' >> ~/.bashrc
printf 'export TERM=xterm-256color\n' >> ~/.bashrc

# Start tmux in color mode
CMD ["tmux", "-2"]
