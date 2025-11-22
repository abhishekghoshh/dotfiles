# Java

Java Language Server Protocol configuration (`jdtls`) with debugging, testing, and code refactoring capabilities.

## Keymaps

### Code Organization
| Keymap | Command | Description |
|--------|---------|-------------|
| `<leader>jo` | `organize_imports()` | Organize imports |
| `<leader>ju` | `:JdtUpdateConfig` | Update project config |

### Code Extraction (Normal Mode)
| Keymap | Command | Description |
|--------|---------|-------------|
| `<leader>jv` | `extract_variable()` | Extract variable |
| `<leader>jc` | `extract_constant()` | Extract constant |

### Code Extraction (Visual Mode)
| Keymap | Command | Description |
|--------|---------|-------------|
| `<leader>jv` | `extract_variable(true)` | Extract variable from selection |
| `<leader>jc` | `extract_constant(true)` | Extract constant from selection |
| `<leader>jm` | `extract_method(true)` | Extract method from selection |

### Testing
| Keymap | Command | Description |
|--------|---------|-------------|
| `<leader>jt` | `test_nearest_method()` | Test nearest method |
| `<leader>jT` | `test_class()` | Test entire class |

## Features

- Eclipse JDT Language Server with Java 17 and 21 runtime support
- Integrated debugging and testing with DAP support
- Google Java code style formatting with custom style configuration
- Lombok support and incremental sync for better performance