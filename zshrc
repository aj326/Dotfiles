# Always need to be tweaked

# =========================
source /usr/share/zsh/scripts/zplug/init.zsh 

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
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-completions" 
zplug "srijanshetty/zsh-pip-completion"
zplug "zsh-users/zsh-autosuggestions"
zplug "hcgraf/zsh-sudo" #ESC ESC for sudo before command

#Can manage local plugins
zplug "$HOME/.zsh", from:local

zplug "unixorn/warhol.plugin.zsh" #Colorize command output using grc and lscolors
# Load theme file
#zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
#zplug "mreinhardt/sfz-prompt.zsh"
#zplug "sevaho/Powerzeesh", use:powerzeesh.zsh-theme,from:github, as:theme
#zplug "denysdovhan/spaceship-zsh-theme", use:spaceship.zsh, from:github, as:theme
#zplug "themes/charged-zsh-theme", from:oh-my-zsh, as:theme
zplug "themes/agnoster", from:oh-my-zsh
#zplug "themes/avit", from:oh-my-zsh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

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

alias aurin='sudo aura -Akuaxv'

export PAGER='vimpager'
alias less=$PAGER

###############################################################################
# Aliases
################################################################################
#fasd
#alias v='f -e vim'
alias diff='colordiff' 
alias emacs='emacsclient -c -a emacs'
alias ls='ls --color=auto'
alias mkdir='mkdir -p -v'
alias rm='newrm'
alias zshrc='vim $HOME/.zshrc && source $HOME/.zshrc'
source $HOME/.zsh/manopt.zsh #manopt command opt
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
if [[ -r /usr/share/powerline/zsh/powerline.zsh ]]; then
  source /usr/share/powerline/zsh/powerline.zsh
fi
