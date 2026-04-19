export EZA_COLORS="xx=36:sn=36:sb=36:uu=36:uR=36:un=36:gu=36:gR=36:gn=36:da=36:or=31";

# go to dev project
function d() {
  cd $(find ~/src -maxdepth 2 -type d -name $1)
}

# go to start/end of line (ctrl-a, ctrl-e)
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

# skip and delete word (ctrl-backspace, ctrl-left, ctrl-right)
bindkey "^H" backward-kill-word
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#464d57"

eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/jr.omp.json)"
