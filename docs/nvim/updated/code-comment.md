# Comment

Smart commenting plugin (`numToStr/Comment.nvim`) that automatically detects comment syntax for any filetype with motion support.

## Keymaps

### Toggle Comments
| Keymap | Command | Description |
|--------|---------|-------------|
| `gcc` | Toggle line | Toggle line comment |
| `gbc` | Toggle block | Toggle block comment |

### Operator-Pending Mode
| Keymap | Command | Description |
|--------|---------|-------------|
| `gc` | Line operator | Line comment with motion (e.g., `gc3j`, `gcip`) |
| `gb` | Block operator | Block comment with motion (e.g., `gb2w`, `gbiw`) |

### Extra Comments
| Keymap | Command | Description |
|--------|---------|-------------|
| `gcO` | Comment above | Add comment on line above |
| `gco` | Comment below | Add comment on line below |
| `gcA` | Comment EOL | Add comment at end of line |

## Features

- Auto-detects comment syntax for different file types
- Proper spacing between comment characters and content
- Works with Vim motions and text objects
- Cursor stays in position after operations