#!/bin/sh

ROOT_DIR="$(dirname $0)/.."
CACHE_DIR="$ROOT_DIR/.cache"

echo "Fetching required ansible plugins..."
if [[ -d "$CACHE_DIR/aur" ]]; then
    git -C "$CACHE_DIR/aur" pull
    cp "$CACHE_DIR/aur/aur.py" "$ROOT_DIR/library/aur.py"
else
    git clone https://github.com/kewlfft/ansible-aur.git "$CACHE_DIR/aur"
    cp "$CACHE_DIR/aur/aur.py" "$ROOT_DIR/library/aur.py"
fi

if [[ -d "$CACHE_DIR/ansible-role-visual-studio-code" ]]; then
    git -C "$CACHE_DIR/ansible-role-visual-studio-code" pull
    cp "$CACHE_DIR/ansible-role-visual-studio-code/library/visual_studio_code_install_extension.py" "$ROOT_DIR/library/vscode_extensions.py"
else
    git clone https://github.com/gantsign/ansible-role-visual-studio-code.git "$CACHE_DIR/ansible-role-visual-studio-code"
    cp "$CACHE_DIR/ansible-role-visual-studio-code/library/visual_studio_code_install_extension.py" "$ROOT_DIR/library/vscode_extensions.py"
fi
