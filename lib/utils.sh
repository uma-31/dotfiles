function error() {
  echo -e "\033[31merror: $1\033[m"
}

function get-xml-content() {
  grep -oP "(?<=<$1>).*(?=<\/$1>)"
}
