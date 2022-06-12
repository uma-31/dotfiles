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

# This function works only in WSL.
function get-windows-home() {
  WINDOWS_USER_NAME="$(powershell.exe '$env:UserName' | sed -e 's/\r//')"

  for c in {a..z}; do
    windows_home_candidate="/mnt/$c/Users/$WINDOWS_USER_NAME"

    if [ -e "$windows_home_candidate" ]; then
      echo "$windows_home_candidate"
      return 0
    fi
  done

  return 1
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
