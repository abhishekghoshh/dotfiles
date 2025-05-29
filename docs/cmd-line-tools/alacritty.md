

## Alacritty themes 

### How to Install and Set Alacritty Themes

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

## Alacritty config

```bash
import = [
    "~/.config/alacritty/themes/themes/coolnight.toml"
]

[ env ]
TERM = "xterm-256color"

[window]
padding.x = 10
padding.y = 10
# startup_mode = "fullscreen"
dimensions.columns = 250
dimensions.lines = 60

decorations = "Buttonless"

opacity = 0.5
blur = true

option_as_alt = "Both"

[font]
normal.family = "JetBrainsMono Nerd Font Mono"

size = 12
```