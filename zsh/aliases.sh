alias ll='ls -lAh'
alias grep='grep --color=auto --exclude-dir={.git,.svn}'
alias df='df -h'
alias k='kubectl'
alias g=git
alias config='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias vi=nvim
alias vim=nvim
alias h=history
alias hsi='history | grep -i'
alias ports='netstat -anvp tcp | awk "NR<3 || /LISTEN/"'

alias t='tmux attach || tmux new-session'

alias gcil='gcloud compute instances list'
alias gcs='gcloud compute ssh'

alias proxyon='export http_proxy=http://127.0.0.1:1080 && export https_proxy=$http_proxy'
alias proxyoff='unset http_proxy https_proxy'

