#!/usr/bin/env bash
[[ $1 ]] && user="$1" || user=
#[[ $user ]] && home="/home/$user" || home=

# If you want to use sudo without password (NOT RECOMMENDED unless you understand the implications)
#[[ $user ]] && echo -e "${user} ALL = (ALL) NOPASSWD: ALL" > "/etc/sudoers.d/$user" && chmod 0440 "/etc/sudoers.d/$user"

# If you want to use "sudo pacman ..." without password
[[ $user ]] && echo -e "${user} ALL = (root) NOPASSWD: /usr/bin/pacman" > "/etc/sudoers.d/$user" && chmod 0440 "/etc/sudoers.d/$user"

# Always ensure that sudo is ok after messing with sudoers
[[ -e "/etc/sudoers.d/$user" ]] && { visudo -cq || EDITOR=vim visudo "/etc/sudoers.d/$user"; }

# If you want to extend the sudo expire timeout to 20 minutes (default is 5 minutes)
sed -i '0,/^Defaults/s/^Defaults.*/&\nDefaults timestamp_timeout = 20/' /etc/sudoers && { visudo -cq || EDITOR=vim visudo; }