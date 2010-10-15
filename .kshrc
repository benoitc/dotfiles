#sh/ksh initialization

HISTSIZE=100
HISTFILE=.ksh_history
export HISTSIZE HISTFILE

PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games:/usr/local/jdk-1.6.0/bin:.
TERM=xterm-color
#PS1="$ "
EDITOR=vim
BROWSER=firefox
LC_CTYPE=fr_FR.ISO8859-15
PKG_PATH=ftp://ftp.fr.openbsd.org/pub/OpenBSD/snapshots/packages/amd64
LD_LIBRARY_PATH=/usr/local/lib:/usr/X11R6/lib:/usr/lib:/lib
export PATH TERM PS1 EDITOR BROWSER LC_CTYPE LD_LIBRARY_PATH PKG_PATH

set -o emacs
umask 022
ulimit -c unlimited

alias ls="colorls -G"
alias df="df -k"
alias du="du -k"
alias f="finger"
alias h="history -r | more"
alias j="jobs -l"
alias tset='set noglob histchars=""; eval `\tset -s \!*`; unset noglob histchars'


if [ -x /usr/bin/tset ]; then
     eval `/usr/bin/tset -sQ \xterm-color`
fi

export GDK_USE_XFT=1
export QT_XFT=true

