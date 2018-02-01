# Always need to be tweaked
# first time run
new_installation=false;
# vim +100 $(which pacsearch) <ESC> :s/pacman/pacaur/g
# =========================
#source /usr/share/zsh/scripts/zplug/init.zsh

source ~/.zplug/init.zsh


#install fzy https://github.com/jhawthorn/fzy

#Autojump
#########
source /usr/share/autojump/autojump.zsh
#zplug "plugins/fedora",   from:oh-my-zsh

zplug "plugins/archlinux",   from:oh-my-zsh

# =========================


# Make sure to use double quotes
zplug "zsh-users/zsh-history-substring-search"

# Use the package as a command
# And accept glob patterns (e.g., brace, wildcard, ...)
zplug "Jxck/dotfiles", as:command, use:"bin/{histuniq,color}"

# Supports oh-my-zsh plugins and the like
zplug "plugins/git",   from:oh-my-zsh
zplug "plugins/common-aliases",   from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/alias-tips", from:oh-my-zsh
zplug "plugins/emoji", from:oh-my-zsh
zplug "zlsun/solarized-man"
zplug "zdharma/fast-syntax-highlighting", defer:2
zplug "zsh-users/zsh-completions"
zplug "srijanshetty/zsh-pip-completion"
zplug "zsh-users/zsh-autosuggestions"
zplug "MichaelAquilina/zsh-you-should-use" #tells you which alias to use
zplug "hcgraf/zsh-sudo" #ESC ESC for sudo before command
zplug "hchbaw/auto-fu.zsh"
zplug "peterhurford/up.zsh"

#Can manage local plugins
zplug "$HOME/.zsh", from:local

zplug "unixorn/warhol.plugin.zsh" #Colorize command output using grc and lscolors
# Load theme file
#zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
#zplug "mreinhardt/sfz-prompt.zsh"
#zplug "sevaho/Powerzeesh", use:powerzeesh.zsh-theme,from:github, as:theme
#zplug "denysdovhan/spaceship-zsh-theme", use:spaceship.zsh, from:github, as:theme
#zplug "themes/charged-zsh-theme", from:oh-my-zsh, as:theme
#zplug "themes/agnoster", from:oh-my-zsh
#zplug "themes/avit", from:oh-my-zsh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme
# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load #--verbose
#zplug update

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

###############################################################################
# Arch Linux Settings
################################################################################

#Command Not Found -- Searching at ABS#
#######################################
source /usr/share/doc/pkgfile/command-not-found.zsh #install pkgfile, enable systemd

#uncomment Color in /etc/pacman.conf

function search() {
    aura -Ss $1 && aura -As $1
}

alias pacin='pacaur -S --noedit --noconfirm'
alias aurin='pacaur -S --noedit --noconfirm'
alias pacupg='pacaur -Syu --noedit --noconfirm'
export PAGER='vimpager'
alias less=$PAGER

###############################################################################
# Aliases
################################################################################
#fasd
#alias v='f -e vim'
alias vim='nyaovim'
alias diff='colordiff'
alias emacs='emacsclient -c -a emacs'
alias ls='ls --color=auto'
alias mkdir='mkdir -p -v'
alias rm='newrm'
alias zshrc='vim $HOME/.zshrc -f && source $HOME/.zshrc'
alias updatedb='sudo updatedb'
source $HOME/.zsh/manopt.zsh #manopt command opt
source $HOME/.zsh/pacregex.zsh
source $HOME/.zsh/fullpath.zsh
##############################################################################
# History Configuration
##############################################################################
HISTSIZE=5000               #How many lines of history to keep in memory
HISTFILE=$HOME/.zsh_history     #Where to save history to disk
SAVEHIST=5000               #Number of history entries to save to disk
HISTDUP=erase               #Erase duplicates in the history file
setopt    appendhistory     #Append history to the history file (no overwriting)
setopt    sharehistory      #Share history across terminals
setopt    incappendhistory  #Immediately append to the history file, not just when a term is killed

##############################################################################
# Key Bindings
##############################################################################


bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward

##################
# Fix Key Bindings
##################
source $HOME/.zsh/fix-key-bindings.zsh #http://zshwiki.org/home/zle/bindkeys

##################
# FZY Key Bindings
##################
source $HOME/.zsh/fzy-key-bindings.zsh #https://gist.githubusercontent.com/chaudum/baa1f4981f30733e12acc21379cf3151/raw/c6dfdf2346ef031ca6430b0462587cac9cba60fd/key-bindings.zsh


##############################################################################
# Help
##############################################################################
autoload -Uz run-help
alias help=run-help
autoload -Uz run-help-git
autoload -Uz run-help-ip
autoload -Uz run-help-openssl
autoload -Uz run-help-p4
autoload -Uz run-help-sudo
autoload -Uz run-help-svk
autoload -Uz run-help-svn

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
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir rbenv vcs )
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time battery os_icon ram  root_indicator background_jobs history time)
POWERLEVEL9K_BATTERY_VERBOSE=false
POWERLEVEL9K_BATTERY_STAGES=(
   $'▏    ▏' $'▎    ▏' $'▍    ▏' $'▌    ▏' $'▋    ▏' $'▊    ▏' $'▉    ▏' $'█    ▏'
   $'█▏   ▏' $'█▎   ▏' $'█▍   ▏' $'█▌   ▏' $'█▋   ▏' $'█▊   ▏' $'█▉   ▏' $'██   ▏'
   $'██   ▏' $'██▎  ▏' $'██▍  ▏' $'██▌  ▏' $'██▋  ▏' $'██▊  ▏' $'██▉  ▏' $'███  ▏'
   $'███  ▏' $'███▎ ▏' $'███▍ ▏' $'███▌ ▏' $'███▋ ▏' $'███▊ ▏' $'███▉ ▏' $'████ ▏'
   $'████ ▏' $'████▎▏' $'████▍▏' $'████▌▏' $'████▋▏' $'████▊▏' $'████▉▏' $'█████▏' )
zcompile $HOME/.zshrc
setopt auto_cd
