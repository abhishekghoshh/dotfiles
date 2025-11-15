#!/bin/bash

WORDS=(
  "apple" "bear" "cloud" "delta" "echo" "falcon" "garden" "harbor" "island"
  "jungle" "king" "lemon" "mercury" "nectar" "orange" "prairie" "quest"
  "river" "storm" "tulip" "unity" "valor" "willow" "xerox" "yellow" "zephyr"
)

random_word() {
  echo "${WORDS[RANDOM % ${#WORDS[@]}]}"
}

random_name() {
  count=$((RANDOM % 2 + 1))
  name=$(random_word)
  if [[ $count -eq 2 ]]; then
    name="$name-$(random_word)"
  fi
  echo "$name"
}

make_structure() {
  local base_dir="$1"
  local depth=$2

  mkdir -p "$base_dir"

  # Create files with bacon ipsum content
  num_files=$((RANDOM % 3 + 1))
  for ((i=0; i<num_files; i++)); do
    fname="$(random_name).txt"
    fpath="$base_dir/$fname"
    curl -s "https://baconipsum.com/api/?type=all-meat&paras=10&start-with-lorem=1" | jq -r '.[]' > "$fpath"
  done

  if (( depth <= 0 )); then
    return
  fi

  num_dirs=$((RANDOM % 2 + 1))
  for ((i=0; i<num_dirs; i++)); do
    dname=$(random_name)
    dpath="$base_dir/$dname"
    mkdir -p "$dpath"
    if (( RANDOM % 2 == 0 )); then
      make_structure "$dpath" $((depth - 1))
    fi
  done
}

base_dir=$(random_name)
echo "Creating base directory: $base_dir"
make_structure "$base_dir" $((RANDOM % 2 + 2))
