source ~/.zplug/init.zsh

# Make sure to use double quotes
zplug "zsh-users/zsh-history-substring-search"

# Use the package as a command
# And accept glob patterns (e.g., brace, wildcard, ...)
zplug "Jxck/dotfiles", as:command, use:"bin/{histuniq,color}"

# Disable updates using the "frozen" tag
zplug "k4rthik/git-cal", as:command, frozen:1

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
zplug "plugins/autojump",   from:oh-my-zsh
zplug "plugins/common-aliases",   from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/fedora",   from:oh-my-zsh


#clone this repo and ln -s it to oh-my-zsh plugin dir
zplug "plugins/alias-tips", from:oh-my-zsh


# Also prezto
# zplug "modules/prompt", from:prezto

zplug "desyncr/auto-ls"
# zplug "molovo/tipz"
# zplug "zuxfoucault/colored-man-pages_mod"
zplug "zlsun/solarized-man"
# zplug "psprint/zsh-navigation-tools"

# Supports checking out a specific branch/tag/commit
zplug "b4b4r07/enhancd", at:v1
zplug "mollifier/anyframe", at:4c23cb60

# Can manage gist file just like other packages
zplug "b4b4r07/79ee61f7c140c63d2786", \
from:gist, \
as:command, \
use:get_last_pane_path.sh


# Support bitbucket
zplug "b4b4r07/hello_bitbucket", \
from:bitbucket, \
as:command, \
use:"*.sh"

# Rename a command with the string captured with `use` tag
zplug "b4b4r07/httpstat", \
as:command, \
use:'(*).sh', \
rename-to:'$1'

# Group dependencies
# Load "emoji-cli" if "jq" is installed in this example
zplug "stedolan/jq", \
from:gh-r, \
as:command, \
rename-to:jq
zplug "b4b4r07/emoji-cli", \
on:"stedolan/jq"
# Note: To specify the order in which packages should be loaded, use the defer
#       tag described in the next section

# Set the priority when loading
# e.g., zsh-syntax-highlighting must be loaded
# after executing compinit command and sourcing other plugins
# (If the defer tag is given 2 or above, run after compinit command)
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-completions"


zplug "zsh-users/zaw" #????
zplug "b4b4r07/enhancd", use:init.sh
zplug "zsh-users/zsh-autosuggestions"
zplug "hcgraf/zsh-sudo"
zplug "srijanshetty/zsh-pandoc-completion"
# zplug "bric3/nice-exit-code"


# Can manage local plugins
zplug "~/.zsh", from:local

# Source a file that isn't a .zsh file
# zplug "rupa/z", as:command, use:z.sh, rename-to:z
# . /home/aj/bin/z

# Load theme file
zplug "mreinhardt/sfz-prompt.zsh"
# zplug "sevaho/Powerzeesh", use:powerzeesh.zsh-theme,from:github, as:theme
# zplug "denysdovhan/spaceship-zsh-theme", use:spaceship.zsh, from:github, as:theme
# zplug "themes/charged-zsh-theme", from:oh-my-zsh, as:theme

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose
# zplug update


# Futurama Fortune
# shufExists=false;
# xcowsayExists=false;
#
# if ! [ -f ~/.futurama ]; then
# echo "Downloading futurama quotes"
# curl -s https://raw.githubusercontent.com/vsbuffalo/good-news-everyone/master/futurama.txt > .futurama
# fi
#
#
# if ! [ -x "$(command -v shuf)" ]; then
# echo 'Error: shuf is not installed.'>&2
#   exit 1
# else
# shufExists=true;
# fi
#
# if ! [ -x "$(command -v xcowsay)" ]; then
# echo 'Error: xcowsay is not installed.'>&2
#   exit 1
# else
# xcowsayExists=true;
# fi
#
# if [ $shufExists=true ] && [ $xcowsayExists=true ]; then
#   shuf -n1 ~/.futurama | xcowsay --time=1
# fi





#get fzf from github, install it, then
# load the plugin
#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# environment:



################################################################################
# Environment
################################################################################
set -o vi
#fzy key-bing:
source ~/.fzy/key-bindings.zsh #https://gist.githubusercontent.com/chaudum/baa1f4981f30733e12acc21379cf3151/raw/c6dfdf2346ef031ca6430b0462587cac9cba60fd/key-bindings.zsh
export PATH=$HOME/bin:$HOME/.local/bin:$PATH
export TERM="xterm-256color"
export CLASSPATH=$HOME/bin/postgresql-42.1.4.jar:.
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/emacs
#Fedora installed packages
#sudo dnf history userinstalled | awk '$1=$1' ORS=' '| sed "s/Packages installed by user //g" > $HOME/userpackages
#. /usr/share/autojump/autojump.sh
################################################################################
# Aliases
################################################################################
#alias v='f -e vim'
alias aliases='alias | grep dnf'
##############################################################################
# History Configuration
##############################################################################
HISTSIZE=5000               #How many lines of history to keep in memory
HISTFILE=~/.zsh_history     #Where to save history to disk
SAVEHIST=5000               #Number of history entries to save to disk
#HISTDUP=erase               #Erase duplicates in the history file
setopt    appendhistory     #Append history to the history file (no overwriting)
setopt    sharehistory      #Share history across terminals
setopt    incappendhistory  #Immediately append to the history file, not just when a term is killed
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward
