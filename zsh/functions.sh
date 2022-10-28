keff() {
  command knife environment from file "$@"
}

knff() {
  command knife node from file "$@"
}

kcu() {
  command knife cookbook upload "$@" --cookbook-path cookbooks
}

kdbe() {
  command knife data bag edit "$@" --local-mode --secret-file=$HOME/.chef/encrypted_data_bag_secret
}

kdbs() {
  command knife data bag show "$@" --local-mode --format=json
}

kdbff() {
  command knife data bag from file "$@"
}

dotenv() {
  export $(grep -v '^#' $1 | xargs)
}
