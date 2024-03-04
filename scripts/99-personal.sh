#!/usr/bin/env bash
[[ $1 ]] && user="$1" || user=
[[ $user ]] && home="/home/$user" || home=

# The following settings are only for the specified user
if [[ $user == taffa ]]; then

    # Personal mpv settings
    mpv_conf="$home/.config/mpv/mpv.conf"
    if [[ -n "$home" && ! -d "$(dirname "$mpv_conf")" ]]; then
        mkdir -p "$(dirname "$mpv_conf")"
        echo \
"# See: https://mpv.io/manual/master/

cache=yes
cache-pause=no
cache-secs=60

hwdec=auto
vo=gpu
#gpu-context=x11egl
#gpu-context=wayland
ao=pipewire
# If on wayland, try: (not working in GNOME)
#vo=dmabuf-wayland

scale=ewa_lanczossharp
cscale=ewa_lanczossharp

sub-auto=fuzzy
slang=fi,fin
sub-scale-with-window=no
sub-pos=99
sub-fix-timing=yes" > "$mpv_conf"
    fi

    # Add line "#Usage = Sync Search" to all *-testing repos in /etc/pacman.conf
    sed -i '/#\[.*-testing/,/^$/s/^$/#Usage = Sync Search\n&/' /etc/pacman.conf
    # set localtime
    ln -sf /usr/share/zoneinfo/Europe/Helsinki /etc/localtime
    # set consolefont
    systemd-detect-virt -q && echo "FONT=ter-122b" >> /etc/vconsole.conf || echo "FONT=ter-128b" >> /etc/vconsole.conf
    echo "FONT_MAP=8859-15" >> /etc/vconsole.conf
    systemctl -q restart systemd-vconsole-setup.service

fi

# Leave everything root has created in the home of user in his/her ownership
[[ -n $user && -d "$home/.config" ]] && chown -R "$user": "$home/.config"