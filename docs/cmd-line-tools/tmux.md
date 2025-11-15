# tmux configurations

**tmux loads all the configs from the `~/.tmux.conf`**
**If `~/.tmux.conf` is ineffective then try adding config in `~/.config/.tmux.conf`**

## Tmux Configuration

Go to this [.tmux.conf](https://github.com/abhishekghoshh/dotfiles/blob/master/tmux/.tmux.conf) and copy to your `~/.tmux.conf`


## Key bindings


### General
```sh
# Set leader key to ctrl+s
    ctrl + s

# Start tmux
    tmux

# Enter command mode (leader + :)
    <leader> :

# Install plugins (leader + Shift+I)
    <leader> I

# Update plugins (leader + Shift+U)
    <leader> U

# Uninstall plugins not in list (leader + Alt+u)
    <leader> alt u

# Saving the current session
    <leader> ctrl s

# reload the saved session
    <leader> ctrl r
```


### Panes
```bash
# Split a pane in half vertically
    <leader> %

# Split a pane in half horizontally
    <leader> 

# Go to different panes
    <leader> {arrow key}

# Move the current pane into a different pane
    <leader> {
    <leader> }

# Move to the desired pane using vim key binding 
    <leader> j  # for down
    <leader> k  # for up
    <leader> h  # for left
    <leader> l  # for right

# Move to the desired pane using vim key binding 
    <leader> <down-arrow>  # for down
    <leader> <up-arrow>  # for up
    <leader> <left-arrow>  # for left
    <leader> <right-arrow>  # for right

# Move to the desired pane
    <leader> q  # then press the number to go to that pane

# Toggle between different built-in pane layouts
    <leader> <space>

# Kill the current pane
    <leader> x

# Toggle full screen of a pane
    <leader> z

# Turn pane into a window
    <leader> !
```


### Window
```bash
# Create a new window
    <leader> c

# Go to the previous window
    <leader> p
    shift <left-arrow>

# Go to the next window
    <leader> n
    <shift> <right arrow>

# Go to a specifix window (0,1,2....)
    <leader> <window-number>

# Rename the window
    :rename-window <name>

# Kill the current window
    <leader> &
```


### Session
```bash
# Open a new session
    tmux

# Create a new session with name
    tmux new -s <session-name>

# Attach to the last active session
    tmux attach

# Attach to the session with session name
    tmux attach -t <session-name>

# Detach from the current session
    tmux detach

# List all the sessions
    tmux list-sessions
    tmux ls

# See the list of windows in a session
    <leader> w

# Detach the current session
    <leader> d

# See all the sessions in tmux
    <leader> s

# Create a session inside tmux
    :new 

# Rename a session
    :rename-session

# Kill current session
    :kill-session
```


### Copying
```bash
# Using mouse 
    press shift then select then copy the selected item
    type v  # it will select the text using visual mode
    ctrl c  # copy the text
    ctrl v  # paste the text

# Vim style
    <leader> [  # for going to the vim mode
    # then using vim commands go to the line
    type v  # it will select the text using visual mode
    ctrl c  # copy the text
    ctrl v  # paste the text
```



## Plugins

### tmux plugin manager

**Install TPM (tmux plugin manager)**
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

**Put this at the bottom of ~/.tmux.conf**

**List of plugins**
```
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
```

**Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)**
```
run '~/.tmux/plugins/tpm/tpm'
```

**Reload TMUX environment so TPM is sourced:**
```
# Type this in terminal if tmux is already running
tmux source ~/.tmux.conf
```

### Installing & uninstalling plugins
```
Add new plugin to ~/.tmux.conf with set -g @plugin '...'
Press prefix + I (capital I, as in Install) to fetch the plugin.
You're good to go! The plugin was cloned to ~/.tmux/plugins/ dir and sourced.

Remove (or comment out) plugin from the list.
Press prefix + alt + u (lowercase u as in uninstall) to remove the plugin.
All the plugins are installed to ~/.tmux/plugins/ so alternatively you can find plugin directory there and remove it.
```




## Links

- [Tmux Cheat Sheet & Quick Reference](https://tmuxcheatsheet.com/)
- [Tmux has forever changed the way I write code.](https://www.youtube.com/watch?v=DzNmUNvnB04)
  - [dreamsofcode-io/tmux/blob/main/tmux.conf](https://github.com/dreamsofcode-io/tmux/blob/main/tmux.conf)
- [TMUX in 100 seconds | Prime Reacts](https://www.youtube.com/watch?v=0eHZRPzbiJ0)
- [configure your tmux.](https://www.youtube.com/watch?v=wpODsyBHxH0)
- [typecraft](https://www.youtube.com/@typecraft_dev/playlists)
  - [TMUX and Terminal configuration](https://www.youtube.com/playlist?list=PLsz00TDipIfct4F3pHv6_uI9OyjphQEGZ)
  - [Tmux for Newbs. FREE TMUX COURSE](https://www.youtube.com/playlist?list=PLsz00TDipIfdrJDjpULKY7mQlIFi4HjdR)
- [tmux plugins]()
  - [tmux-sessionizer](https://github.com/edr3x/tmux-sessionizer)
  - [erikw/tmux-powerline](https://github.com/erikw/tmux-powerline)
  - [tmux-plugins/tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect)
