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
mkdir -p ~/.config/nvim

ln -s $DIR/bashrc ~/.bashrc
ln -s $DIR/tmux.conf ~/.tmux.conf
ln -s $DIR/vimrc ~/.vimrc
ln -s $DIR/gitignore_global ~/.gitignore_global
ln -s $DIR/spacemacs ~/.spacemacs
ln -s $DIR/flake8 ~/.config/flake8
ln -s $DIR/init.vim ~/.config/nvim/init.vim

# Set up virtualenvs

pyenv install 3.7.4
pyenv install 2.7.14
pyenv global 3.7.4
pyenv virtualenv 2.7.14 neovim2
pyenv virtualenv 3.7.4 neovim3
pyenv activate neovim2
pip install neovim
pyenv activate neovim3
pip install neovim
pip install flake8
pip install jedi
pyenv deactivate


# Set up vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +PlugInstall +qall
