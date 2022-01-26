# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


# Put your fun stuff here.
alias mc="rm -f /home/fab/.emacs.d/.emacs.desktop.lock && /usr/local/bin/emacsclient  -nw"
alias mm="rm -f ~/.emacs.d/.emacs.desktop.lock && /usr/local/bin/emacsclient -nc"
alias mmm="rm -f ~/.emacs.d/.emacs.desktop.lock && /usr/local/bin/emacs"
alias mmc="rm -f ~/.emacs.d/.emacs.desktop.lock && /usr/local/bin/emacs -nw"
alias mz="%emacsclient"
export GPG_TTY=$(tty)
export R_HOME=/usr/lib64/R
export R_LIB=${R_HOME}/lib
export LD_LIBRARY_PATH=${R_LIB}:.cabal/lib
if ! pidof emacs >/dev/null 2>&1
then
   /usr/local/bin/emacs --no-desktop --daemon
fi
alias _d="dolphin dirname \"$1\" >/dev/null 2>&1"
export EDITOR=kate
alias upd="sudo emerge --sync && sudo layman -S"
alias upg="sudo emerge -auDN --with-bdeps=y @world"
alias dupg="sudo emerge -auDN --backtrack=200 --with-bdeps=y @world"
alias updg="upd && upg"
export PATH=/root/.local/bin:/usr/local/mercury-rotd-2022-01-17/bin:/usr/local/mercury-DEV/bin:$PATH
export PATH=/home/fab/bin:$PATH
export PATH=/home/fab/bash-doxygen:$PATH
export PATH=$(sed -r 's/(.*):\/opt\/bin\/?(.*)/\1\2/g' <<< $PATH)
export DOCKER_HOST=unix:///run/user/1000/docker.sock
alias mkg="sudo docker run -dit --device /dev/vboxdrv:/dev/vboxdrv -v /dev/log:/dev/log $@"

unm() {
    ([ -z "$2" ] || [ -z "$1" ]) && return 1
    if [ -z "$3" ]
    then
        if [ ! -f /etc/portage/package.accept_keywords/$2 ] || ! grep -q "$1/$2 ~amd64" /etc/portage/package.accept_keywords/$2
	then
           echo "$1/$2 ~amd64" >> /etc/portage/package.accept_keywords/$2
	fi
    else
        echo "Checking file $2..."
        if [ ! -f /etc/portage/package.accept_keywords/$2 ] || ! grep -q ">=$1/$2-$3 ~amd64" /etc/portage/package.accept_keywords/$2
	then
          echo "Checking file $2..."
          echo ">=$1/$2-$3 ~amd64" >> /etc/portage/package.accept_keywords/$2
	  echo "Checking done"
	fi
    fi
}

unmm() {
    ([ -z "$2" ] || [ -z "$1" ]) && return 1
    unm "$@"
    if [ -z "$3" ]
    then
        sudo emerge -auDN "$1/$2"
    else
        echo "Emerging..."
        sudo emerge -auDN "=$1/$2-$3"
	echo "Done"
    fi
}

uuse() {
    ([ -z "$2" ] || [ -z "$1" ]) && return 1
    if [ -n "$3" ]
    then
        if [ ! -f /etc/portage/package.use/$2 ] || ! grep -q ">=$1/$2 $3" /etc/portage/package.use/$2
    	then
            echo "$1/$2 $3" >> /etc/portage/package.use/$2
     	fi
    fi
}

alias mong="tail -n10000 -f /var/log/syslog | grep -E  '\[[A-Z]{3}\]'"
alias dcl="sudo docker system prune --all --volumes --force"
alias bkn="cd /usr/src/linux ; sudo make syncconfig && sudo make -j12 && sudo make modules_install && sudo make install && sudo genkernel --install initramfs && sudo grub-mkconfig -o /boot/grub/grub.cfg && sudo emerge @module-rebuild"

debreate() {

sudo x11docker --share "$HOME/$1" -- --tmpfs /dev/shm -- 18.04-debreate debreate 1>/dev/null 2>&1
}

