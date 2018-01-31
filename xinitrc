#!/bin/sh

userresources=$HOME/.Xdefaults
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# ctrl+alt+bksp terminates X
setxkbmap -option terminate:ctrl_alt_bksp

# start rxvt-unicode daemon
urxvtd &

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start xbindkeys
xbindkeys

# start window manager
exec spectrwm
