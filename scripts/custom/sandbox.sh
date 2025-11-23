#!/bin/bash

get_port_mappings() {
  local ports=()
  local port_args=""
  
  while true; do
    # Show current ports and options
    local options=("Add new port mapping" "Finish and continue")
    if [[ ${#ports[@]} -gt 0 ]]; then
      options=("${ports[@]}" "Add new port mapping" "Remove a port mapping" "Finish and continue")
    fi
    
    local selected=$(printf "%s\n" "${options[@]}" | \
      fzf --prompt="Port mappings (current: ${ports[*]:-none}): " \
          --header="Select action for port forwarding" \
          --height=50% --border --layout=reverse)
    
    case "$selected" in
      "Add new port mapping")
        echo "Enter port mapping (format: host_port:container_port, e.g., 8080:80):" >&2
        read -r port_mapping
        if [[ "$port_mapping" =~ ^[0-9]+:[0-9]+$ ]]; then
          ports+=("$port_mapping")
        else
          echo "Invalid format. Please use host_port:container_port" >&2
          sleep 1
        fi
        ;;
      "Remove a port mapping")
        if [[ ${#ports[@]} -gt 0 ]]; then
          local to_remove=$(printf "%s\n" "${ports[@]}" | fzf --prompt="Select port to remove: ")
          if [[ -n "$to_remove" ]]; then
            ports=(${ports[@]/$to_remove})
          fi
        fi
        ;;
      "Finish and continue"|"")
        break
        ;;
      *)
        # Selected an existing port, ignore or could edit
        ;;
    esac
  done
  
  # Build port arguments
  for port in "${ports[@]}"; do
    port_args="$port_args -p $port"
  done
  
  echo "$port_args"
}

# Function to get volume mappings using fzf
get_volume_mappings() {
  local volumes=()
  local volume_args=""
  
  while true; do
    # Show current volumes and options
    local options=("Add new volume mapping" "Finish and continue")
    if [[ ${#volumes[@]} -gt 0 ]]; then
      options=("${volumes[@]}" "Add new volume mapping" "Remove a volume mapping" "Finish and continue")
    fi
    
    local selected=$(printf "%s\n" "${options[@]}" | \
      fzf --prompt="Volume mappings (current: ${volumes[*]:-none}): " \
          --header="Select action for volume mounting" \
          --height=50% --border --layout=reverse)
    
    case "$selected" in
      "Add new volume mapping")
        echo "Enter volume mapping (format: host_path:container_path:permission, e.g., /home/user/data:/data:rw):" >&2
        read -r volume_mapping
        if [[ "$volume_mapping" =~ ^[^:]+:[^:]+:[^:]+$ ]]; then
          volumes+=("$volume_mapping")
        else
          echo "Invalid format. Please use host_path:container_path:permission" >&2
          sleep 1
        fi
        ;;
      "Remove a volume mapping")
        if [[ ${#volumes[@]} -gt 0 ]]; then
          local to_remove=$(printf "%s\n" "${volumes[@]}" | fzf --prompt="Select volume to remove: ")
          if [[ -n "$to_remove" ]]; then
            volumes=(${volumes[@]/$to_remove})
          fi
        fi
        ;;
      "Finish and continue"|"")
        break
        ;;
      *)
        # Selected an existing volume, ignore or could edit
        ;;
    esac
  done
  
  # Build volume arguments
  for volume in "${volumes[@]}"; do
    volume_args="$volume_args -v $volume"
  done
  
  echo "$volume_args"
}

ephemeral_env() {
  local image="$1"
  local shell="${2:-sh}"

  port_args=$(get_port_mappings)
  volume_args=$(get_volume_mappings)

  docker run -it --rm $port_args $volume_args \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v ~/.kube:/root/.kube:ro \
    -v ~/.ssh:/root/.ssh:ro \
    "$image" "$shell"
}

temp_env() {
  local image="$1"
  local shell="${2:-sh}"
  
  rand_dir="sandbox-$(date +%s%N | sha256sum | head -c 8)"
  mkdir "$rand_dir"
  port_args=$(get_port_mappings)
  volume_args=$(get_volume_mappings)

  docker run -it --rm $port_args $volume_args \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v ~/.kube:/root/.kube:ro \
    -v ~/.ssh:/root/.ssh:ro \
    -v "$PWD/$rand_dir":/workspace/"$rand_dir":rw \
    -w /workspace/"$rand_dir" \
    "$image" "$shell"
}

curr_env() {
  local image="$1"
  local shell="${2:-sh}"

  curr_dir_name="$(basename "$PWD")"
  port_args=$(get_port_mappings)
  volume_args=$(get_volume_mappings)

  docker run -it --rm $port_args $volume_args \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v ~/.kube:/root/.kube:ro \
    -v ~/.ssh:/root/.ssh:ro \
    -v "$PWD":/workspace/"$curr_dir_name":rw \
    -w /workspace/"$curr_dir_name" \
    "$image" "$shell"
}

# Convenience functions for specific images
alpine_ephemeral() { ephemeral_env "abhishek1009/alpine:latest" "zsh"; }
alpine_temp() { temp_env "abhishek1009/alpine:latest" "zsh"; }
alpine_curr() { curr_env "abhishek1009/alpine:latest" "zsh"; }

ubuntu_ephemeral() { ephemeral_env "abhishek1009/ubuntu:latest" "zsh"; }
ubuntu_temp() { temp_env "abhishek1009/ubuntu:latest" "zsh"; }
ubuntu_curr() { curr_env "abhishek1009/ubuntu:latest" "zsh"; }

dev_ephemeral() { ephemeral_env "abhishek1009/dev:latest" "zsh"; }
dev_temp() { temp_env "abhishek1009/dev:latest" "zsh"; }
dev_curr() { curr_env "abhishek1009/dev:latest" "zsh"; }

golang_ephemeral() { ephemeral_env "abhishek1009/golang:latest" "zsh"; }
golang_temp() { temp_env "abhishek1009/golang:latest" "zsh"; }
golang_curr() { curr_env "abhishek1009/golang:latest" "zsh"; }

java_ephemeral() { ephemeral_env "abhishek1009/java:latest" "zsh"; }
java_temp() { temp_env "abhishek1009/java:latest" "zsh"; }
java_curr() { curr_env "abhishek1009/java:latest" "zsh"; }

js_ephemeral() { ephemeral_env "abhishek1009/js:latest" "zsh"; }
js_temp() { temp_env "abhishek1009/js:latest" "zsh"; }
js_curr() { curr_env "abhishek1009/js:latest" "zsh"; }

python_ephemeral() { ephemeral_env "abhishek1009/python:latest" "zsh"; }
python_temp() { temp_env "abhishek1009/python:latest" "zsh"; }
python_curr() { curr_env "abhishek1009/python:latest" "zsh"; }

rust_ephemeral() { ephemeral_env "abhishek1009/rust:latest" "zsh"; }
rust_temp() { temp_env "abhishek1009/rust:latest" "zsh"; }
rust_curr() { curr_env "abhishek1009/rust:latest" "zsh"; }

# create a fuzzy finder with all environment options
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
  "Ephemeral Golang environment"
  "Golang environment with new temporary directory"
  "Golang environment in the current directory"
  "Ephemeral Java environment"
  "Java environment with new temporary directory"
  "Java environment in the current directory"
  "Ephemeral JavaScript environment"
  "JavaScript environment with new temporary directory"
  "JavaScript environment in the current directory"
  "Ephemeral Python environment"
  "Python environment with new temporary directory"
  "Python environment in the current directory"
  "Ephemeral Rust environment"
  "Rust environment with new temporary directory"
  "Rust environment in the current directory"
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
    "Ephemeral Golang environment")
    echo "docker pull abhishek1009/golang:latest"
    echo "docker run -it --rm abhishek1009/golang zsh"
    ;;
    "Golang environment with new temporary directory")
    rand_dir="sandbox-<random>"
    echo "docker pull abhishek1009/golang:latest"
    echo "mkdir \"\$PWD/\$rand_dir\""
    echo "docker run -it --rm -v \"\$PWD/\$rand_dir\":/workspace/\"\$rand_dir\":rw -w /workspace/\"\$rand_dir\" abhishek1009/golang zsh"
    ;;
    "Golang environment in the current directory")
    curr_dir_name="$(basename \"$PWD\")"
    echo "docker pull abhishek1009/golang:latest"
    echo "docker run -it --rm -v \"\$PWD\":/workspace/\"\$curr_dir_name\":rw -w /workspace/\"\$curr_dir_name\" abhishek1009/golang zsh"
    ;;
    "Ephemeral Java environment")
    echo "docker pull abhishek1009/java:latest"
    echo "docker run -it --rm abhishek1009/java zsh"
    ;;
    "Java environment with new temporary directory")
    rand_dir="sandbox-<random>"
    echo "docker pull abhishek1009/java:latest"
    echo "mkdir \"\$PWD/\$rand_dir\""
    echo "docker run -it --rm -v \"\$PWD/\$rand_dir\":/workspace/\"\$rand_dir\":rw -w /workspace/\"\$rand_dir\" abhishek1009/java zsh"
    ;;
    "Java environment in the current directory")
    curr_dir_name="$(basename \"$PWD\")"
    echo "docker pull abhishek1009/java:latest"
    echo "docker run -it --rm -v \"\$PWD\":/workspace/\"\$curr_dir_name\":rw -w /workspace/\"\$curr_dir_name\" abhishek1009/java zsh"
    ;;
    "Ephemeral JavaScript environment")
    echo "docker pull abhishek1009/js:latest"
    echo "docker run -it --rm abhishek1009/js zsh"
    ;;
    "JavaScript environment with new temporary directory")
    rand_dir="sandbox-<random>"
    echo "docker pull abhishek1009/js:latest"
    echo "mkdir \"\$PWD/\$rand_dir\""
    echo "docker run -it --rm -v \"\$PWD/\$rand_dir\":/workspace/\"\$rand_dir\":rw -w /workspace/\"\$rand_dir\" abhishek1009/js zsh"
    ;;
    "JavaScript environment in the current directory")
    curr_dir_name="$(basename \"$PWD\")"
    echo "docker pull abhishek1009/js:latest"
    echo "docker run -it --rm -v \"\$PWD\":/workspace/\"\$curr_dir_name\":rw -w /workspace/\"\$curr_dir_name\" abhishek1009/js zsh"
    ;;
    "Ephemeral Python environment")
    echo "docker pull abhishek1009/python:latest"
    echo "docker run -it --rm abhishek1009/python zsh"
    ;;
    "Python environment with new temporary directory")
    rand_dir="sandbox-<random>"
    echo "docker pull abhishek1009/python:latest"
    echo "mkdir \"\$PWD/\$rand_dir\""
    echo "docker run -it --rm -v \"\$PWD/\$rand_dir\":/workspace/\"\$rand_dir\":rw -w /workspace/\"\$rand_dir\" abhishek1009/python zsh"
    ;;
    "Python environment in the current directory")
    curr_dir_name="$(basename \"$PWD\")"
    echo "docker pull abhishek1009/python:latest"
    echo "docker run -it --rm -v \"\$PWD\":/workspace/\"\$curr_dir_name\":rw -w /workspace/\"\$curr_dir_name\" abhishek1009/python zsh"
    ;;
    "Ephemeral Rust environment")
    echo "docker pull abhishek1009/rust:latest"
    echo "docker run -it --rm abhishek1009/rust zsh"
    ;;
    "Rust environment with new temporary directory")
    rand_dir="sandbox-<random>"
    echo "docker pull abhishek1009/rust:latest"
    echo "mkdir \"\$PWD/\$rand_dir\""
    echo "docker run -it --rm -v \"\$PWD/\$rand_dir\":/workspace/\"\$rand_dir\":rw -w /workspace/\"\$rand_dir\" abhishek1009/rust zsh"
    ;;
    "Rust environment in the current directory")
    curr_dir_name="$(basename \"$PWD\")"
    echo "docker pull abhishek1009/rust:latest"
    echo "docker run -it --rm -v \"\$PWD\":/workspace/\"\$curr_dir_name\":rw -w /workspace/\"\$curr_dir_name\" abhishek1009/rust zsh"
    ;;
    *)
    echo "No command"
    ;;
  esac
  '

  selected=$(printf "%s\n" "${options[@]}" | \
  fzf --prompt="Select an option: " \
    --preview="$preview_cmd" \
    --preview-window=right:60%:wrap,border-sharp --height=100% --layout=reverse --border=rounded --info=inline --style full)

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
  "Ephemeral Golang environment")
    golang_ephemeral
    ;;
  "Golang environment with new temporary directory")
    golang_temp
    ;;
  "Golang environment in the current directory")
    golang_curr
    ;;
  "Ephemeral Java environment")
    java_ephemeral
    ;;
  "Java environment with new temporary directory")
    java_temp
    ;;
  "Java environment in the current directory")
    java_curr
    ;;
  "Ephemeral JavaScript environment")
    js_ephemeral
    ;;
  "JavaScript environment with new temporary directory")
    js_temp
    ;;
  "JavaScript environment in the current directory")
    js_curr
    ;;
  "Ephemeral Python environment")
    python_ephemeral
    ;;
  "Python environment with new temporary directory")
    python_temp
    ;;
  "Python environment in the current directory")
    python_curr
    ;;
  "Ephemeral Rust environment")
    rust_ephemeral
    ;;
  "Rust environment with new temporary directory")
    rust_temp
    ;;
  "Rust environment in the current directory")
    rust_curr
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
