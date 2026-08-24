dotenv() {
  export $(grep -v '^#' $1 | xargs)
}

claude-personal() {
  CLAUDE_CONFIG_DIR="$HOME/.config/claude/personal" \
  http_proxy="http://192.168.8.8:8080" \
  https_proxy="http://192.168.8.8:8080" \
  command claude "$@"
}

claude-work() {
  CLAUDE_CONFIG_DIR="$HOME/.config/claude/work" \
  http_proxy="http://192.168.8.8:8080" \
  https_proxy="http://192.168.8.8:8080" \
  command claude "$@"
}
