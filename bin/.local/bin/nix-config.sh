#!/bin/sh

items="system
hardware
home"



item=$(echo "$items" | bemenu -pfi "NixOS Config")


case $item in
    system) neovide /etc/nixos/configuration.nix;;
    hardware) neovide /etc/nixos/hardware-configuration.nix;;
    home) neovide /home/ki11errabbit/.config/home-manager/home.nix;;
    *) exit 1;;
esac




