function estimate-os() {
  KERNEL="$(uname -s)"

  if [ "$KERNEL" = 'Linux' ]; then
    if [ -v 'WSL_DISTRO_NAME' ]; then
      os_name='wsl-'
    else
      os_name=''
    fi

    if [ -f /etc/os-release ]; then
      source /etc/os-release

      os_name="${os_name}${NAME,,}"
    else
      os_name="${os_name}unknown"
    fi

    echo "$os_name"
  elif [ "$KERNEL" = 'Darwin' ]; then
    echo 'mac'
  else
    echo 'unknown'
  fi
}

function error() {
  echo -e "\033[31merror: $1\033[m"
}

function ugrep() {
  case "$(uname -s)" in
    'Darwin' )
      ggrep "$@"
      ;;
    * )
      grep "$@"
      ;;
  esac
}

function get-xml-content() {
  ugrep -oP "(?<=<$1>).*(?=<\/$1>)"
}
