export EZA_COLORS="xx=36:sn=36:sb=36:uu=36:uR=36:un=36:gu=36:gR=36:gn=36:da=36:or=31";

# go to dev project
function d() {
  cd $(find ~/src -maxdepth 2 -type d -name $1)
}

function redraw-prompt() {
  local f
  for f in chpwd "''${chpwd_functions[@]}" precmd "''${precmd_functions[@]}"; do
    [[ "''${+functions[$f]}" == 0 ]] || "$f" &>/dev/null || true
  done
  zle reset-prompt
}

# go to start/end of line (ctrl-a, ctrl-e)
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

# skip and delete word (ctrl-backspace, ctrl-left, ctrl-right)
bindkey "^H" backward-kill-word
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

# cd up and back (alt-up, alt-left)
function cd-up() { builtin cd ..; redraw-prompt }
function cd-prev() { builtin cd -; redraw-prompt }

zle -N cd-up
zle -N cd-prev

bindkey "^[[1;3A" cd-up
bindkey "^[[1;3D" cd-prev

# git shortcuts
function git-status() { git status; redraw-prompt }
zle -N git-status
bindkey "^[s" git-status

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#464d57"

eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/jr.omp.json)"
