#!/bin/sh
#if test -z "$DBUS_SESSION_BUS_ADDRESS"; then
#  eval `dbus-launch --sh-syntax --exit-with-session`
#fi

#export DESKTOP_SESSION=gnome

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# Xresources
xrdb -load ~/.Xresources

# DPMS, Sleep, Lock
xset dpms 900 900 900
xset s 540 60

# Set default X cursor
xsetroot -cursor_name left_ptr

# Autolock
xss-lock -n "notify-send -i dialog-password 'Lockscreen' 'Locking in 60 seconds'" -l slock &

# Keyring
eval $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# Remap some keyboard keys
~/bin/keys.sh

# Clipboard sync
xcsyncd &

# Notifications
dunst &

#  Launch WM / Compositor / Background / Screen layout
exec bspwm & wmpid=$!
compton --config ~/.config/compton.conf &
nitrogen --restore
autorandr --change

# Flash windows on focus
flashfocus &

# Touchpas gestures
libinput-gestures-setup start &

# Hide mousecursor when not moving
unclutter &

# Start applications
env KEYBASE_START_UI=hideWindow run_keybase &
keepassxc &
nextcloud &
kshare -b &
hipchat4 &

alacritty &

wait $wmpid
