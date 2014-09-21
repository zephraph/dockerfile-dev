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
RUN sudo apt-get upgrade -y

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

# Setup colorized
RUN wget --no-check-certificate https://raw.github.com/seebi/dircolors-solarized/master/dircolors.ansi-dark ~/
RUN mv ~/dircolors.ansi-dark ~/.dircolors
RUN eval `dircolors ~/.dircolors`
RUN git clone https://github.com/sigurdga/gnome-terminal-colors-solarized.git /tmp
RUN /tmp/gnome-terminal-colors-solarized/set_dark.sh

# Start tmux in color mode
CMD ["tmux", "-2"]
