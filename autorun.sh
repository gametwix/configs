#!/usr/bin/env bash

## run (only once) processes which spawn with the same name
function run {
   if (command -v $1 && ! pgrep $1); then
     $@&
   fi
}

## run (only once) processes which spawn with different name
if (command -v gnome-keyring-daemon && ! pgrep gnome-keyring-d); then
    gnome-keyring-daemon --daemonize --login &
fi
if (command -v start-pulseaudio-x11 && ! pgrep pulseaudio); then
    start-pulseaudio-x11 &
fi
if (command -v /usr/lib/mate-polkit/polkit-mate-authentication-agent-1 && ! pgrep polkit-mate-aut) ; then
    /usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
fi
if (command -v  xfce4-power-manager && ! pgrep xfce4-power-man) ; then
    xfce4-power-manager &
fi
# System-config-printer-applet is not installed in minimal edition
if (command -v system-config-printer-applet && ! pgrep applet.py ); then
  system-config-printer-applet &
fi

#run xfsettingsd
run nm-applet
#run compton --shadow-exclude '!focused'
run thunar --daemon
run pamac-tray
# blueman-applet and msm_notifier are not installed in minimal edition
run blueman-applet
run msm_notifier
run udiskie
run telegram-desktop
run discord
run code
run google-chrome-stable


setxkbmap -option grp:alt_shift_toggle -layout us,ru &