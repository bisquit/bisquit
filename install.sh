#!/bin/bash

CLONE_DIST="$HOME/dotfiles"

git clone https://github.com/bisquit/bisquit.git ${CLONE_DIST}

DOTFILES_ROOT="${CLONE_DIST}/dotfiles"

ln -s ${DOTFILES_ROOT}/git/.gitconfig ~/.gitconfig
