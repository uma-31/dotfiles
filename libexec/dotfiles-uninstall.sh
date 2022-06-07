#!/usr/bin/env bash

DOTFILES_ROOT="$(cd "$(dirname "$0")"; cd ..; pwd)"
KERNEL="$(uname -s)"

source "$DOTFILES_ROOT/lib/config.sh"
source "$DOTFILES_ROOT/lib/utils.sh"

function uninstall() {
  target_files=''

  for ((i = 0; i < ${#INSTALL_CONFIGS[@]}; i++)); do
    config="${INSTALL_CONFIGS[$i]}"
    dotfile_path="$(echo "$config" | get-xml-content 'path')"

    if [ -L "$dotfile_path" ]; then
      echo "$dotfile_path"
      target_files="$target_files $dotfile_path"
    fi
  done

  if [ "$target_files" = '' ]; then
    echo 'There is nothing file to delete.'
    exit 0
  fi

  uninstall_list=($target_files)

  read -p "Are you sure you want to delete these files? [y/N]: " ans

  case "$ans" in
    'y' | 'Y' )
      for file_path in "${uninstall_list[@]}"; do
        rm -f "$file_path"
      done
      ;;
  esac

  echo 'Finished uninstalling.'
}

case "$KERNEL" in
  'Linux' | 'Darwin' )
    uninstall
    ;;
  * )
    error "'$KERNEL' is not supported."
    ;;
esac
