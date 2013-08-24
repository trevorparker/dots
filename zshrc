ZSH=$HOME/.oh-my-zsh
ZSH_THEME="trvr"
DISABLE_AUTO_UPDATE="true"
plugins=(git)
source $ZSH/oh-my-zsh.sh

GPG_TTY=$(tty)
export GPG_TTY

if [ -f "${HOME}/.gpg-agent-info" ]; then
    GPG_AGENT_INFO=`cat $HOME/.gpg-agent-info`
    export GPG_AGENT_INFO
else
    eval `gpg-agent --daemon`
    echo $GPG_AGENT_INFO >$HOME/.gpg-agent-info
fi

PATH=$PATH:/usr/local/bin:/usr/local/share/python/:$HOME/go/bin:$HOME/.rvm/bin

export TZ=America/New_York
export LANG=en_US.UTF-8
export GOROOT=/Users/tparker/go
export GOPATH=/Users/tparker/goworkspace

alias man="TERMINFO=~/.terminfo/ LESS=C TERM=mostlike PAGER=less man"
alias timestamp="date -u +'%Y-%m-%dT%H:%M:%S+00:00'"

# added by travis gem
if [[ -f /Users/tparker/.travis/travis.sh ]]; then
    source /Users/tparker/.travis/travis.sh
fi
