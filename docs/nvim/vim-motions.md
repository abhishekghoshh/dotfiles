# vim motion cheatsheet



## Blogs

- [shortcutfoo](https://www.shortcutfoo.com/app/dojos/neovim/cheatsheet)
- [devhints](https://devhints.io/vim)
- [Vim Cheat Sheet](https://vim.rtorr.com/)
- [warp.dev](https://www.warp.dev/topic/vim)
- [vim-hero](https://www.vim-hero.com/lessons/basic-movement)

## Youtube

- [Vim Motions for absolute beginners!!!](https://www.youtube.com/watch?v=lWTzqPfy1gE)
  - [Intermediate Vim Motions and Pro Tips!!!](https://www.youtube.com/watch?v=nBjEzQlJLHE)
- [Vim Tips I Wish I Knew Earlier](https://www.youtube.com/watch?v=5BU2gBOe9RU)
  - [10 Advanced Vim Features (You Probably Didn't Know)](https://www.youtube.com/watch?v=gccGjwTZA7k)
- [Vim As Your Editor](https://www.youtube.com/playlist?list=PLm323Lc7iSW_wuxqmKx_xxNtJC_hJbQ7R)
- [Vim Tutorial for Beginners](https://www.youtube.com/watch?v=RZ4p-saaQkc)
- [30 Vim commands you NEED TO KNOW (in just 10 minutes)](https://www.youtube.com/watch?v=RSlrxE21l_k)



## Cursor Movement

| Command              | Description                                         |
|----------------------|----------------------------------------------------|
| `h`                  | Move cursor left                                   |
| `j`                  | Move cursor down                                   |
| `k`                  | Move cursor up                                     |
| `l`                  | Move cursor right                                  |
| `w`                  | Jump forward to the start of the next word         |
| `e`                  | Jump forward to the end of the current word        |
| `b`                  | Jump backward to the start of the previous word    |
| `gg`                 | Go to the first line of the file                   |
| `G` (`Shift+g`)      | Go to the last line of the file                    |
| `$` (`Shift+4`)      | Move cursor to the end of the current line         |
| `0`                  | Move cursor to the beginning of the current line   |
| `^` (`Shift+6`)      | Move cursor to the first non-empty character of the line |
| `)` (`Shift+0`)      | Move cursor to the start of the next sentence      |
| `ESC`                | Terminate insert mode                              |

## Additional Motion Shortcuts

| Shortcut                        | Description                                                                                   |
|----------------------------------|-----------------------------------------------------------------------------------------------|
| `Shift + Left Arrow`             | Move to the start of the previous word                                                        |
| `Shift + Right Arrow`            | Move to the start of the next word                                                            |
| `Shift + Down Arrow`             | Go to the ending line of the current page                                                     |
| `Shift + Up Arrow`               | Go to the starting line of the current page                                                   |
| `(` or `Shift + 9`               | Jump to the start of the previous sentence                                                    |
| `)` or `Shift + 0`               | Jump to the start of the next sentence                                                        |
| `}` or `Shift + ]`               | Jump to the start of the next paragraph (next empty line)                                     |
| `{` or `Shift + [`               | Jump to the start of the previous paragraph (previous empty line)                             |
| `[`                              | Go to the start of the first line                                                             |
| `]`                              | Go to the start of the last line                                                              |
| `Ctrl + b`                       | Move a page up (back)                                                                         |
| `Ctrl + f`                       | Move a page down (front)                                                                      |
| `Ctrl + u`                       | Move half a page up                                                                           |
| `Ctrl + d`                       | Move half a page down                                                                         |
| `%`                              | Jump to the matching parenthesis, bracket, or brace (useful for navigating code blocks)       |

## Editing

| Command              | Description                                         |
|----------------------|----------------------------------------------------|
| `d`                  | Delete (used with motions, e.g., `dw` to delete word) |
| `dd`                 | Delete current line                                |
| `3dd`                | Delete 3 lines                                     |
| `D`                  | Delete contents of line after the cursor           |
| `(Shift + j)`        | Remove empty lines and append the start of the next line to the end of the current line          |
| `C`                  | Delete contents of a line after the cursor and insert new text. Press ESC to end insertion.      |
| `dw`                 | Delete word                                                                                      |
| `4dw`                | Delete 4 words                                                                                   |
| `cw`                 | Change word                                                                                      |
| `x`                  | Delete character under cursor                                                                    |
| `r`                  | Replace character                                                                               |
| `R`                  | Overwrite characters from cursor onward                                                          |
| `s`                  | Substitute one character under cursor and continue to insert                                     |
| `S`                  | Substitute entire line and begin to insert at the beginning of the line                          |
| `~`                  | Change case of individual character                                                              |
| `y`                  | Yank (copy, used with motions, e.g., `yw` to yank word)                                          |
| `p`                  | Paste after cursor                                                                               |
| `P`                  | Paste before cursor (or after the current word)                                                  |
| `u`                  | Undo last change                                                                                 |
| `U`                  | Undo all changes to the entire line                                                              |
| `Ctrl+r`             | Redo last undone change                                                                          |

## Insert & Visual Modes

| Command                                   | Description                                                                                           |
|--------------------------------------------|-------------------------------------------------------------------------------------------------------|
| `i`                                       | Insert at cursor (enter insert mode)                                                                  |
| `a`                                       | Insert after cursor (enter insert mode)                                                               |
| `A`                                       | Insert at the end of line (enter insert mode)                                                         |
| `o`                                       | Open a new line below and enter insert mode                                                           |
| `v`                                       | Enter visual mode (select text)                                                                       |
| `v 10j` → `I var`                         | Select 10 lines, insert `var` at the start of each line                                               |
| `v 10j` → `A var;`                        | Select 10 lines, append `var;` at the end of each line                                                |
| `Ctrl+v` `5l` `10j` `Shift+I`              | Block select 5 columns across 10 lines, insert text at start, press ESC to apply to all lines         |
| `Ctrl+v` `5l` `10j` `Shift+A`              | Block select 5 columns across 10 lines, append text at end, press ESC to apply to all lines           |
| `Ctrl+v` `$` `10j` `Shift+A`               | Block select to end of line across 10 lines, append text, press ESC to apply to all lines             |
| `>` (in visual mode)                       | Indent selected lines to the right                                                                    |
| `<` (in visual mode)                       | Unindent selected lines to the left                                                                   |
| `Shift+o` (in visual mode)                 | Change selection direction to include the first line when selecting lines                             |

## Indentation

| Command      | Description                                                                                       |
|--------------|---------------------------------------------------------------------------------------------------|
| `>>`         | Indent the current line                                                                           |
| `4>>`        | Indent the next four lines                                                                        |
| `>3j`        | Indent the current line and the next three lines (from this line to three lines down)             |
| `>}`         | Indent all lines until the end of the paragraph (up to the first empty line, see `:help object-motions`) |
| `>ap`        | Indent all lines in the current paragraph                                                         |


## Commenting

| Action                      | Command / Plugin Example                | Description                                 |
|-----------------------------|-----------------------------------------|---------------------------------------------|
| Comment out a single line   | `gcc` (with [vim-commentary](https://github.com/tpope/vim-commentary) or [Comment.nvim](https://github.com/numToStr/Comment.nvim)) | Comment or uncomment the current line       |
| Comment out selected lines  | `gc` in visual mode (with plugin)       | Comment or uncomment the selected lines     |

## Finding and Replacing

| Action                                 | Command / Steps                                 | Description                                                                                   |
|-----------------------------------------|-------------------------------------------------|-----------------------------------------------------------------------------------------------|
| Find a word under cursor                | `*`                                             | Search for the next occurrence of the word under the cursor                                   |
| Find previous occurrence                | `#`                                             | Search for the previous occurrence of the word under the cursor                               |
| Find a specific word                    | `/word`                                         | Search forward for "word"                                                                     |
| Find and replace all occurrences        | `:%s/old/new/g`                                 | Replace all occurrences of "old" with "new" in the entire file                                |
| Find and replace in current line        | `:s/old/new/g`                                  | Replace all occurrences of "old" with "new" in the current line                               |
| Find and replace with confirmation      | `:%s/old/new/gc`                                | Replace all occurrences with confirmation (prompt before each replacement)                     |
| Find and replace one by one             | `:s/old/new/c`                                  | Replace with confirmation in the current line (prompt for each occurrence)                    |
| Find and replace in selection (visual)  | Select text, then `:s/old/new/g`                | Replace all occurrences in the visually selected lines                                        |
| Repeat last search                      | `n`                                             | Move to the next occurrence of the last search                                                |
| Repeat last search in opposite direction| `N`                                             | Move to the previous occurrence of the last search                                            |


## Line Numbers

| Command        | Description                                 |
|----------------|---------------------------------------------|
| `:set nu`      | Enable absolute line numbers                |
| `:set nu!`     | Toggle absolute line numbers                |
| `:set rnu`     | Enable relative line numbers                |
| `:set nornu`   | Disable relative line numbers               |

## Searching and Changing Words

| Command         | Description                                                                                      |
|-----------------|--------------------------------------------------------------------------------------------------|
| `*`             | Search for the next occurrence of the word under the cursor                                      |
| `n`             | Move to the next occurrence of the searched word                                                 |
| `N` (`Shift+n`) | Move to the previous occurrence of the searched word                                             |
| `ciw`           | Change inside word (delete the entire word and enter insert mode)                                |
| `.`             | Repeat the last change (e.g., after `ciw`, use `.` to change the next occurrence in the same way) |

## Common Scenarios

| Scenario                                                                 | Command(s) / Steps                                   | Description                                                                                   |
|--------------------------------------------------------------------------|------------------------------------------------------|-----------------------------------------------------------------------------------------------|
| Cursor anywhere on the first line, want to move to the start of the line | `0`                                                  | Move cursor to the beginning of the current line                                              |
| Cursor anywhere on the first line, want to move to the first non-blank   | `^`                                                  | Move cursor to the first non-empty character of the line                                      |
| Cursor anywhere on the first line, want to move to the end of the line   | `$`                                                  | Move cursor to the end of the current line                                                    |
| Cursor anywhere on the first line, want to delete the line               | `dd`                                                 | Delete the current line                                                                       |
| Cursor anywhere on the first line, want to change the whole line         | `cc`                                                 | Change (replace) the entire line and enter insert mode                                        |
| Cursor anywhere on the first line, want to yank (copy) the line          | `yy`                                                 | Yank (copy) the current line                                                                  |
| Cursor anywhere on the first line, want to append text at end            | `A`                                                  | Move to end of line and enter insert mode                                                     |
| Cursor anywhere on the first line, want to insert text at start          | `I`                                                  | Move to first non-blank character and enter insert mode                                       |
