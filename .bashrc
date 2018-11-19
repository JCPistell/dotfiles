# bump the history size
HISTFILESIZE=1000000

# set aliases
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
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
if [ -f $(brew --prefix)/etc/bash_completion ]; then
source $(brew --prefix)/etc/bash_completion
source $(brew --prefix)/etc/bash_completion.d/git-completion.bash
source $(brew --prefix)/etc/bash_completion.d/git-prompt.sh
fi

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWUNTRACKEDFILES=1

PROMPT_COMMAND='__git_ps1 "\[\033[0;32m\]\u@\h\[\033[0m\] \[\033[0;34m\]\w\[\033[0m\] " "\n\[\033[0;36m\]$\[\033[0m\] " "\[\033[0;33m\][\[\033[0m\]%s\[\033[0;33m\]]\[\033[0m\]"'

# setting python and go env variables and path profiles
export PATH=/usr/local/bin:/usr/local/sbin:/$HOME/bin:/usr/local/opt/python/libexec/bin:$PATH
export GOPATH=$HOME/Projects/golang
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:/usr/local/opt/go/libexec/bin

# added by Snowflake SnowSQL installer v1.0
export PATH=/Applications/SnowSQL.app/Contents/MacOS:$PATH
