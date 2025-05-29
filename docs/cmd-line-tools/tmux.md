# tmux configurations

**tmux loads all the configs from the `~/.tmux.conf`**

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

# Toggle between different built-in pane layouts
    <leader> <space>

# Kill the current pane
    <leader> x

# Toggle full screen of a pane
    <leader> z
```


### Window
```bash
# Create a new window
    <leader> c

# Go to the previous window
    <leader> p

# Go to the next window
    <leader> n

# Rename the window
    :rename-window <name>

# Kill the current window
    <leader> &
```


### Session
```bash
# See the list of windows in a session
    <leader> w

# Detach the current session
    <leader> d

# List all the sessions
    tmux list-sessions
    tmux ls

# Attach to the last active session
    tmux attach

# Detach from the current session
    tmux detach

# Open a new session
    tmux

# See all the sessions in tmux
    <leader> s

# Rename a session
    :rename-session

# Kill current session
    :kill-session
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


## Tmux Configuration

```bash
# unbinding the leader r and changing to source the config
unbind r
bind r source-file ~/.tmux.conf


# changing the leader key
set -g prefix C-s

# set the mouse scrolling for tmux
setw -g mouse on

# act like vim
set -g mode-keys vi
bind-key h select-pane -L
bind-key j select-pane -D
bind-key k select-pane -U
bind-key l select-pane -R


# download the tmux plugin manager and add tmux plugin here

# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'dracula/tmux'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -s default-terminal 'xterm-256color'

set -g @dracula-show-powerline true
set -g @dracula-fixed-location "Kolkata"
set -g @dracula-plugins "battery weather time"
set -g @dracula-show-fahrenheit false
set -g @dracula-show-flags true
set -g @dracula-show-left-icon session
set -g status-position bottom

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
```


## Links

- [Tmux has forever changed the way I write code.](https://www.youtube.com/watch?v=DzNmUNvnB04)
- [TMUX in 100 seconds | Prime Reacts](https://www.youtube.com/watch?v=0eHZRPzbiJ0)