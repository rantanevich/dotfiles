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

alias gcil='gcloud compute instances list'
alias gcs='gcloud compute ssh'
