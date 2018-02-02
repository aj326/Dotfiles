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