#!/bin/bash

#--------------------------------------

# install tools

TMPDIR=$(mktemp -d)
CURRENT=$PWD
cd $TMPDIR

# tig
git clone https://github.com/jonas/tig.git
cd tig
make
make install
cd ..

# starship
curl -sS https://starship.rs/install.sh | sh

cd $CURRENT
rm -rf $TMPDIR

#--------------------------------------

# dotfiles

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

# git
link_file "${DOTFILES_ROOT}/git/.gitconfig" "$HOME/.gitconfig"
link_file "${DOTFILES_ROOT}/git/.tigrc" "$HOME/.tigrc"

# fish
mkdir -p "$HOME/.config/fish/functions"
link_file "${DOTFILES_ROOT}/fish/config.fish "$HOME/.config/fish/config.fish"
