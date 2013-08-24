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
if [[ -d "$DIR/os/$UNAME" ]]; then
    for f in `ls -1 $DIR/os/$UNAME/`; do
        if [[ -e "$DIR/os/$UNAME/$f" && "$f" != "$ME" && "$f" != "README.md" ]]; then
            echo "Linking ~/.$f -> $DIR/os/$UNAME/$f"
            ln -sfn $DIR/os/$UNAME/$f ~/.$f
        fi
    done
fi

for f in `ls -1 $DIR/`; do
    if [[ -e "$DIR/$f" && "$f" != "$ME" && "$f" != "os" && "$f" != "README.md" ]]; then
        echo "Linking ~/.$f -> $DIR/$f"
        ln -sfn $DIR/$f ~/.$f
    fi
done
