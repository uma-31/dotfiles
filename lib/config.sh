DOTFILES_ROOT="$(cd "$(dirname "$0")"; cd ..; pwd)"
CONFIG_FILE="$DOTFILES_ROOT/config.xml"

source "$DOTFILES_ROOT/lib/utils.sh"

function get-install-configs() {
  config="$(cat "$CONFIG_FILE" \
    | sed -z 's/[ \r\n]*//g' \
    | get-xml-content 'config')"
  dotfile_configs_common="$(echo "$config" \
    | get-xml-content 'common')"
  dotfile_configs_ubuntu="$(echo "$config" \
    | get-xml-content 'ubuntu')"
  dotfile_configs_wsl_ubuntu="$(echo "$config" \
    | get-xml-content 'wsl-ubuntu')"
  dotfile_configs_mac="$(echo "$config" \
    | get-xml-content 'mac')"

  case "$1" in
    'ubuntu' )
      dotfile_configs="${dotfile_configs_common}${dotfile_configs_ubuntu}"
      ;;
    'wsl-ubuntu' )
      dotfile_configs="${dotfile_configs_common}${dotfile_configs_wsl_ubuntu}"
      ;;
    'mac' )
      dotfile_configs="${dotfile_configs_common}${dotfile_configs_mac}"
      ;;
  esac

  echo "$dotfile_configs" | ugrep -oP '(?<=<dotfile>).*?(?=<\/dotfile>)'
}
