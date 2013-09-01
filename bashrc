# Set PATH
PATH=/usr/local/bin:/usr/local/sbin:$HOME/go/bin:$HOME/.rvm/bin:$PATH

# Exports
export TZ=America/New_York
export LANG=en_US.UTF-8

if [[ -e "$HOME/go" && -e "$HOME/goworkspace" ]]; then
    export GOROOT=$HOME/go
    export GOPATH=$HOME/goworkspace
fi

# Aliases
alias timestamp="date -u +'%Y-%m-%dT%H:%M:%S+00:00'"

# GPG agent
if [[ -f "${HOME}/.gpg-agent-info" ]]; then
    . "${HOME}/.gpg-agent-info" > /dev/null
    export GPG_AGENT_INFO
    export SSH_AUTH_SOCK
    export SSH_AGENT_PID
elif command -v gpg-agent >/dev/null; then
    gpg-agent --quiet --daemon --enable-ssh-support --write-env-file $HOME/.gpg-agent-info 2> /dev/null
    chmod 600 $HOME/.gpg-agent-info
    export GPG_AGENT_INFO
    export SSH_AUTH_SOCK
    export SSH_AGENT_PID
fi

GPG_TTY=$(tty)
export GPG_TTY

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
