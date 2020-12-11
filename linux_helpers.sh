#! /bin/bash

#If the vim version isn't high enough on Ubuntu for YCM:

sudo apt install -y vim-youcompleteme exuberant-ctags python3-pip
vim-addon-manager install youcompleteme

sudo pip3 install black flake8 

##
## Newer linux
sudo apt install build-essential cmake vim-nox python3-dev exuberant-ctags
sudo apt install mono-complete golang nodejs default-jdk npm
#cd folder with youcompleteme
python3 install.py --all

# Other options:

# sudo add-apt-repository ppa:jonathonf/vim
# sudo apt update
# sudo apt install vim

# If the gcc version isn't high enough:

# sudo apt-get install gcc-8 g++-8
# CXX=/usr/bin/gcc-8 ./install.py --all


#configure tmux:
echo 'alias dev="bash ~/.vim/tmux_session.sh"' >> ~/.bashrc 
