#!/bin/bash
set -euox pipefail

BREW_FORMULAS=(
    argocd
    docker
    docker-buildx
    docker-completion
    docker-compose
    go
    grep
    helm
    jq
    k9s
    kind
    kubernetes-cli
    neovim
    romkatv/powerlevel10k/powerlevel10k
    pre-commit
    rsync
    skopeo
    tfenv
    tmux
    tree
    yq 
)
BREW_CASKS=(
    alacritty
    google-cloud-sdk
    slack
    spotify
    telegram
    visual-studio-code
)

if ! command -v brew &> /dev/null; then
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    export PATH=/opt/homebrew/bin:/opt/homebrew/sbin:$PATH
fi

brew install ${BREW_FORMULAS[@]}
brew install --cask ${BREW_CASKS[@]}

# poetry
curl -sSL https://install.python-poetry.org | sed 's/symlinks=False/symlinks=True/' | python3 -

