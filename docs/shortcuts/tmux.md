# tmux configurations

**tmux loads all the configs from the `~/.tmux.conf`**


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

### Installing plugins
```
Add new plugin to ~/.tmux.conf with set -g @plugin '...'
Press prefix + I (capital I, as in Install) to fetch the plugin.
You're good to go! The plugin was cloned to ~/.tmux/plugins/ dir and sourced.
```

### Uninstalling plugins
```
Remove (or comment out) plugin from the list.
Press prefix + alt + u (lowercase u as in uninstall) to remove the plugin.
All the plugins are installed to ~/.tmux/plugins/ so alternatively you can find plugin directory there and remove it.
```



## Key bindings


### General
**The leader key**
```
ctrl + s
```

**Open tmux**
```
tmux
```

**Open a command mode in tmux**
```
<leader> :
```

**Install new plugins from GitHub or any other git repository and refresh TMUX environment**
```
<leader> I
```

**Update plugin(s)**
```
<leader> U
```

**Remove/uninstall plugins not on the plugin list**
```
<leader> alt u
```



### Panes

**Split a pane in half vertically**
```
<leader> %
```

**Split a pane in half horizontally**
```
<leader> "
```

**Go to different panes**
```
<leader> {arrow key}
```

**Move the current pane into a different pane**
```
<leader> {
<leader> }
```

**Toggle between different built-in pane layouts**
```
<leader> <space>
```

**Kill the current pane**
```
<leader> x
```

**Toggle full screen of a pane**
```
<leader> z
```


### Window
**Create a new window**
```
<leader> c
```

**Go to the previous window**
```
<leader> p
```

**Go to the next window**
```
<leader> n
```

**Rename the window**
```
:rename-window <name>
```

**Kill the current window**
```
<leader> &
```

### Session

**See the list of windows in a session**
```
<leader> w
```

**Detach the current session**
```
<leader> d
```

**List all the sessions**
```
tmux list-sessions
tmux ls
```

**Attach to the last active session**
```
tmux attach
```

**Detach from the current session**
```
tmux detach
```

**Open a new session**
```
tmux
```

**See all the sessions in tmux**
```
<leader> s
```

**Rename a session**
```
:rename-session
```

**Kill current session**
```
:kill-session
```
