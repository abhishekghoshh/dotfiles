# HTTP Request Client

REST client plugin (`mistweaverco/kulala.nvim`) for sending HTTP requests directly from Neovim with support for .http and .rest files.

## Keymaps

### Request Execution
| Keymap | Command | Description |
|--------|---------|-------------|
| `<leader>SR` | Send request | Execute HTTP request under cursor |
| `<leader>SAR` | Send all requests | Execute all requests in current file |

### Utilities
| Keymap | Command | Description |
|--------|---------|-------------|
| `<leader>OSR` | Open scratchpad | Open HTTP request scratchpad |

## Features

- Native support for .http and .rest file formats
- Interactive request execution with response display
- Scratchpad for quick HTTP request testing
- Disabled global keymaps for custom configuration control