#!/usr/bin/env bash

# http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in
SOURCE="${BASH_SOURCE[0]}"
while [[ -h "$SOURCE" ]]; do
    DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

ME=`basename $0`
UNAME="$(uname)"
HOSTNAME="$(hostname)"

function bootstrap_dir {
    local dir=$1
    local filter_string=$2

    local filter=$(ls -1 ${dir})

    if [[ -n $filter_string ]]; then
        filter=$(ls -1 ${dir} | /usr/bin/grep -vE ${filter_string})
    fi
    for f in $filter; do
        if [[ "$f" != "$ME" && "$f" != "README.md" ]]; then
            echo "Linking ~/.$f -> $dir/$f"
            ln -sfn $dir/$f ~/.$f
        fi
    done
}

bootstrap_dir $DIR ^h?ost?$

# OS-specific configs
if [[ -d "$DIR/os/$UNAME" ]]; then
    bootstrap_dir $DIR/os/$UNAME
fi

# Host-specific configs
if [[ -d "$DIR/host/$HOSTNAME" ]]; then
    bootstrap_dir $DIR/host/$HOSTNAME
fi

