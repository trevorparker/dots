# Set PATH
PATH=$HOME/bin:$HOME/.rbenv/bin:$HOME/.composer/vendor/bin:/usr/local/bin:/usr/local/sbin:$HOME/go/bin:$PATH

# Exports
export TZ=America/New_York
export LANG=en_US.UTF-8
export EDITOR="vim"
export GROOVY_HOME=/usr/local/opt/groovy/libexec

if [[ -e "$HOME/go" ]]; then
    export GOROOT=$HOME/go
fi

if [[ -e "$HOME/goworkspace" ]]; then
    export GOPATH=$HOME/goworkspace
fi

# Aliases
alias timestamp="date -u +'%Y-%m-%dT%H:%M:%S+00:00'"
alias vi='vim'

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


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
