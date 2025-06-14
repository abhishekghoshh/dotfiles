#!/bin/bash

sandbox() {
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
sandbox_fuzzy_finder() {
    declare -a options=("sandbox" "sandbox_curr" "sandbox_dev")
    selected=$(printf "%s\n" "${options[@]}" | fzf --prompt="Select an option: ")
    
    case $selected in
        "sandbox")
            sandbox
            ;;
        "sandbox_curr")
            sandbox_curr
            ;;
        "sandbox_dev")
            sandbox_dev
            ;;
        *)
            echo "Invalid selection"
            ;;
    esac
}

# Bind Ctrl+b to run sandbox_fuzzy_finder() in supported shells (bash/zsh)
if [[ -n $ZSH_VERSION ]]; then
  bindkey -s '^B' 'sandbox_fuzzy_finder\n'
elif [[ -n $BASH_VERSION ]]; then
  bind -x '"\C-b":sandbox_fuzzy_finder'
fi
