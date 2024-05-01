# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

HOMEBREW=$(brew --prefix)

path+=$HOME/.local/bin
path+=$HOME/go/bin
path+=$HOME/Library/Python/3.11/bin
path+=$HOMEBREW/opt/openjdk/bin

export PAGER=less
export EDITOR=nvim
export VISUAL=nvim
export TERM=xterm-256color
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export XDG_CONFIG_HOME=$HOME/.config
export CLOUDSDK_PYTHON_SITEPACKAGES=true
export USE_GKE_GCLOUD_AUTH_PLUGIN=true
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=true
export KUBECONFIG=$HOME/.kube/config:$(find ~/.kube/config.d -type f -maxdepth 1 | tr '\n' ':')

if [[ -f $ZDOTDIR/.secrets ]]; then
    export $(cat $ZDOTDIR/.secrets | xargs)
fi

HISTFILE=$HOME/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

fpath=("$HOMEBREW/share/zsh/site-functions" $fpath)
for plugin in $ZDOTDIR/plugins/*; do
    fpath=($plugin $fpath)
done

autoload -U +X bashcompinit && bashcompinit
autoload -Uz compinit && compinit
autoload -U promptinit && promptinit

bindkey -e
bindkey "\E[1~" beginning-of-line
bindkey "\E[4~" end-of-line

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
complete -o nospace -C /opt/homebrew/bin/nomad nomad

source $HOMEBREW/opt/powerlevel10k/share/powerlevel10k/powerlevel10k.zsh-theme
source $HOMEBREW/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
