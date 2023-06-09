#!/bin/bash

CLONE_DIST="$HOME/bisquit"

git clone https://github.com/bisquit/bisquit.git ${CLONE_DIST}

DOTFILES_ROOT="${CLONE_DIST}/dotfiles"

link_file () {
  local src=$1 dist=$2

  if [ -e "$dist" ]; then
    mv "$dist" "${dist}.backup"
    echo "backup $dist as ${dist}.backup"
  fi

  ln -s "$src" "$dist"
  echo "symlink created $src => $dist"
}

link_file "${DOTFILES_ROOT}/git/.gitconfig" "$HOME/.gitconfig"
link_file "${DOTFILES_ROOT}/git/.tigrc" "$HOME/.tigrc"

brew install tig
