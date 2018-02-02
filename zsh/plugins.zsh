source ~/.zplug/init.zsh
if [ -f "/etc/arch-release" ]; then
	source ~/.zsh/arch.zsh
fi

if [ -f "/etc/fedora-release" ]; then
	source ~/.zsh/fedora.zsh
fi

# =========================

# Make sure to use double quotes
zplug "zsh-users/zsh-history-substring-search"

# Use the package as a command
# And accept glob patterns (e.g., brace, wildcard, ...)
zplug "Jxck/dotfiles", as:command, use:"bin/{histuniq,color}"

# Supports oh-my-zsh plugins and the like
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/common-aliases", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/emoji", from:oh-my-zsh
zplug "zlsun/solarized-man"
zplug "zdharma/fast-syntax-highlighting", defer:2
zplug "zsh-users/zsh-completions"
zplug "srijanshetty/zsh-pip-completion"
zplug "zsh-users/zsh-autosuggestions"
zplug "MichaelAquilina/zsh-you-should-use" #tells you which alias to use
zplug "hcgraf/zsh-sudo"                    #ESC ESC for sudo before command
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
		echo
		zplug install
	fi
fi

# Then, source plugins and add commands to $PATH
zplug load #--verbose
#zplug update
