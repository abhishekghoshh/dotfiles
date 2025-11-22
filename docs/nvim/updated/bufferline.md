# Bufferline

Visual buffer management plugin (`akinsho/bufferline.nvim`) that displays open buffers as clickable tabs with file icons and hover effects.

## Keymaps

### Buffer Navigation
| Keymap | Command | Description |
|--------|---------|-------------|
| `<Tab>` | `:BufferLineCycleNext` | Switch to next buffer |
| `<S-Tab>` | `:BufferLineCyclePrev` | Switch to previous buffer |

### Buffer Closing
| Keymap | Command | Description |
|--------|---------|-------------|
| `<leader>xx` | `:bdelete` | Close current buffer |
| `<leader>xa` | `:BufferLineCloseOthers` | Close all other buffers |
| `<leader>x[` | `:BufferLineCloseLeft` | Close buffers to the left |
| `<leader>x]` | `:BufferLineCloseRight` | Close buffers to the right |

## Features

- Tab-like interface with file type icons
- Mouse support and hover-to-reveal close buttons
- Visual indicators for modified files and active buffer
- **Customizable**: Extensive configuration options for appearance and behavior