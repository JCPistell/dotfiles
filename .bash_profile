# bump the history size
HISTFILESIZE=1000000

# set aliases
alias ll='ls -lh'
alias grep='grep --color=auto'
alias gh='history | grep'
alias vi='vim'

# set color options
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# set vim mode
set -o vi
bind -m vi-insert "\C-l":clear-screen

# parse git branch using git_ps1 and set prompt

green=$(tput setaf 2)
blue=$(tput setaf 4)
yellow=$(tput setaf 3)
cyan=$(tput setaf 6)
reset=$(tput sgr0)

if [ -f $(brew --prefix)/etc/bash_completion ]; then
source $(brew --prefix)/etc/bash_completion
source $(brew --prefix)/etc/bash_completion.d/git-completion.bash
source $(brew --prefix)/etc/bash_completion.d/git-prompt.sh
fi

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWUNTRACKEDFILES=1

PROMPT_COMMAND='__git_ps1 "\[$green\]\u@\h\[$reset\] \[$blue\]\w\[$reset\] " "\n\[$cyan\]$\[$reset\] " "\[$yellow\][\[$reset\]%s\[$yellow\]]\[\$reset\]"'

# setting python and go env variables and path profiles
export PATH=/usr/local/bin:/usr/local/sbin:/$HOME/bin:/usr/local/opt/python/libexec/bin:$PATH
export GOPATH=$HOME/Projects/golang
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:/usr/local/opt/go/libexec/bin

# added by Snowflake SnowSQL installer v1.0
export PATH=/Applications/SnowSQL.app/Contents/MacOS:$PATH

if [ -f $HOME/.bashrc ]; then
        source $HOME/.bashrc
fi
