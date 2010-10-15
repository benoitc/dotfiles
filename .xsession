#!/bin/sh
export ENV=$HOME/.kshrc

xsetroot -solid "#303030" &

#launch dbus
if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
    eval `/usr/local/bin/dbus-launch --sh-syntax --exit-with-session`
fi
#notification daemon
/usr/local/libexec/notification-daemon &

# set my keybord
#xmodmap /home/benoitc/.xmodmap &

/usr/local/bin/synergyc 192.168.1.3 &


#xrandr --output DVI-0 --mode 1680x1050 --right-of VGA-0 &

#need a clock
xclock -geometry 185x30-0+0 &

# Don't launch aucat & mpd twice when we
# relaunch X
aucat_socket=/tmp/aucat.sock
mpd_pid=/home/benoitc/.mpd.pid
if [ ! -a "$aucat_socket" ]; then
   /usr/bin/aucat -b 8192 -l &
fi
    
#finally launch window manager
#exec scrotwm

if [ -x $HOME/.gammapagerc ]; then
    $HOME/.gammapagerc   #monitor calibration
fi # end gammapage

exec cwm 
