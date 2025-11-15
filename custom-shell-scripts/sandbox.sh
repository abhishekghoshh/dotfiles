#!/bin/bash


alpine_ephemeral() {
    docker pull abhishek1009/alpine:latest
    docker run -it --rm abhishek1009/alpine sh
}

alpine_temp() {
    rand_dir="sandbox-$(date +%s%N | sha256sum | head -c 8)"
    mkdir "$rand_dir"
    docker pull abhishek1009/alpine:latest
    docker run -it --rm -v "$PWD/$rand_dir":/workspace/"$rand_dir":rw -w /workspace/"$rand_dir" abhishek1009/alpine sh
}

alpine_curr() {
    curr_dir_name="$(basename "$PWD")"
    docker pull abhishek1009/alpine:latest
    docker run -it --rm -v "$PWD":/workspace/"$curr_dir_name":rw -w /workspace/"$curr_dir_name" abhishek1009/alpine sh
}

ubuntu_ephemeral() {
    docker pull abhishek1009/ubuntu:latest
    docker run -it --rm abhishek1009/ubuntu zsh
}

ubuntu_temp() {
    rand_dir="sandbox-$(date +%s%N | sha256sum | head -c 8)"
    mkdir "$rand_dir"
    docker pull abhishek1009/ubuntu:latest
    docker run -it --rm -v "$PWD/$rand_dir":/workspace/"$rand_dir":rw -w /workspace/"$rand_dir" abhishek1009/ubuntu zsh
}

ubuntu_curr() {
    curr_dir_name="$(basename "$PWD")"
    docker pull abhishek1009/ubuntu:latest
    docker run -it --rm -v "$PWD":/workspace/"$curr_dir_name":rw -w /workspace/"$curr_dir_name" abhishek1009/ubuntu zsh
}

dev_ephemeral() {
    docker pull abhishek1009/dev:latest
    docker run -it --rm abhishek1009/dev zsh
}

dev_temp() {
    rand_dir="sandbox-$(date +%s%N | sha256sum | head -c 8)"
    mkdir "$rand_dir"
    docker pull abhishek1009/dev:latest
    docker run -it --rm -v "$PWD/$rand_dir":/workspace/"$rand_dir":rw -w /workspace/"$rand_dir" abhishek1009/dev zsh
}



dev_curr() {
    curr_dir_name="$(basename "$PWD")"
    docker pull abhishek1009/dev:latest
    docker run -it --rm -v "$PWD":/workspace/"$curr_dir_name":rw -w /workspace/"$curr_dir_name" abhishek1009/dev  zsh
}

# create a fuzzy finder with 4 options: sandbox, sandbox_curr, sandbox_temp_dev, sandbox_curr_dev
sandbox() {
  declare -a options=(
    "Ephemeral Alpine environment"
    "Alpine environment with new temporary directory"
    "Alpine environment in the current directory"
    "Ephemeral Ubuntu environment"
    "Ubuntu environment with new temporary directory"
    "Ubuntu environment in the current directory"
    "Ephemeral Dev environment"
    "Dev environment with new temporary directory"
    "Dev environment in the current directory"
  )

  preview_cmd='
    case {} in
      "Ephemeral Alpine environment")
        echo "docker pull abhishek1009/alpine:latest"
        echo "docker run -it --rm abhishek1009/alpine sh"
        ;;
      "Alpine environment with new temporary directory")
        rand_dir="sandbox-<random>"
        echo "docker pull abhishek1009/alpine:latest"
        echo "mkdir \"\$PWD/\$rand_dir\""
        echo "docker run -it --rm -v \"\$PWD/\$rand_dir\":/workspace/\"\$rand_dir\":rw -w /workspace/\"\$rand_dir\" abhishek1009/alpine sh"
        ;;
      "Alpine environment in the current directory")
        curr_dir_name="$(basename \"$PWD\")"
        echo "docker pull abhishek1009/alpine:latest"
        echo "docker run -it --rm -v \"\$PWD\":/workspace/\"\$curr_dir_name\":rw -w /workspace/\"\$curr_dir_name\" abhishek1009/alpine sh"
        ;;
      "Ephemeral Ubuntu environment")
        echo "docker pull abhishek1009/ubuntu:latest"
        echo "docker run -it --rm abhishek1009/ubuntu zsh"
        ;;
      "Ubuntu environment with new temporary directory")
        rand_dir="sandbox-<random>"
        echo "docker pull abhishek1009/ubuntu:latest"
        echo "mkdir \"\$PWD/\$rand_dir\""
        echo "docker run -it --rm -v \"\$PWD/\$rand_dir\":/workspace/ubuntu:rw -w /workspace/ubuntu abhishek1009/ubuntu zsh"
        ;;
      "Ubuntu environment in the current directory")
        curr_dir_name="$(basename \"$PWD\")"
        echo "docker pull abhishek1009/ubuntu:latest"
        echo "docker run -it --rm -v \"\$PWD\":/workspace/\"\$curr_dir_name\":rw -w /workspace/\"\$curr_dir_name\" abhishek1009/ubuntu zsh"
        ;;
      "Ephemeral Dev environment")
        echo "docker pull abhishek1009/dev:latest"
        echo "docker run -it --rm abhishek1009/dev zsh"
        ;;
      "Dev environment with new temporary directory")
        rand_dir="sandbox-<random>"
        echo "docker pull abhishek1009/dev:latest"
        echo "mkdir \"\$PWD/\$rand_dir\""
        echo "docker run -it --rm -v \"\$PWD/\$rand_dir\":/workspace/dev:rw -w /workspace/dev abhishek1009/dev zsh"
        ;;
      "Dev environment in the current directory")
        curr_dir_name="$(basename \"$PWD\")"
        echo "docker pull abhishek1009/dev:latest"
        echo "docker run -it --rm -v \"\$PWD\":/workspace/\"\$curr_dir_name\":rw -w /workspace/\"\$curr_dir_name\" abhishek1009/dev zsh"
        ;;
      *)
        echo "No command"
        ;;
    esac
  '

  selected=$(printf "%s\n" "${options[@]}" | \
    fzf --prompt="Select an option: " \
        --preview="$preview_cmd" \
        --preview-window=right:60%:wrap,border-sharp \
        --height=100% --layout=reverse --border=rounded --info=inline --style full)

  case $selected in
    "Ephemeral Alpine environment")
      alpine_ephemeral
      ;;
    "Alpine environment with new temporary directory")
      alpine_temp
      ;;
    "Alpine environment in the current directory")
      alpine_curr
      ;;
    "Ephemeral Ubuntu environment")
      ubuntu_ephemeral
      ;;
    "Ubuntu environment with new temporary directory")
      ubuntu_temp
      ;;
    "Ubuntu environment in the current directory")
      ubuntu_curr
      ;;
    "Ephemeral Dev environment")
      dev_ephemeral
      ;;
    "Dev environment with new temporary directory")
      dev_temp
      ;;
    "Dev environment in the current directory")
      dev_curr
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
