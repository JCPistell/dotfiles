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

brew tap homebrew/cask-fonts
brew cask install java

brew install asciinema awscli bash-completion git go kubernetes-cli node openssl pandoc parquet-tools perl postgresql python r ruby sbt scala sqlite tmux tree unixodbc vim watch
brew cask install docker dropbox font-source-code-pro google-cloud-sdk iterm2 mactex minikube snowflake-snowsql spectacle spotify steam sublime-text transmission virtualbox vagrant vlc


# Set up symlinks
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

ln -s $DIR/.bash_profile ~/.bash_profile
ln -s $DIR/.tmux.conf ~/.tmux.conf
ln -s $DIR/.vimrc ~/.vimrc
ln -s $DIR/.gitignore_global ~/.gitignore_global

# Set up vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
