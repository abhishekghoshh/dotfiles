# Common Neovim Keymaps

This document contains all the common key mappings used across the Neovim configuration.

## Normal Mode Keymaps

### Basic Commands
| Keymap | Action | Description |
|--------|--------|-------------|
| `;` | `:` | Quick command mode access |
| `ZZ` | `:qa` | Quit all |
| `ZZZ` | `:qa!` | Force quit all |
| `<C-z>` | `:undo` | Undo last change (Ctrl + z) |
| `<C-r>` | `:redo` | Redo the last change (Ctrl + r) |
| `<Esc>` | `:noh` | Clear search highlights (Escape key) |

### Window Navigation
| Keymap | Action | Description |
|--------|--------|-------------|
| `<C-h>` | `<C-w>h` | Move to left window (Ctrl + h) |
| `<C-l>` | `<C-w>l` | Move to right window (Ctrl + l) |
| `<C-j>` | `<C-w>j` | Move to window below (Ctrl + j) |
| `<C-k>` | `<C-w>k` | Move to window above (Ctrl + k) |
| `<Tab>` | `:tabnext` | Go to next tab |
| `<S-Tab>` | `:tabprevious` | Go to previous tab |

### Window Resizing
| Keymap | Action | Description |
|--------|--------|-------------|
| `<C-Up>` | `:resize -2` | Decrease window height |
| `<C-Down>` | `:resize +2` | Increase window height |
| `<C-Right>` | `:vertical resize -2` | Decrease window width |
| `<C-Left>` | `:vertical resize +2` | Increase window width |

### File Operations
| Keymap | Action | Description |
|--------|--------|-------------|
| `<C-s>` | `:w` | Save current file |
| `<C-c>` | `:%y+` | Copy entire file to system clipboard |

### Line Numbering
| Keymap | Action | Description |
|--------|--------|-------------|
| `<leader>nu` | `:set nu!` | Toggle line numbers |
| `<leader>rnu` | `:set rnu!` | Toggle relative line numbers |

### Movement (Smart Line Wrapping)
| Keymap | Action | Description |
|--------|--------|-------------|
| `j` | Smart down | Move down (respects line wrapping) |
| `k` | Smart up | Move up (respects line wrapping) |
| `<Up>` | Smart up | Move up (respects line wrapping) |
| `<Down>` | Smart down | Move down (respects line wrapping) |

### Buffer Management
| Keymap | Action | Description |
|--------|--------|-------------|
| `<leader>b` | `:enew` | Create new buffer |

## Insert Mode Keymaps

| Keymap | Action | Description |
|--------|--------|-------------|
| `<C-z>` | `<C-o>u` | Undo in insert mode |

## Visual Mode Keymaps

### Indentation
| Keymap | Action | Description |
|--------|--------|-------------|
| `>` | `>gv` | Indent and reselect |
| `<` | `<gv` | Unindent and reselect |

### Movement (Smart Line Wrapping)
| Keymap | Action | Description |
|--------|--------|-------------|
| `<Up>` | Smart up | Move up (respects line wrapping) |
| `<Down>` | Smart down | Move down (respects line wrapping) |

### Clipboard Operations
| Keymap | Action | Description |
|--------|--------|-------------|
| `<leader>y` | `"+y` | Copy selection to system clipboard |

## Terminal Mode Keymaps

| Keymap | Action | Description |
|--------|--------|-------------|
| `<C-x>` | `<C-\><C-N>` | Exit terminal mode |

## Visual-Block Mode (x) Keymaps

### Movement (Smart Line Wrapping)
| Keymap | Action | Description |
|--------|--------|-------------|
| `j` | Smart down | Move down (respects line wrapping) |
| `k` | Smart up | Move up (respects line wrapping) |

### Paste Behavior
| Keymap | Action | Description |
|--------|--------|-------------|
| `p` | Smart paste | Paste without copying replaced text |

## Notes

- **Smart Movement**: The `j`, `k`, `<Up>`, and `<Down>` keys use expression mappings to handle line wrapping intelligently. They behave like `gj`/`gk` for wrapped lines unless a count is provided.
- **Leader Key**: The `<leader>` key is typically mapped to `\` by default, but may be customized in your configuration.
- **System Clipboard**: Several mappings interact with the system clipboard using the `+` register.
- **Window Operations**: Window navigation and resizing use standard Vim conventions with Ctrl modifiers.