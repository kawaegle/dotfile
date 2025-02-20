#!/bin/zsh

commit_msg() {
    echo "Enter commit message: "
    read c
    git commit -m "${c}" -m '(੭｡╹▿╹｡)੭--K4W4--★'
}

alias gcm=commit_msg
