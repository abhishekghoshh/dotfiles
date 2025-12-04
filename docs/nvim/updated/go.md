# Go

## Youtube

- [The perfect Neovim setup for Go](https://www.youtube.com/watch?v=i04sSQjd-qo)


## Setup Guide

Based on the [Neovim Go config reference](https://github.com/dreamsofcode-io/neovim-go-config/tree/main).

### 1. LSP Server Setup

Download and configure `gopls` (official Go LSP server):
- Install via Mason or `go get`
- Add LSP configuration

### 2. Auto-formatting on Save

Choose between `gopls` or `null-ls` plugin:

**Using null-ls (requires additional tools):**
```bash
go install -v github.com/incu6us/goimports-reviser/v3@latest
go install github.com/segmentio/golines@latest
```

Tools used: `gofumpt`, `goimports_reviser`, `golines`

**Manual formatting:** `:lua vim.lsp.buf.format()`

**Note:** Using gopls for auto-formatting if null-ls has issues.

### 3. Debugging with Delve

Install Delve debugger:
```bash
go install github.com/go-delve/delve/cmd/dlv
```

**If Delve is unrecognized, add to PATH:**
```bash
export PATH=$PATH:~/go/bin/dlv
export PATH=$PATH:$(go env GOPATH)/bin
~/go/bin/dlv version
```

Go development plugins (`nvim-dap-go` + `gopher.nvim`) for debugging and code generation in Go projects.

## Keymaps

### Go Debugging
| Keymap | Command | Description |
|--------|---------|-------------|
| `<space>db` | Debug breakpoint | Toggle debug breakpoint |
| `<space>dn` | `:DapStepOver` | Step over to next line |
| `<space>dc` | `:DapContinue` | Continue to next breakpoint |
| `<space>du` | Debug UI | Open debug UI |
| `<leader>dgt` | `debug_test()` | Debug current Go test |
| `<leader>dgl` | `debug_last()` | Debug last Go test |

### Go Navigation
| Keymap | Command | Description |
|--------|---------|-------------|
| `gd` | Go to definition | Navigate to definition |
| `gD` | Go to declaration | Navigate to declaration |

### Struct Tags (gopher.nvim)
| Keymap | Command | Description |
|--------|---------|-------------|
| `<leader>gsj` | `:GoTagAdd json` | Add JSON struct tags |
| `<leader>gsy` | `:GoTagAdd yaml` | Add YAML struct tags |

## Commands

### Module Management
```vim
:GoMod tidy              " Run go mod tidy
:GoMod init <name>       " Run go mod init
:GoGet <package>         " Install Go package
```

### Interface Implementation
```vim
:GoImpl [receiver] [interface]    " Generate interface implementation
:GoImpl [interface]               " Generate for struct under cursor
```

### Testing
```vim
:GoTestAdd               " Add test for current function
:GoTestsAll              " Generate all tests
:GoTestsExp              " Generate exported tests
```

### Code Generation
```vim
:GoGenerate              " Run go generate in current directory
:GoGenerate %            " Run go generate for current file
:GoCmt                   " Generate doc comment for current symbol
:GoIfErr                 " Generate if err != nil block
```

### Treesitter
```vim
:TSInstall go            " Install Go grammar for Treesitter
```

## Features

- Go-specific debugging with test support via nvim-dap integration
- Automatic struct tag generation for JSON and YAML
- File type detection for Go files only
- Auto-installation of Go dependencies on build