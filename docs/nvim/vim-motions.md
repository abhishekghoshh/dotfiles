# vim motion cheatsheet

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

## Editing
| Command              | Description                                         |
|----------------------|----------------------------------------------------|
| `d`                  | Delete (used with motions, e.g., `dw` to delete word) |
| `dd`                 | Delete current line                                |
| `3dd`                | Delete 3 lines                                     |
| `D`                  | Delete contents of line after the cursor           |
| `C`                  | Delete contents of a line after the cursor and insert new text. Press ESC to end insertion. |
| `dw`                 | Delete word                                        |
| `4dw`                | Delete 4 words                                     |
| `cw`                 | Change word                                        |
| `x`                  | Delete character under cursor                      |
| `r`                  | Replace character                                  |
| `R`                  | Overwrite characters from cursor onward            |
| `s`                  | Substitute one character under cursor and continue to insert |
| `S`                  | Substitute entire line and begin to insert at the beginning of the line |
| `~`                  | Change case of individual character                |
| `y`                  | Yank (copy, used with motions, e.g., `yw` to yank word) |
| `p`                  | Paste after cursor                                 |
| `P`                  | Paste before cursor (or after the current word)    |
| `u`                  | Undo last change                                   |
| `U`                  | Undo all changes to the entire line                |
| `Ctrl+r`             | Redo last undone change                            |

## Insert & Visual Modes
| Command              | Description                                         |
|----------------------|----------------------------------------------------|
| `i`                  | Insert at cursor (enter insert mode)               |
| `a`                  | Write after cursor (enter insert mode)             |
| `A`                  | Write at the end of line (enter insert mode)       |
| `o`                  | Open a new line below (enter insert mode)          |
| `v`                  | Visual mode (select text)                          |






## Things to remember
1. toggle the relative line number, when you want to jump directly to next or previous lines
   1. **in nvchad**
      1. :set rnu
      2. :set nornu
2. Mapping esc to any other key ( caps lock)
3. :normal  (normal mode) change multiple line in the same time
   1. (v 10j) -> :normal Ivar [first select 10 consecutive lines and then insert var at the start]
   2. (v 10j) -> :normal A end; [first select 10 consecutive lines and then append end; at the end]
4. change multiple line in the same time ( from the middle of sentence or at the end )
   1. go to the start of the word then (ctrl + v) then (5l + 10j) then (shift + I) to insert then type your text and press ESC to apply the changes for the next 10 lines
   2. go to the start of the word then (ctrl + v) then (5l + 10j) then (shift + A) to Append then type your text and press ESC to apply the changes for the next 10 lines
   3.**To append a text for the next lines** : (ctrl + v) then press (shift + 4) or $ to selct to the end of the line then use 10 j to select next 10 lines and then (shift + A) to Append and type your changes and press ESC to apply your changes for the next 10 lines.
5. Sometime when we are selecting lines and we forgot the first line then we can use (ctrl + o) which will change the direction of the selecting and select the first line
6. % to go to starting or ending of the parenthesis. We can use it to select the entire content inside those parenthesis, or also we can go to the function


(shift + j) => remove empty lines and append the start of the next line to the end of the current line 


(shift + left arrow) go to the starting of the previous word
(shift + right arrow) go to the starting of the next word

(shift + down arrow) go the ending line of the current page
(shift + up arrow) go the starting line of the current page


#### Jump between lines
Press ( or (shift + 9) to go to the start of previous line
press ) or (shift + 0) to go to the start of next line


#### Jump between paragraphs
Press } or (shift + ] ) to go to the start of previous empty line
Press { or (shift + [ ) to go to the start of next empty line


Press [ to go to the start of the first line
Press ] to go to the start of the last line



ctrl + b to move a page screen back or "up"
ctrl + f to move a page screen front or "down"
ctrl + u to move a ½ page screen up.
ctrl + d to move a ½ page screen down.


Select a code block 
click > for right shift
click < for left shift

If you are normal mode, with your cursor anywhere on the first line:

>> will indent that line,
4>> will indent all four lines,
>3j will do the same thing in a different way (indent from this line to three lines down),
>} will indent all of the lines until the end of the paragraph (i.e. to the first empty line, see :help object-motions), and
>ap will indent all of the line


hjkl -> left,down,up,right
go to word in normal mode, and press * to go to next occurances of the word and we can use n and shift+n to go forward and backword for word occurance
ciw to change in word,(delete the entire word) we can use . for to change the next occurance into same word


#### Command Description	
```


