#!/bin/zsh

commit_msg() {
    if [ -z $1 ]; then
        echo "Enter commit message: "
        read c
    else
        c=$1
    fi
    git commit -m "${c}" -m '(੭｡╹▿╹｡)੭c[_]--K4W4--★'
}

alias gcm=commit_msg
