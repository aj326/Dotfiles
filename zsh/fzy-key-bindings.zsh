# Key bindings for fzy
# https://github.com/jhawthorn/fzy
#
# Installation:
# Place this file e.g. in ~/.fzy/ and add "source ~/.fzy/key-bindings.zsh" to your .zshrc


if [[ $- == *i* ]]; then

  __fzycmd() {
    echo "fzy"
  }

  # CTRL-R - Paste the selected command from history into the command line
  fzy-history-widget() {
    local selected num
    selected=( $(fc -l 1 | $(__fzycmd) -s -q "${LBUFFER//$/\\$}") )
    if [ -n "$selected" ]; then
      num=$selected[1]
      if [ -n "$num" ]; then
        zle vi-fetch-history -n $num
      fi
    fi
    zle redisplay
  }
  zle -N fzy-history-widget
  bindkey '^R' fzy-history-widget

fi