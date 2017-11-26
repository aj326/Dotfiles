path+=("$HOME/bin"
       "$HOME/.zsh/bin")
export CLASSPATH=$HOME/bin/postgresql-42.1.4.jar:.

###############################################################################
# Editor Settings
################################################################################
export ALTERNATE_EDITOR=""
export EDITOR="emacsclient -t"                  # $EDITOR should open in terminal
export VISUAL="emacsclient -c -a emacs"         # $VISUAL opens in GUI with non-daemon as alternate
export PAGER='vimpager'
export TERM="xterm-256color"
