#!/bin/sh


for dir in */ ; do
    case $dir in
        .git) continue ;;
    esac
    echo "Setting up $dir"
    stow "$dir"
done


