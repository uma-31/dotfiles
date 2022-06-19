#!/usr/bin/env bash

DOTFILES_ROOT="$(cd "$(dirname "$(realpath "$0")")"; cd ..; pwd)"

source "$DOTFILES_ROOT/lib/config.sh"
source "$DOTFILES_ROOT/lib/utils.sh"

OS_NAME="$(estimate-os)"

function install() {
  get-install-configs "$1" | while read config; do
    entity="$DOTFILES_ROOT/dotfiles/$(echo "$config" | get-xml-content 'entity')"
    target="$(echo "$config" | get-xml-content 'target')"
    target="$(eval "echo $target")"

    cd "$(dirname "$target")"

    if [ -f "$target" ]; then
      echo "skip: '$target' is already exists."
    elif [ -L "$target" ]; then
      echo "skip: '$target' is already installed."
    else
      ln -s "$entity" "$(basename "$target")"
      echo "install: '$(basename "$entity")' to '$target'"
    fi
  done
}

case "$OS_NAME" in
  'mac' | 'ubuntu' | 'wsl-ubuntu' )
    install "$OS_NAME"
    ;;
  * )
    error "Unsupported OS: '$OS_NAME'"
    ;;
esac
