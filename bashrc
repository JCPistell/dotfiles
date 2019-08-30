# bump the history size
HISTFILESIZE=1000000

# set aliases
alias ll='ls -lh'
alias grep='grep --color=auto'
alias gh='history | grep'
alias vi='nvim'
alias vim='nvim'

# set color options
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# set vim mode
set -o vi
bind -m vi-insert "\C-l":clear-screen

# parse git branch using git_ps1 and set prompt
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

add_venv_info () {
    if [ -z "$VIRTUAL_ENV_DISABLE_PROMPT" ] ; then
        VIRT_ENV_TXT=""
        if [ "x" != x ] ; then
            VIRT_ENV_TXT=""
        else
            if [ "`basename \"$VIRTUAL_ENV\"`" = "__" ] ; then
                # special case for Aspen magic directories
                # see http://www.zetadev.com/software/aspen/
                VIRT_ENV_TXT="[`basename \`dirname \"$VIRTUAL_ENV\"\``]"
            elif [ "$VIRTUAL_ENV" != "" ]; then
                VIRT_ENV_TXT="(`basename \"$VIRTUAL_ENV\"`)"
            fi
        fi
        if [ "${VIRT_ENV_TXT}" != "" ]; then
           echo ${VIRT_ENV_TXT}" "
        fi
    fi
}

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

PROMPT_COMMAND='__git_ps1 "\[$green\]\u@\h\[$reset\] \[$blue\]\w\[$reset\] " "\n$(add_venv_info)\[$cyan\]$\[$reset\] " "\[$yellow\][\[$reset\]%s\[$yellow\]]\[\$reset\]"'

# setting up pyenv
export PYENV_ROOT=$HOME/.pyenv

# setting python and go env variables and path profiles
export PATH=/usr/local/bin:/usr/local/sbin:$HOME/bin:$PATH
export PATH=$PYENV_ROOT/bin:$PATH
export GOPATH=$HOME/Projects/golang
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Projects
export JAVA_HOME=$(/usr/libexec/java_home)
export HOMEBREW_EDITOR=vim

# adding latex path
export PATH=/usr/local/texlive/2019basic/bin/x86_64-darwin:$PATH

# added by Snowflake SnowSQL installer v1.0
export PATH=/Applications/SnowSQL.app/Contents/MacOS:$PATH

# initializing pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
