#!/bin/bash

function install_reqs() {
    # Arch Linux
    if [[ -f $(which pacman 2> /dev/null) ]]; then
        sudo pacman -Sy --noconfirm --needed ansible rsync
    fi
}

ROOT_DIR="$( cd "$(dirname "$0")" ; pwd -P )"
# GOAL_DIR="/dotfiles"

# # Ensure ansible is being run from a pre-established directory
# # If it is not move itself then run bootstrap from the new location
# if [[ $ROOT_DIR != $GOAL_DIR ]]; then
#     if [[ ! -d $GOAL_DIR ]]; then
#         mkdir -p $GOAL_DIR
#     fi

#     for x in $ROOT_DIR/* $ROOT_DIR/.[!.]* $ROOT_DIR/..?*; do
#         if [ -e "$x" ]; then mv -- "$x" $GOAL_DIR; fi
#     done

#     trap "sh $GOAL_DIR/bootstrap.sh;rm -r $ROOT_DIR;" EXIT
#     exit
# fi

echo "Installing requirements to bootstrap..."
install_reqs

echo "Setting up local dev environment..."
cd "$ROOT_DIR"
ansible-playbook site.yml --ask-become-pass --vault-id @prompt $@ #--verbose #--check
