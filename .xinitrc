#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Setting own stuff
setxkbmap -layout us -variant altgr-intl
feh --bg-scale /usr/share/backgrounds/arcolinux/glorious-voyage-3840x2160.jpg
# feh --bg-scale /usr/share/backgrounds/arcolinux/sea-of-mystery-3840x2160.jpg
clipmenud &

# GPU play
xrandr --setprovideroutputsource modesetting NVIDIA-0
# xrandr --auto
xrandr --setprovideroutputsource NVIDIA-G0 modesetting
# xrandr --auto
xrandr --output eDP-1-1 --primary --mode 1920x1080 --rate 144.00 --output HDMI-0 --mode 1920x1080 --above eDP-1-1

# Starting Xmonad
# xmobar &
exec xmonad
