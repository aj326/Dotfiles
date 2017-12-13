source ~/.zplug/init.zsh

# Make sure to use double quotes
zplug "zsh-users/zsh-history-substring-search"

# Use the package as a command
# And accept glob patterns (e.g., brace, wildcard, ...)
zplug "Jxck/dotfiles", as:command, use:"bin/{histuniq,color}"

# Disable updates using the "frozen" tag
#zplug "k4rthik/git-cal", as:command, frozen:1

# Grab binaries from GitHub Releases
# and rename with the "rename-to:" tag
# zplug "junegunn/fzf-bin", \
#. /usr/share/autojump/autojump.sh
#     from:gh-r, \
#     as:command, \
#     rename-to:fzf, \
#     use:"*linux_amd64*"

# Supports oh-my-zsh plugins and the like
zplug "plugins/git",   from:oh-my-zsh
zplug "plugins/common-aliases",   from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/fedora",   from:oh-my-zsh
zplug "plugins/alias-tips", from:oh-my-zsh
zplug "plugins/emoji", from:oh-my-zsh
#zplug "desyncr/auto-ls"
zplug "zlsun/solarized-man"

# Supports checking out a specific branch/tag/commit
#zplug "b4b4r07/enhancd", at:v1
#zplug "mollifier/anyframe", at:4c23cb60

# Can manage gist file just like other packages
#zplug "b4b4r07/79ee61f7c140c63d2786", \
#from:gist, \
#as:command, \
#use:get_last_pane_path.sh


# Support bitbucket
#zplug "b4b4r07/hello_bitbucket", \
#from:bitbucket, \
#as:command, \
#use:"*.sh"

# Rename a command with the string captured with `use` tag
#zplug "b4b4r07/httpstat", \
#as:command, \
#use:'(*).sh', \
#rename-to:'$1'

# Group dependencies
# Load "emoji-cli" if "jq" is installed in this example
#zplug "stedolan/jq", \
#from:gh-r, \
#as:command, \
#rename-to:jq
#
#zplug "b4b4r07/emoji-cli", \
#on:"stedolan/jq"
# Note: To specify the order in which packages should be loaded, use the defer
#       tag described in the next section

# Set the priority when loading
# e.g., zsh-syntax-highlighting must be loaded
# after executing compinit command and sourcing other plugins
# (If the defer tag is given 2 or above, run after compinit command)
zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug "zsh-users/zsh-completions" 
zplug "srijanshetty/zsh-pip-completion"


#zplug "zsh-users/zaw" #like emacs helm
zplug "zsh-users/zsh-autosuggestions"
zplug "hcgraf/zsh-sudo" #ESC ESC for sudo before command

#Can manage local plugins
zplug "$HOME/.zsh", from:local

# Source a file that isn't a .zsh file
# zplug "rupa/z", as:command, use:z.sh, rename-to:z
# . $HOME/bin/z
zplug "unixorn/warhol.plugin.zsh"
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
###############################################################################
# Arch Linux Settings
################################################################################

#Autojump
#########
#`source /usr/share/autojump/autojump.bash

#Command Not Found -- Searching at ABS#
#######################################
#source /usr/share/doc/pkgfile/command-not-found.zsh #install pkgfile, enable systemd

#if using ARCH, uncomment Color in /etc/pacman.conf

if [ -f $HOME/.config/exercism/exercism_completion.zsh ]; then
  . $HOME/.config/exercism/exercism_completion.zsh
fi
function search() {
    aura -Ss $1 && aura -As $1
}

#alias aurins='sudo aura -Akuaxv'
###############################################################################
# Aliases
################################################################################
#fasd
#alias v='f -e vim'
alias diff='colordiff' 
alias emacs='emacsclient -c -a emacs'
alias less='vimpager'
alias ls='ls --color=auto'
alias mkdir='mkdir -p -v'
alias rm='newrm'
alias -s pdf='okular'
alias zshrc='vim $HOME/.zshrc && source $HOME/.zshrc'
source $HOME/.zsh/manopt.zsh #apparently zplpug can import functions from local zsh dir
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


