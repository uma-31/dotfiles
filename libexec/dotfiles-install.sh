#!/usr/bin/env bash

DOTFILES_ROOT="$(cd "$(dirname "$(realpath "$0")")"; cd ..; pwd)"
KERNEL="$(uname -s)"

source "$DOTFILES_ROOT/lib/config.sh"
source "$DOTFILES_ROOT/lib/utils.sh"

function install() {
  for ((i = 0; i < ${#INSTALL_CONFIGS[@]}; i++)); do
    config="${INSTALL_CONFIGS[$i]}"

    target_file="$(echo "$config" | get-xml-content 'file')"
    target_path="$(echo "$config" | get-xml-content 'path')"

    cd "$(dirname "$target_path")"

    if [ -L "$target_path" ]; then
      echo "skip: $(basename "$target_path") is already exists."
    else
      ln -s "$DOTFILES_ROOT/dotfiles/$target_file" "$(basename "$target_path")"
      echo "install: $(basename "$target_path")"
    fi
  done
}

case "$KERNEL" in
  'Linux' | 'Darwin' )
    install
    ;;
  * )
    error "'$KERNEL' is not supported."
    ;;
esac
