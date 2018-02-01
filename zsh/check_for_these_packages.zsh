#! /bin/zsh
local progs="fortune cowsay lolcat colordiff emacs git nvim nyaovim vimpager pacaur man2html fzy autojump"
progs_arr=(${(ps: :)${progs}})
for prog in $progs_arr; do
    if (( $+commands[$prog] )); then; else echo "$prog missing"; fi
done;

