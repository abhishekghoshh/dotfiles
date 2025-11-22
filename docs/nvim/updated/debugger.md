# Debugger

Debug Adapter Protocol implementation (`nvim-dap`) with visual debugging interface for various programming languages.

## Keymaps

### Breakpoint Management
| Keymap | Command | Description |
|--------|---------|-------------|
| `<leader>db` | `dap.toggle_breakpoint` | Toggle breakpoint at current line |

### Debug Control
| Keymap | Command | Description |
|--------|---------|-------------|
| `<leader>dc` | `dap.continue` | Continue execution to next breakpoint |
| `<leader>dn` | `:DapStepOver` | Step over to next line |

### Debug Interface
| Keymap | Command | Description |
|--------|---------|-------------|
| `<leader>dui` | `widgets.sidebar` | Open debugging sidebar with scopes |

## Features

- Visual debugging interface with automatic UI opening/closing
- Support for multiple languages including Java configuration
- Breakpoint management with toggle functionality
- Debug sidebar with variable scopes and watch expressions