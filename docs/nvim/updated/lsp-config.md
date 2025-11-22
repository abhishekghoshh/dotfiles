# LSP Config

Language Server Protocol configuration (`nvim-lspconfig`) with Mason package manager for automatic tool installation.

## Keymaps

### Code Actions & Navigation
| Keymap | Command | Description |
|--------|---------|-------------|
| `<leader>ca` | `vim.lsp.buf.code_action` | Show code actions (Normal/Visual) |
| `<leader>K` | `vim.lsp.buf.hover` | Show hover information |
| `<leader>fmt` | `vim.lsp.buf.format` | Format current buffer |

### Go to Definitions
| Keymap | Command | Description |
|--------|---------|-------------|
| `<leader>gD` | `vim.lsp.buf.declaration` | Go to declaration |
| `<leader>gd` | `vim.lsp.buf.definition` | Go to definition |
| `<leader>gr` | `vim.lsp.buf.references` | Show references |
| `<leader>gi` | `vim.lsp.buf.implementation` | Go to implementation |
| `<leader>D` | `vim.lsp.buf.type_definition` | Go to type definition |

### Diagnostics
| Keymap | Command | Description |
|--------|---------|-------------|
| `<leader>lf` | `vim.diagnostic.open_float` | Show floating diagnostic |
| `[d` | `vim.diagnostic.goto_prev` | Go to previous diagnostic |
| `]d` | `vim.diagnostic.goto_next` | Go to next diagnostic |
| `<leader>q` | `vim.diagnostic.setloclist` | Add diagnostics to location list |

### Workspace Management
| Keymap | Command | Description |
|--------|---------|-------------|
| `<leader>wa` | `vim.lsp.buf.add_workspace_folder` | Add workspace folder |
| `<leader>wr` | `vim.lsp.buf.remove_workspace_folder` | Remove workspace folder |
| `<leader>wl` | `vim.lsp.buf.list_workspace_folders` | List workspace folders |

### Completion & Help
| Keymap | Command | Description |
|--------|---------|-------------|
| `<leader>ls` | `vim.lsp.buf.signature_help` | Show signature help |
| `<C-Space>` | Completion trigger | Manual completion in insert mode |

## Installed Language Servers

### Core Languages
- **Lua**: `lua_ls` - Lua language server
- **TypeScript/JavaScript**: `tsserver` - TypeScript language server  
- **Java**: `jdtls` - Eclipse JDT Language Server
- **Go**: `gopls` - Go language server with auto-format and import organization

### Web Development
- **CSS**: `css-lsp` - CSS language server
- **HTML**: `html-lsp` - HTML language server
- **Deno**: `deno` - Deno runtime and language server

### Systems Programming
- **C/C++**: `clangd` - Clang language server
- **Rust**: `rust-analyzer` - Rust language server
- **Python**: `pyre` - Python language server

## Development Tools

### Formatters
- `stylua` - Lua formatter
- `prettier` - JavaScript/TypeScript/CSS formatter
- `clang-format` - C/C++ formatter
- `gofumpt` - Go formatter

### Go Tools
- `delve` - Go debugger
- `gotests` - Go test generator
- `golangci-lint` - Go linter
- `goimports` - Go import organizer

### Java Tools
- `java-test` - Java testing framework
- `java-debug-adapter` - Java debugging adapter

## Features

- Automatic installation and management of language servers
- Go-specific auto-formatting and import organization on save
- Comprehensive language support for modern development
- Integration with debugging and testing tools

