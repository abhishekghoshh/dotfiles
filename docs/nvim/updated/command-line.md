# Terminal

Floating terminal plugin (`akinsho/toggleterm.nvim`) with multiple terminal layouts and integrated Git UI support.

## Keymaps

### Terminal Toggle
| Keymap | Command | Description |
|--------|---------|-------------|
| `<C-\>` | Open/Close | Toggle main terminal |

### Terminal Types
| Keymap | Command | Description |
|--------|---------|-------------|
| `<leader>tf` | `:ToggleTerm direction=float` | Floating terminal |
| `<leader>th` | `:ToggleTerm direction=horizontal` | Horizontal terminal |
| `<leader>tv` | `:ToggleTerm direction=vertical` | Vertical terminal |

### Special Terminals
| Keymap | Command | Description |
|--------|---------|-------------|
| `<leader>tg` | `_LAZYGIT_TOGGLE()` | LazyGit interface |
| `<leader>tt` | `_HTOP_TOGGLE()` | Htop system monitor |

### Terminal Mode Navigation
| Keymap | Command | Description |
|--------|---------|-------------|
| `<Esc>` | Exit terminal mode | Switch to normal mode |
| `jk` | Exit terminal mode | Switch to normal mode |
| `<C-h>` | Window left | Move to left window |
| `<C-j>` | Window down | Move to window below |
| `<C-k>` | Window up | Move to window above |
| `<C-l>` | Window right | Move to right window |

## Features

- Floating terminal with curved borders and transparency
- Multiple terminal directions (horizontal, vertical, float)
- Integrated LazyGit for Git operations
- Persistent terminal size and auto-insert mode