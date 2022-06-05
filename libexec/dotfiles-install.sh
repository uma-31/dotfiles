DOTFILES_ROOT="$(cd "$(dirname "$0")"; cd ..; pwd)"
KERNEL="$(uname -s)"

source "$DOTFILES_ROOT/lib/config.sh"
source "$DOTFILES_ROOT/lib/utils.sh"

function install-to-linux() {
  for ((i = 0; i < ${#INSTALL_CONFIGS[@]}; i++)); do
    config="${INSTALL_CONFIGS[$i]}"

    target_file="$(echo "$config" | get-xml-content 'file')"
    target_path="$(echo "$config" | get-xml-content 'path')"

    cd "$(dirname "$target_path")"
    ln -s "$DOTFILES_ROOT/dotfiles/$target_file" "$(basename "$target_path")"
  done
}

case "$KERNEL" in
  'Linux' )
    install-to-linux
    ;;
  * )
    error "'$KERNEL' is not supported."
    ;;
esac
