#!/bin/sh

mkdir -p $HOME/.config/kak/autoload/
mkdir -p $HOME/.config/kak/bundle/
git clone https://codeberg.org/jdugan6240/kak-bundle $HOME/.config/kak/bundle/kak-bundle

stow kakoune
#mkdir -p "$HOME/kak/autoload"
ln -s "$(nix-store -r $(which kak) 2> /dev/null)/share/kak/autoload" "$HOME/.config/kak/autoload/default"
ln -s "usr/share/kak/autoload" "$HOME/.config/kak/autoload/default"
