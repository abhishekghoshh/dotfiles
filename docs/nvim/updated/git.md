# Git

Git integration plugins (`vim-fugitive` + `gitsigns.nvim`) for version control operations and visual Git status indicators.

## Keymaps

### Git Signs
| Keymap | Command | Description |
|--------|---------|-------------|
| `<leader>ggp` | `:Gitsigns preview_hunk` | Preview current hunk changes |
| `<leader>ggt` | `:Gitsigns toggle_current_line_blame` | Toggle line blame annotations |

### Fugitive Commands
| Command | Description |
|---------|-------------|
| `:Git` | Run any Git command in Neovim |
| `:Git history` | View Git history |

## Features

- Inline Git status indicators and change highlighting
- Hunk preview and navigation for reviewing changes
- Line-by-line blame annotations toggle
- Full Git command integration through vim-fugitive