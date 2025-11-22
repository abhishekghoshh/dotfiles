# None-ls

Code formatting and linting plugin (`nvimtools/none-ls.nvim`) that integrates external tools with LSP for enhanced code quality.

## Keymaps

### Formatting
| Keymap | Command | Description |
|--------|---------|-------------|
| `<leader>gf` | `vim.lsp.buf.format` | Format current buffer |

## Active Sources

### Go Formatting
- **goimports_reviser** - Go import organization and formatting

## Commented Sources
*Available but currently disabled:*
- `stylua` - Lua code formatter
- `prettier` - JavaScript/TypeScript/CSS formatter  
- `erb_lint` - ERB template linting
- `gofumpt` - Go code formatter
- `golines` - Go line length formatter

## Features

- Automatic formatting on save for supported file types
- LSP integration for seamless editor experience
- Configurable formatting sources per project needs
- Auto-group management for clean autocmd handling