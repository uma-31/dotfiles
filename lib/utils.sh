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
