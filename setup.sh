#!/bin/bash

set -e

# Install xcode command line tools
echo "Looking for existing xcode installation..."
xcode-select -p > /dev/null
if [[ $? != 0 ]] ; then
  echo "Xcode command line tools not found. Installing..."
  xcode-select --install
fi

# Install homebrew if its not already installed
echo "Looking for existing brew installation..."
which -s brew > /dev/null
if [[ $? != 0 ]] ; then
  echo "Brew not found. Installing..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Brew installation found. Updating..."
  brew update
fi

# Create my standard directories if they don't exist
echo "Creating standard directories"
mkdir -p ~/Projects
mkdir -p ~/Scripts
cd ~/Projects

# Clone the dotfiles repo
echo "Cloning repo"
git clone https://github.com/JCPistell/dotfiles.git
DIR="~/Projects/dotfiles"

# Install brew packages
echo "Installing brew objects"
brew bundle --file=$DIR/Brewfile

# Set up symlinks
echo "Symlinking dotfiles"
mkdir -p ~/.config/nvim

ln -s $DIR/bash_profile ~/.bash_profile
ln -s $DIR/bashrc ~/.bashrc
ln -s $DIR/tmux.conf ~/.tmux.conf
ln -s $DIR/vimrc ~/.vimrc
ln -s $DIR/gitignore_global ~/.gitignore_global
ln -s $DIR/spacemacs ~/.spacemacs
ln -s $DIR/flake8 ~/.config/flake8
ln -s $DIR/init.vim ~/.config/nvim/init.vim

# Set up virtualenvs
echo "Setting up Python virtualenvs"
PY3VERSION=3.7.5
echo "Python3 version: $PY3VERSION"

pyenv install $PY3VERSION
pyenv install 2.7.14
pyenv global $PY3VERSION


pyenv virtualenv 2.7.14 neovim2
pyenv virtualenv $PY3VERSION neovim3

sleep 3
pyenv activate neovim2
pip install neovim
pyenv deactivate

sleep 3
pyenv activate neovim3
pip install neovim
pip install flake8
pip install jedi
pyenv deactivate

# Set up vim
echo "Setting up vim"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +PlugInstall +qall
