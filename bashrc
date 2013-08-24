
PATH=$PATH:/usr/local/bin:/usr/local/share/python/:$HOME/go/bin:$HOME/.rvm/bin

# added by travis gem
if [[ -f /Users/tparker/.travis/travis.sh ]]; then
    source /Users/tparker/.travis/travis.sh
fi
