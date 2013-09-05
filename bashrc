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

# GPG and SSH agents
eval $(keychain --eval --quiet)

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
