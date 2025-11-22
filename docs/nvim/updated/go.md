# Go

Go development plugins (`nvim-dap-go` + `gopher.nvim`) for debugging and code generation in Go projects.

## Keymaps

### Go Debugging
| Keymap | Command | Description |
|--------|---------|-------------|
| `<leader>dgt` | `debug_test()` | Debug current Go test |
| `<leader>dgl` | `debug_last()` | Debug last Go test |

### Struct Tags
| Keymap | Command | Description |
|--------|---------|-------------|
| `<leader>gsj` | `:GoTagAdd json` | Add JSON struct tags |
| `<leader>gsy` | `:GoTagAdd yaml` | Add YAML struct tags |

## Features

- Go-specific debugging with test support via nvim-dap integration
- Automatic struct tag generation for JSON and YAML
- File type detection for Go files only
- Auto-installation of Go dependencies on build