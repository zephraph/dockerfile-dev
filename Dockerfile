#
# Developement Dockerfile
#
# https://github.com/zephraph/dockerfile-dev
#

# Include base image
FROM zephraph/brew:ionic

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
    wget -N https://raw.githubusercontent.com/zephraph/vimrc/master/.vimrc -P ~/

# Setup vundle
RUN mkdir -p ~/.vim/bundle && \
    sudo apt-get install -y git curl && \
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim && \
    vim +PluginInstall +qall

# =============== ANDROID SETUP =================

# Install Android Depdendencies
RUN sudo dpkg --add-architecture i386
RUN sudo apt-get update
RUN sudo apt-get install -y libncurses5:i386 libstdc++6:i386 zlib1g:i386
RUN sudo apt-get install -y openjdk-6-jdk

# Install Android SDK
RUN cd /usr/local/ && curl -L -O http://dl.google.com/android/android-sdk_r23.0.2-linux.tgz && tar xf android-sdk_r23.0.2-linux.tgz

# Install Android Tools
RUN echo y | /usr/local/android-sdk-linux/tools/android update sdk --filter tools --no-ui --force -a
RUN echo y | /usr/local/android-sdk-linux/tools/android update sdk --filter platform-tools --no-ui --force -a
RUN echo y | /usr/local/android-sdk-linux/tools/android update sdk --filter android-19 --no-ui --force -a

# Install ANT
RUN cd /usr/local && curl -L -O http://apache.petsads.us//ant/binaries/apache-ant-1.9.4-bin.tar.gz && tar xf apache-ant-1.9.4-bin.tar.gz

# Environment variables
ENV ANDROID_HOME /usr/local/android-sdk-linux
ENV ANT_HOME /usr/local/apache-ant-1.9.4
ENV PATH $PATH:$ANDROID_HOME/tools
ENV PATH $PATH:$ANDROID_HOME/platform-tools
ENV PATH $PATH:$ANT_HOME/bin

# Clean up
RUN rm -rf /usr/local/android*.tgz
RUN rm -rf /usr/local/android*.bz2
RUN rm -rf /usr/local/apache-ant*.tar.gz

# ===============================================

# Start tmux in color mode
CMD ["tmux", "-2"]
