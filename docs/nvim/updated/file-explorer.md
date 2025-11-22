# File Explorer

Tree-style file explorer (`nvim-tree.lua`) with Git integration and customizable icons for project navigation.

## Keymaps

### File Tree Control
| Keymap | Command | Description |
|--------|---------|-------------|
| `<C-n>` (Ctrl+n) | `:NvimTreeToggle` | Toggle file explorer |
| `<C-f>` (Ctrl+f) | `:NvimTreeFindFile` | Find current file in tree |
| `<C-S-n>` (Ctrl+Shift+n) | `:NvimTreeFocus` | Focus on file explorer |

## Features

- Left sidebar with 30 character width and adaptive sizing
- Git status indicators with custom glyphs (✗, ✓, ★)
- File type icons and folder arrows for visual navigation
- Auto-sync with current working directory and focused file