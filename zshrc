# ZSH things
export ZSH_CUSTOM=$HOME/.oh-my-zsh-custom

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="trvr"
DISABLE_AUTO_UPDATE="true"
plugins=(git jump)
source $ZSH/oh-my-zsh.sh

# Set PATH
if [[ -e "/usr/local/texline/2015basic/bin/universal-darwin" ]]; then
    PATH=/usr/local/texlive/2015basic/bin/universal-darwin:$PATH
fi

if [[ -e "$HOME/go" ]]; then
    export GOROOT=$HOME/go
fi

if [[ -e "$HOME/goworkspace" ]]; then
    export GOPATH=$HOME/goworkspace
fi

PATH=$HOME/bin:$HOME/bin/homebrew/bin:$HOME/.rbenv/bin:$HOME/.composer/vendor/bin:/usr/local/bin:/usr/local/sbin:$PATH
PATH=$HOME/.local/bin/:$PATH
PATH=$PATH:$HOME/.cargo/bin/
PATH=$PATH:$HOME/goworkspace/bin
PATH=$PATH:/opt/miniconda3/bin

# Exports
export TZ=America/New_York
export LANG=en_US.UTF-8
export EDITOR="vim"
export GROOVY_HOME=/usr/local/opt/groovy/libexec
export LIBRARY_PATH="$LIBRARY_PATH:$HOME/bin/homebrew/lib/"

# Ansible
if [[ -f "${HOME}/ansible_hosts" ]]; then
    export ANSIBLE_HOSTS=$HOME/ansible_hosts
fi

# Aliases
alias timestamp="date -u +'%Y-%m-%dT%H:%M:%S+00:00'"
alias vi='vim'
alias python=$HOME/bin/homebrew/bin/python3
alias pip=$HOME/bin/homebrew/bin/pip3
unalias gm

# ZSH opts
setopt interactivecomments

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

if [[ -f "${HOME}/.zsh_tokens" ]]; then
    source $HOME/.zsh_tokens
fi

if [[ $(command -v rbenv) >/dev/null ]]; then
    eval "$(rbenv init -)"
fi

if [[ $(command -v pyenv) >/dev/null ]]; then
    eval "$(pyenv init -)"
    export PYENV_ROOT=/usr/local/opt/pyenv
fi

if [[ -f "/usr/local/bin/virtualenvwrapper.sh" ]]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi
