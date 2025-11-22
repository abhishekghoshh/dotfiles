# Parameter Renaming

Interactive symbol renaming plugin (`filipdutescu/renamer.nvim`) with visual feedback for refactoring variables, functions, and parameters.

## Keymaps

### Symbol Renaming
| Keymap | Command | Description |
|--------|---------|-------------|
| `<F2>` | `require("renamer").rename()` | Rename symbol (Insert mode) |
| `<leader>rn` | `require("renamer").rename()` | Rename symbol (Normal mode) |
| `<leader>rn` | `require("renamer").rename()` | Rename symbol (Visual mode) |

## Features

- Interactive popup interface for symbol renaming
- LSP integration for accurate symbol detection
- Real-time preview of rename changes
- Support for all modes (normal, insert, visual)