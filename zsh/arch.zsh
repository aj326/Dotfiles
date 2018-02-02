###############################################################################
# Arch Linux Settings
################################################################################

#Command Not Found -- Searching at ABS#
#######################################
source /usr/share/doc/pkgfile/command-not-found.zsh #install pkgfile, enable systemd

#uncomment Color in /etc/pacman.conf:34
# vim +100 $(which pacsearch) <ESC> :s/pacman/pacaur/g

alias pacin='pacaur -S --noedit --noconfirm'
alias aurin='pacaur -S --noedit --noconfirm'
alias pacupg='pacaur -Syu --noedit --noconfirm'
export PAGER='vimpager'
alias less=$PAGER
source /usr/share/autojump/autojump.zsh
zplug "plugins/archlinux", from:oh-my-zsh
