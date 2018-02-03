# first time run 
new_installation=false #~/.zsh/check_for_these_packages.zsh
# =========================
#source /usr/share/zsh/scripts/zplug/init.zsh
#install fzy https://github.com/jhawthorn/fzy


source ~/.zsh/plugins.zsh #also sources distro specific configs
source ~/.zsh/environment.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/history.zsh
source ~/.zsh/key-bindings.zsh
source ~/.zsh/help.zsh
source ~/.zsh/powerline.zsh

zcompile $HOME/.zshrc
zcompile $HOME/.zshenv
zcompile $HOME/.zlogin
setopt auto_cd

# OPAM configuration
. /home/aj/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
