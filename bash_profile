if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

# Enable vi mode
set -o vi

# Prompt
PS1="[\w] $ "

if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
    GIT_PROMPT_ONLY_IN_REPO=1
    GIT_PROMPT_THEME=Custom
fi

if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
    . "$(brew --prefix)/etc/bash_completion"
fi

# aliases
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias grep='grep --color=auto'
alias ctags='$(brew --prefix)/bin/ctags'
alias p4merge='/Applications/p4merge.app/Contents/MacOS/p4merge'

# Exports
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

export VISUAL=mvim
export EDITOR="$VISUAL"

export GREP_OPTIONS='--color=auto --exclude=*.pyc --exclude-dir=.git'

# pip should only run if there is a virtualenv currently activated
#export PIP_REQUIRE_VIRTUALENV=true

# virtualenv
export WORKON_HOME=~/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# Docker
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.100:2376"
export DOCKER_CERT_PATH="/Users/nathanphetteplace/.docker/machine/machines/default"
export DOCKER_MACHINE_NAME="default"

# Extract most known archives with one command
extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}
