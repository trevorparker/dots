# ZSH things
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="trvr"
DISABLE_AUTO_UPDATE="true"
plugins=(git jump)
source $ZSH/oh-my-zsh.sh

# Set PATH
PATH=$HOME/.rbenv/bin:/usr/local/bin:/usr/local/sbin:$HOME/go/bin:$PATH

# Exports
export TZ=America/New_York
export LANG=en_US.UTF-8

if [[ -e "$HOME/go" ]]; then
    export GOROOT=$HOME/go
fi

if [[ -e "$HOME/goworkspace" ]]; then
    export GOPATH=$HOME/goworkspace
fi

# Aliases
alias timestamp="date -u +'%Y-%m-%dT%H:%M:%S+00:00'"
alias vi='vim'

# ZSH opts
setopt interactivecomments

# Agents
if [[ -f "${HOME}/.agents" ]]; then
    source $HOME/.agents
fi

# Ansible
if [[ -f "${HOME}/ansible_hosts" ]]; then
    export ANSIBLE_HOSTS=$HOME/ansible_hosts
fi

# Colored man pages
# https://wiki.archlinux.org/index.php/Man_Page#Using_less_.28Recommended.29
man() {
    env LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

# added by travis gem
if [[ -f "${HOME}/.travis/travis.sh" ]]; then
    source $HOME/.travis/travis.sh
fi

if [[ $(command -v rbenv) >/dev/null ]]; then
    eval "$(rbenv init -)"
fi

