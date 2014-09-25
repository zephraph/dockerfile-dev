#
# Developement Dockerfile
#
# https://github.com/zephraph/dockerfile-dev
#

# Include base image
FROM dockerfile/python

MAINTAINER Justin Bennett <jtbnnt@gmail.com>

# Update ubuntu
RUN sudo apt-get update && \ 
    sudo apt-get upgrade -y

# Copy over useful files
ADD ./config /root
ADD ./scripts /root/scripts

# Configure TMUX
ENV TMUX_MAJOR_VERSION 1.9
ENV TMUX_MINOR_VERSION a

# Install Software
RUN ~/scripts/install_tmux.sh && \
    sudo apt-get install -y vim && \
    sudo apt-get install tree

# Setup vundle
RUN mkdir -p ~/.vim/bundle && \
    sudo apt-get install -y git curl && \
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim && \
    vim +PluginInstall +qall

# Start tmux in color mode
CMD ["tmux", "-2"]
