#! /bin/bash

#If the vim version isn't high enough on Ubuntu for YCM:

sudo apt install -y vim-youcompleteme exuberant-ctags python3-pip
vim-addon-manager install youcompleteme

sudo pip3 install black flake8 

# Other options:

# sudo add-apt-repository ppa:jonathonf/vim
# sudo apt update
# sudo apt install vim

# If the gcc version isn't high enough:

# sudo apt-get install gcc-8 g++-8
# CXX=/usr/bin/gcc-8 ./install.py --all

