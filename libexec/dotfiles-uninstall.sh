#!/usr/bin/env bash

DOTFILES_ROOT="$(cd "$(dirname "$0")"; cd ..; pwd)"

source "$DOTFILES_ROOT/lib/config.sh"
source "$DOTFILES_ROOT/lib/utils.sh"

OS_NAME="$(estimate-os)"

function uninstall() {
  targets=()

   while read config; do
    target="$(echo "$config" | get-xml-content 'target')"
    target="$(eval "echo $target")"

    if [ -L "$target" ]; then
      echo "$target"
      targets=("${targets[@]}" "$target")
    fi
  done < <(get-install-configs "$1")

  if [ ${#targets[@]} = 0 ]; then
    echo 'There is nothing file to delete.'
    exit 0
  fi

  read -p "Are you sure you want to delete these files? [y/N]: " ans

  case "$ans" in
    'y' | 'Y' )
      for target in "${targets[@]}"; do
        rm -f "$target"
      done
      ;;
  esac

  echo 'Finished uninstalling.'
}

case "$OS_NAME" in
  'mac' | 'ubuntu' | 'wsl-ubuntu' )
    uninstall "$OS_NAME"
    ;;
  * )
    error "'$KERNEL' is not supported."
    ;;
esac
