#
# Developement Dockerfile
#
# https://github.com/zephraph/dockerfile-dev
#

# Include base image
FROM dockerfile/nodejs

MAINTAINER Justin Bennett <jtbnnt@gmail.com>

# Update ubuntu
RUN sudo apt-get update && \ 
    sudo apt-get upgrade -y && \
    adduser zephraph

# Copy over useful files
ADD ./config /root
ADD ./scripts /root/scripts

# Configure TMUX
ENV TMUX_MAJOR_VERSION 1.9
ENV TMUX_MINOR_VERSION a

# Install Software
RUN ~/scripts/install_tmux.sh && \
    sudo apt-get install -y vim && \
    sudo apt-get install tree && \
    npm install -g coffee-script && \
    wget -N https://raw.githubusercontent.com/zephraph/vimrc/master/.vimrc -P ~/

# Setup vundle
RUN mkdir -p ~/.vim/bundle && \
    sudo apt-get install -y git curl && \
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim && \
    vim +PluginInstall +qall

# Install meteor
RUN curl https://install.meteor.com/ | sh

# Start tmux in color mode
CMD ["tmux", "-2"]
