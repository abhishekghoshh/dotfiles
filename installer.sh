#!/bin/bash



# set the DOTFILES variable
# export DOTFILES=~/Desktop/personal-projects/dotfiles

# check if the DOTFILES variable is set, if not, then exit 1
if [ -z "$DOTFILES" ]; then
    echo "DOTFILES variable is not set. Please set it to the path of your dotfiles directory."
    exit 1
fi

# set the zshrc file variable
export zshrc_file="$HOME/.zshrc"


# Run the following lines one by one
ln -s $DOTFILES/nvim ~/.config/nvim
ln -s $DOTFILES/tmux/.tmux.conf ~/.tmux.conf
ln -s $DOTFILES/.config/alacritty ~/.config/alacritty




# Define source and target directories
export source_sh_dir="$DOTFILES/custom-shell-scripts"
export target_sh_dir="$HOME/.config/custom-shell-scripts" 

# link all the custom sh files to the zsh

mkdir -p "$target_sh_dir" # Ensure the target folder exists
# then loop through all .sh files in the source folder
for file in "$source_sh_dir"/*.sh; do
    [ -e "$file" ] || continue
    ln -sf "$file" "$target_sh_dir/$(basename "$file")"
done

# Add a custom script to .zshrc to load all shell scripts
export load_all_shell_scripts_text="# Load all shell scripts from $target_sh_dir
for file in \"$target_sh_dir\"/*.sh; do
    [ -r \"\$file\" ] && source \"\$file\"
done"

# Check if the text is already present
if grep -Fq "# Load all shell scripts from $target_sh_dir" "$zshrc_file"; then
    echo "The text is already present in .zshrc."
else
    # Append the text
    echo "" >> "$zshrc_file"  # Add a newline for better readability
    echo "$load_all_shell_scripts_text" >> "$zshrc_file"
    echo "Text successfully appended to .zshrc."
fi

source "$zshrc_file"