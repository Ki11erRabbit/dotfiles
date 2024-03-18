#!/bin/sh

device=$1

if [ -z "${device}" ]; then
    echo "Usage: $0 <device>"
    exit 1
fi

for dir in */ ; do
    case $dir in
        .git) continue ;;
    esac
    case $device in 
        laptop) case $dir in
            *desktop*) continue ;;
        esac ;;
        desktop) case $dir in
            *laptop*) continue ;;
        esac
    esac
    echo "Setting up $dir"
    stow "$dir"
done
