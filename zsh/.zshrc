HOMEBREW=$(brew --prefix)

path+=$HOME/.local/bin
path+=$HOME/go/bin

export PAGER=less
export EDITOR=nvim
export VISUAL=nvim
export TERM=xterm-256color
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export XDG_CONFIG_HOME=$HOME/.config
export CLOUDSDK_PYTHON_SITEPACKAGES=true
export USE_GKE_GCLOUD_AUTH_PLUGIN=true

HISTFILE=$HOME/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_CHAR_SYMBOL=❯
SPACESHIP_CHAR_SUFFIX=' '
SPACESHIP_GIT_SYMBOL=''
SPACESHIP_PROMPT_ORDER=(dir git exit_code venv char)
SPACESHIP_PROMPT_ASYNC=false

fpath=("$HOMEBREW/share/zsh/site-functions" $fpath)
for plugin in $ZDOTDIR/plugins/*; do
    fpath=($plugin $fpath)
done

autoload -U +X bashcompinit && bashcompinit
autoload -Uz compinit && compinit
autoload -U promptinit && promptinit

bindkey -e

setopt prompt_subst
setopt auto_cd
setopt no_case_glob
setopt extended_history
setopt share_history
setopt inc_append_history
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_find_no_dups

[ -f $ZDOTDIR/aliases.sh ] && source $ZDOTDIR/aliases.sh
[ -f $ZDOTDIR/functions.sh ] && source $ZDOTDIR/functions.sh

complete -o nospace -C $HOMEBREW/bin/vault vault

source $HOMEBREW/opt/spaceship/spaceship.zsh
source $HOMEBREW/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
