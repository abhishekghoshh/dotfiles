# Telescope

Fuzzy finder and picker plugin (`nvim-telescope/telescope.nvim`) with FZF integration for file navigation, searching, and Git operations.

## Keymaps

### File Operations
| Keymap | Command | Description |
|--------|---------|-------------|
| `<leader>ff` | `:Telescope find_files` | Find files in project |
| `<leader>fa` | `:Telescope find_files follow=true no_ignore=true hidden=true` | Find all files (including hidden/ignored) |
| `<leader>fb` | `:Telescope buffers` | Find open buffers |
| `<leader>fo` | `:Telescope oldfiles` | Find recently opened files |

### Search Operations
| Keymap | Command | Description |
|--------|---------|-------------|
| `<leader>fg` | `:Telescope live_grep` | Live grep search in project |
| `<leader>fz` | `:Telescope current_buffer_fuzzy_find` | Fuzzy find in current buffer |

### Git Operations
| Keymap | Command | Description |
|--------|---------|-------------|
| `<leader>gc` | `:Telescope git_commits` | Browse Git commits |
| `<leader>gs` | `:Telescope git_status` | View Git status |

### Utilities
| Keymap | Command | Description |
|--------|---------|-------------|
| `<leader>fh` | `:Telescope help_tags` | Search help documentation |
| `<leader>ma` | `:Telescope marks` | Browse bookmarks/marks |

### Navigation Within Telescope
| Keymap | Action | Description |
|--------|--------|-------------|
| `<C-j>` | Move down | Next selection |
| `<C-k>` | Move up | Previous selection |
| `<C-q>` | Send to quickfix | Add selections to quickfix list |
| `<C-d>` | Scroll down | Scroll preview down |
| `<C-u>` | Scroll up | Scroll preview up |

## Features

- FZF native integration for fast fuzzy searching
- Horizontal layout with preview window and custom borders
- Ripgrep integration for powerful text searching
- UI-select extension for enhanced selection interfaces