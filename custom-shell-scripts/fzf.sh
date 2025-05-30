#!/bin/bash


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# Some custom commands for fzf
export FZF_DEFAULT_OPTS='--color=fg:#cdd6f4,bg:#1e1e2e,fg+:#cdd6f4,bg+:#313244,hl:#f38ba8,hl+:#f38ba8,pointer:#f5c2e7,marker:#f5c2e7,info:#b4befe,prompt:#f5c2e7,spinner:#f5c2e7,header:#89b4fa'

o(){
  files=$(fzf -m \
    --preview="bat --color=always {}" \
    --preview-window=right:65% \
    --height=100% \
    --layout=reverse \
    --border=rounded \
    --info=inline \
    --style full)
  [ -n "$files" ] && nvim $files
}

# Bind Ctrl+O to run o() in supported shells (bash/zsh)
if [[ -n $ZSH_VERSION ]]; then
  bindkey -s '^O' 'o\n'
elif [[ -n $BASH_VERSION ]]; then
  bind -x '"\C-o":o'
fi

zz() {
  local dir
  dir=$(zoxide query -l | fzf \
    --preview="lsd -alh --color=always {}" \
    --preview-window=right:65% \
    --height=100% \
    --layout=reverse \
    --border=rounded \
    --info=inline \
    --style full \
    --prompt="Go to > ")
  if [[ -n "$dir" ]]; then
    z "$dir" || echo "Failed to cd into $dir"
  fi
}

# Bind Ctrl+Z to run zz() in supported shells (bash/zsh)
if [[ -n $ZSH_VERSION ]]; then
  bindkey -s '^Z' 'zz\n'
elif [[ -n $BASH_VERSION ]]; then
  bind -x '"\C-z":zz'
fi



f() {
  clear
  local dir="${1:-$(pwd)}"
  f_index=9
  # Check if lsd is installed then f_index is set to 11
  if command -v lsd >/dev/null; then
    f_index=11
  fi
  while true; do
    clear
    selected=$(lsd -alh --color=always "$dir" | fzf --ansi --no-sort \
      --header="Browsing: ${dir/#$HOME/~}" \
      --preview "
        name=\$(echo {} | awk '{for(i=$f_index;i<=NF;++i)printf \$i\" \"; print \"\"}' | sed 's/ *\$//')
        fullpath=\"$dir/\$name\"
        # display path where $HOME is replaced with ~
        display_path=\$(echo \"\$fullpath\" | sed 's|^$HOME|~|')
        if [ -d \"\$fullpath\" ]; then
          echo -e \"\033[1;34mDirectory: \$display_path\033[0m\n\"
          lsd -alh --color=always \"\$fullpath\"
        elif [ -f \"\$fullpath\" ]; then
          echo -e \"\033[1;32mFile: \$display_path\033[0m\n\"
          command -v bat >/dev/null && bat --style=plain --color=always \"\$fullpath\" || cat \"\$fullpath\"
        else
          echo -e \"\033[1;31mInvalid path: \$display_path\033[0m\"
        fi
      " \
      --preview-window=right:60%:wrap,border-sharp --height=100% --layout=reverse --border=rounded --info=inline --style full)
    [ -z "$selected" ] && break
    name=$(echo "$selected" | awk "{for(i=$f_index;i<=NF;++i)printf \$i\" \"; print \"\"}" | sed 's/ *$//')
    local selected_path="$dir/$name"
    selected_path=$(realpath "$selected_path" 2>/dev/null || echo "$selected_path")
    if [ -d "$selected_path" ]; then
      z "$selected_path" || echo "Failed to change directory to $selected_path"
      dir="$selected_path"
    fi
  done
}

# Bind Ctrl+F (ff) to open ff in supported shells (bash/zsh)
if [[ -n $ZSH_VERSION ]]; then
  bindkey -s '^F' 'f\n'
elif [[ -n $BASH_VERSION ]]; then
  bind -x '"\C-f":f'
fi