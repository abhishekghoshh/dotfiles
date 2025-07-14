#!/bin/bash

# set the DOTFILES variable if not already set
if [ -z "$DOTFILES" ]; then
    export DOTFILES="$PWD"
fi
if ! grep -q '^export DOTFILES=' "$HOME/.zshrc"; then
    echo "" >> "$HOME/.zshrc"  # Add a newline for better readability
    # Append the DOTFILES variable to .zshrc
    echo "export DOTFILES=$DOTFILES" >> "$HOME/.zshrc"
fi
# set the zshrc file variable
export zshrc_file="$HOME/.zshrc"



# check if the DOTFILES variable is set, if not, then exit 1
if [ -z "$DOTFILES" ]; then
    echo "DOTFILES variable is not set. Please set it to the path of your dotfiles directory."
    exit 1
fi

# Function to link dotfiles
link_dotfiles() {
    echo "Linking dotfiles..."
    if [ ! -e "$HOME/.config/nvim" ]; then
        ln -sf "$DOTFILES/nvim" "$HOME/.config/nvim"
    else
        echo "$HOME/.config/nvim already exists. Skipping link."
    fi
    if [ ! -e "$HOME/.tmux.conf" ]; then
        ln -sf "$DOTFILES/tmux/.tmux.conf" "$HOME/.tmux.conf"
    else
        echo "$HOME/.tmux.conf already exists. Skipping link."
    fi

    if [ ! -e "$HOME/.config/alacritty" ]; then
        ln -sf "$DOTFILES/alacritty/alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"
    else
        echo "$HOME/.config/alacritty already exists. Skipping link."
    fi

    if [ ! -e "$HOME/.aerospace.toml" ]; then
        ln -sf "$DOTFILES/aerospace/.aerospace.toml" "$HOME/.aerospace.toml"
    else
        echo "$HOME/.aerospace.toml already exists. Skipping link."
    fi
}
# Function to link custom shell scripts
link_custom_shell_scripts() {
    # Define source and target directories
    export source_sh_dir="$DOTFILES/custom-shell-scripts"
    export target_sh_dir="$HOME/.config/custom-shell-scripts"

    # Ensure the target folder exists
    mkdir -p "$target_sh_dir"

    # Link all the custom .sh files to the target directory
    for file in "$source_sh_dir"/*.sh; do
        [ -e "$file" ] || continue
        ln -sf "$file" "$target_sh_dir/$(basename "$file")"
    done

    # Prepare the text to load all shell scripts from the target directory
    export load_all_shell_scripts_text="# Load all shell scripts from $target_sh_dir
for file in \"$target_sh_dir\"/*.sh; do
    [ -r \"\$file\" ] && source \"\$file\"
done"

    # Check if the text is already present in .zshrc
    if grep -Fq "# Load all shell scripts from $target_sh_dir" "$zshrc_file"; then
        echo "The text is already present in .zshrc."
    else
        echo "" >> "$zshrc_file"  # Add a newline for better readability
        echo "$load_all_shell_scripts_text" >> "$zshrc_file"
        echo "Text successfully appended to .zshrc."
    fi
}

customize_zsh() {
    # Check if the .zshrc file exists
    if [ ! -f "$zshrc_file" ]; then
        echo "Creating .zshrc file..."
        touch "$zshrc_file"
    fi

    # install ohmyzsh if not already installed
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        echo "Installing Oh My Zsh..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    else
        echo "Oh My Zsh is already installed."
    fi

    # install the plugins if not already installed
    if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
        git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    else
        echo "zsh-autosuggestions is already installed."
    fi
    if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    else
        echo "zsh-syntax-highlighting is already installed."
    fi
    

    # add zsh plugins if not already present
    plugins_line='plugins=(git zsh-autosuggestions zsh-syntax-highlighting kubectl helm github history-substring-search)'
    if grep -q '^plugins=' "$zshrc_file"; then
        # Replace the existing plugins= line
        if [[ "$OSTYPE" == "darwin"* ]]; then
            sed -i '' "s/^plugins=.*/$plugins_line/" "$zshrc_file"
        else
            sed -i "s/^plugins=.*/$plugins_line/" "$zshrc_file"
        fi
        echo "Replaced existing plugins line in .zshrc."
    else
        echo "" >> "$zshrc_file"
        echo "$plugins_line" >> "$zshrc_file"
        echo "Added plugins line to .zshrc."
    fi
}

download_fonts() {
    # Check if the fonts directory exists
    if [ ! -d "$HOME/.local/share/fonts" ]; then
        echo "Creating fonts directory..."
        mkdir -p "$HOME/.local/share/fonts"
    fi
    # Check if JetBrainsMono Nerd Font is already installed
    if ! ls "$HOME/.local/share/fonts" | grep -qi "JetBrainsMono"; then
        echo "JetBrainsMono Nerd Font not found. Downloading and installing..."
        wget -P "$HOME/.local/share/fonts" https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip \
            && cd "$HOME/.local/share/fonts" \
            && unzip -o JetBrainsMono.zip \
            && rm JetBrainsMono.zip \
            && fc-cache -fv
        echo "JetBrainsMono Nerd Font installed."
    else
        echo "JetBrainsMono Nerd Font is already installed."
    fi
}

set_powerlevel10k() {
    # Check if powerlevel10k is installed
    if [ -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
        echo "Powerlevel10k is already installed."
    else
        echo "Installing Powerlevel10k..."
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    fi
    # Check if the powerlevel10k theme is set in .zshrc
    if grep -q '^ZSH_THEME=' "$zshrc_file"; then
        # Replace existing ZSH_THEME line with powerlevel10k (works on both macOS and Linux)
        if [[ "$OSTYPE" == "darwin"* ]]; then
            sed -i '' 's/^ZSH_THEME=.*$/ZSH_THEME="powerlevel10k\/powerlevel10k"/' "$zshrc_file"
        else
            sed -i 's/^ZSH_THEME=.*$/ZSH_THEME="powerlevel10k\/powerlevel10k"/' "$zshrc_file"
        fi
        echo "Replaced existing ZSH_THEME with powerlevel10k in .zshrc."
    else
        echo "" >> "$zshrc_file"  # Add a newline for better readability
        echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> "$zshrc_file"
        echo "Powerlevel10k theme set in .zshrc."
    fi
    p10k_state_file="$DOTFILES/.state/.p10k.zsh"
    # copy the p10k state file if it exists
    if [ -f "$p10k_state_file" ]; then
        echo "Copying Powerlevel10k state file..."
        cp "$p10k_state_file" "$HOME/.p10k.zsh"
        echo "Powerlevel10k state file copied."
    else
        echo "Powerlevel10k state file not found. Skipping copy."
    fi

    # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
    # Add these lines to .zshrc if not already present
    if ! grep -Fxq '[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh' "$zshrc_file"; then
        echo "" >> "$zshrc_file"
        echo "# To customize prompt, run \`p10k configure\` or edit ~/.p10k.zsh." >> "$zshrc_file"
        echo '[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh' >> "$zshrc_file"
        echo "Powerlevel10k source line added to .zshrc."
    else
        echo "Powerlevel10k source line already present in .zshrc."
    fi
}

# Call the function
customize_zsh
download_fonts
set_powerlevel10k
link_custom_shell_scripts
link_dotfiles