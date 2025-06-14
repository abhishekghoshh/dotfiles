#!/bin/bash

sandbox() {
    rand_dir="sandbox-$(date +%s%N | sha256sum | head -c 8)"
    mkdir "$rand_dir"
    docker pull abhishek1009/sandbox:latest
    docker run -it --rm -v "$PWD/$rand_dir":/workspace/sandbox:rw -w /workspace/sandbox abhishek1009/sandbox zsh
}

# Bind Ctrl+b to run sandbox() in supported shells (bash/zsh)
if [[ -n $ZSH_VERSION ]]; then
  bindkey -s '^B' 'sandbox\n'
elif [[ -n $BASH_VERSION ]]; then
  bind -x '"\C-b":sandbox'
fi

sandbox_curr() {
    curr_dir_name="$(basename "$PWD")"
    docker pull abhishek1009/sandbox:latest
    docker run -it --rm -v "$PWD":/workspace/"$curr_dir_name":rw -w /workspace/"$curr_dir_name" abhishek1009/sandbox zsh
}

# Bind Ctrl+h to run sandbox_curr() in supported shells (bash/zsh)
if [[ -n $ZSH_VERSION ]]; then
  bindkey -s '^H' 'sandbox_curr\n'
elif [[ -n $BASH_VERSION ]]; then
  bind -x '"\C-h":sandbox_curr'
fi