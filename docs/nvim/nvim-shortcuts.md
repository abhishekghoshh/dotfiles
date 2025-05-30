# Nvim default Shortcuts

## Important shortcuts
  - Use the Ctrl-^ or (Ctrl-6) shortcut to navigate back to the previously opened file stored in a buffer
  - Use (ctrl + o) to go forward and (ctrl + i) to go back
  - indentation on left and right (v to enter visual mode then press < or >) (but after pressing > it will indent the lines and unselect those, so we can use gb to restore last visual block)
  - leader key is space by default
  - space + c + h for cheetsheet opening and closing
  - only type space bar + wait for 2 sec it, it will suggest some next commands to type
  - Space + t + h (setting themes) [ctrl + p/n for going to previous and next option ]
  - Syntax highlighting [TSInstall #laungage_name] [:TSInstallInfo to check which language syntax highlighting s are installed]
  - Install all packages with mason (:MasonInstallAll)
  - :help lspconfig-all
  - File explorer [cntrl + n] 
    - m for bookmarking
    - a for adding new file
    - c for copy and p for paste file
    - r for renaming a file
    - d for deleting file
    - file navigation ina fuzzy finder (space + ff)
    - space + f + b for find only opened files
  - window management
    - Window navigation [ ctrl + h / j / k / l ]
    - Window management [vertical split (:vsp)  split (:sp)] 
    - Tab change (tab) (shift + tab) and close tab ( space + x )
  - Toggle line number [ space + n ]
  - open terminal
    - Horizontal ( space + h )
    - vertical ( space + v )
    - to get out of terminal or jump to other windows from terminal (ctrl-x then ctrl-ww)
  - others
    - go to normal mode then press :Lazy it will open the LazyVim installer
    - go to normal mode then enter :Mason oe :Lsp and hit tab it will suggest commad, it will work for other any command suggestion

## customization
  - neovim configs present in `~/.config/nvim/lua/custom`
    - if you want to change config, plugins and options for neovim chad then change configuration in chadrc.lua
    - id you want to change config, option and commands for neovim only then change configuration in init.lua