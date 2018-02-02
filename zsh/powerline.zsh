# Powerline
#if [[ -r /usr/share/powerline/zsh/powerline.zsh ]]; then
#  source /usr/share/powerline/zsh/powerline.zsh
#fi
#
#Powerline-go
#
#function powerline_precmd() {
#    PROMP_HIST="$[HISTCMD-1][%?] %#"
#    PS1="$(/usr/bin/powerline-go -error $? -shell zsh -colorize-hostname)"
#
#}
#
#function install_powerline_precmd() {
#    for s in "${precmd_functions[@]}"; do
#        if [ "$s" = "powerline_precmd" ]; then
#            return
#        fi
#    done
#    precmd_functions+=(powerline_precmd)
#}
##
#if [ "$TERM" != "linux" ]; then
#    install_powerline_precmd
#fi

#powerline level9k
#
#https://github.com/bhilburn/powerlevel9k
POWERLEVEL9K_MODE='awesome-fontconfig'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="╭"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="╰\uF460 "
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir rbenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time battery os_icon ram root_indicator background_jobs history time)
POWERLEVEL9K_BATTERY_VERBOSE=false
POWERLEVEL9K_BATTERY_STAGES=(
	$'▏    ▏' $'▎    ▏' $'▍    ▏' $'▌    ▏' $'▋    ▏' $'▊    ▏' $'▉    ▏' $'█    ▏'
	$'█▏   ▏' $'█▎   ▏' $'█▍   ▏' $'█▌   ▏' $'█▋   ▏' $'█▊   ▏' $'█▉   ▏' $'██   ▏'
	$'██   ▏' $'██▎  ▏' $'██▍  ▏' $'██▌  ▏' $'██▋  ▏' $'██▊  ▏' $'██▉  ▏' $'███  ▏'
	$'███  ▏' $'███▎ ▏' $'███▍ ▏' $'███▌ ▏' $'███▋ ▏' $'███▊ ▏' $'███▉ ▏' $'████ ▏'
	$'████ ▏' $'████▎▏' $'████▍▏' $'████▌▏' $'████▋▏' $'████▊▏' $'████▉▏' $'█████▏')
