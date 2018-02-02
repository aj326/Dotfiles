################################################################################
# Environment
################################################################################
set -o vi
typeset -U path

setopt correct
export SPROMPT="Correct $fg[red]%R$reset_color to $fg[green]%r?$reset_color (yes, no, abort, edit) "

if [ -f $HOME/.config/exercism/exercism_completion.zsh ]; then
	. $HOME/.config/exercism/exercism_completion.zsh
fi