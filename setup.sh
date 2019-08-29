#!/bin/bash

# Install xcode command line tools
xcode-select -p > /dev/null
if [[ $? != 0 ]] ; then
  xcode-select --install
fi

# Install homebrew if its not already installed
which -s brew > /dev/null
if [[ $? != 0 ]] ; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  brew update
fi

# Install brew packages

brew bundle

# Set up symlinks
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

ln -s $DIR/bashrc ~/.bashrc
ln -s $DIR/tmux.conf ~/.tmux.conf
ln -s $DIR/vimrc ~/.vimrc
ln -s $DIR/gitignore_global ~/.gitignore_global
ln -s $Dir/spacemacs ~/.spacemacs

# Set up vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# install base python packages
pip install virtualenv
pip install virtualenvwrapper
pip install flake8
