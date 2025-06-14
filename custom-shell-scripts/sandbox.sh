#!/bin/bash

sandbox_temp() {
    rand_dir="sandbox-$(date +%s%N | sha256sum | head -c 8)"
    mkdir "$rand_dir"
    docker pull abhishek1009/sandbox:latest
    docker run -it --rm -v "$PWD/$rand_dir":/workspace/sandbox:rw -w /workspace/sandbox abhishek1009/sandbox zsh
}

sandbox_curr() {
    curr_dir_name="$(basename "$PWD")"
    docker pull abhishek1009/sandbox:latest
    docker run -it --rm -v "$PWD":/workspace/"$curr_dir_name":rw -w /workspace/"$curr_dir_name" abhishek1009/sandbox zsh
}

sandbox_dev() {
    curr_dir_name="$(basename "$PWD")"
    docker pull abhishek1009/dev:latest
    docker run -it --rm -v "$PWD":/workspace/"$curr_dir_name":rw -w /workspace/"$curr_dir_name" abhishek1009/dev zsh
}

# create a fuzzy finder with 3 options: sandbox, sandbox_curr, sandbox_dev
sandbox() {
  declare -a options=(
    "Sandbox environment with new temporary directory"
    "Sandbox environment in the current directory"
    "Dev Sandbox environment in the current directory"
  )
  selected=$(printf "%s\n" "${options[@]}" | fzf --prompt="Select an option: " --preview-window=right:60%:wrap,border-sharp --height=100% --layout=reverse --border=rounded --info=inline --style full)

  case $selected in
    "Sandbox environment with new temporary directory")
      sandbox_temp
      ;;
    "Sandbox environment in the current directory")
      sandbox_curr
      ;;
    "Dev Sandbox environment in the current directory")
      sandbox_dev
      ;;
    *)
      echo "Invalid selection"
      ;;
  esac
}

# Bind Ctrl+b to run sandbox() in supported shells (bash/zsh)
if [[ -n $ZSH_VERSION ]]; then
  bindkey -s '^B' 'sandbox\n'
elif [[ -n $BASH_VERSION ]]; then
  bind -x '"\C-b":sandbox'
fi
