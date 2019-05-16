#!/bin/bash

function install_reqs() {
    # Arch Linux
    if [[ -f $(which pacman 2> /dev/null) ]]; then
        sudo pacman -Sy --noconfirm --needed ansible rsync
    fi
}

ROOT_DIR="$(dirname $0)"

echo "Installing requirements to bootstrap..."
install_reqs

echo "Setting up local dev environment..."
cd "$ROOT_DIR"
ansible-playbook site.yml --ask-become-pass --vault-id @prompt $@ #--verbose #--check
