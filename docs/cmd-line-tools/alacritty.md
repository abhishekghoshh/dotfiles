# Alacritty configurations

**tmux loads all the configs from the `~/.tmux.conf`**

## Alacritty Configuration

Go to this [alacritty.toml](https://github.com/abhishekghoshh/dotfiles/blob/master/alacritty/alacritty.toml) and copy to your `~/.config/alacritty/alacritty.toml`


## Alacritty themes 

How to Install and Set Alacritty Themes

1. **Clone the Alacritty themes repository:**
    ```bash
    mkdir -p ~/.config/alacritty/themes
    git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
    ```

2. **Set your desired theme in `alacritty.toml`:**
    ```toml
    import = [
         "~/.config/alacritty/themes/themes/{theme}.toml"
    ]
    ```
    Replace `{theme}` with the name of the theme you want to use (e.g., `coolnight`).

For more themes, browse the [alacritty-theme repository](https://github.com/alacritty/alacritty-theme).

##  config

