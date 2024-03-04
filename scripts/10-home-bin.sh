#!/usr/bin/env bash
[[ $1 ]] && user="$1" || user=
[[ $user ]] && home="/home/$user" || home=

# Create ~/.local/bin for user. Alternatives are ~/bin or ~/.bin
[[ -d $home ]] && mkdir -m700 -p "$home/.local/bin" && chown -R "$user": "$home/.local"