path+=("$HOME/bin"
       "$HOME/.zsh/bin"
	"/usr/lib/ccache/bin/")
export CLASSPATH=$HOME/bin/postgresql-42.1.4.jar:.

###############################################################################
# Editor Settings
################################################################################
export ALTERNATE_EDITOR=""
#export EDITOR="emacsclient -t"                  # $EDITOR should open in terminal
#export VISUAL="emacsclient -c -a emacs"         # $VISUAL opens in GUI with non-daemon as alternate
export EDITOR="vim"
#export VISUAL="nyaovim"
export TERM="xterm-256color"
if [ -n "$DISPLAY" ]; then
    export BROWSER=firefox
else
    export BROWSER=links
fi
