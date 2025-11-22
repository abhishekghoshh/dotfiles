# Which Key

Interactive keymap display plugin (`folke/which-key.nvim`) that shows available keybindings in a popup when you start typing a command.

## Keymaps

### Core Commands
| Keymap | Command | Description |
|--------|---------|-------------|
| `<leader>w` | `:w!` | Save current file |
| `<leader>q` | `:wqall!` | Quit Neovim after saving |
| `<leader>k` | `:bdelete` | Kill/close current buffer |
| `<leader>p` | `:Lazy` | Open plugin manager |

### Popup Navigation
| Keymap | Command | Description |
|--------|---------|-------------|
| `<C-d>` | Scroll down | Scroll down in which-key popup |
| `<C-u>` | Scroll up | Scroll up in which-key popup |

## Features

- Interactive popup showing available keybindings after prefix keys
- Built-in help for marks, registers, and spelling suggestions
- Preset bindings for motions, text objects, and window operations
- Rounded border popup positioned at bottom with custom icons
- Auto-trigger setup with blacklist for insert/visual mode navigation