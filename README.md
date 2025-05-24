# All configs and setups in a single repo



## Youtube channels to follow

- [typecraft](https://www.youtube.com/@typecraft_dev/videos)
- [DevOps Toolbox](https://www.youtube.com/@devopstoolbox/videos)
  - [omerxx/dotfiles](https://github.com/omerxx/dotfiles)
- [ThePrimeTime](https://www.youtube.com/@ThePrimeTimeagen/videos)
- [TheVimeagen](https://www.youtube.com/@TheVimeagen/playlists)
- [TJ DeVries](https://www.youtube.com/@teej_dv)
- [Michael Horn](https://www.youtube.com/@MichaelNROH)
- [Josean Martinez](https://www.youtube.com/@joseanmartinez/videos)


## Need to install 
```
git (gh, gh-dash)
zsh(oh-my-zsh + powerlevel10k + plugins)
zoxide
fzf bat 
lazygit tig lazydocker
nvim tmux 
iterm2 alacritty
posting (a cmd version of postman)
yazi (file reader)
rainfrog(db tool)
lua, gcc, go, rust, java, scala, node, npm

hyperland
Aerospace
startship
Raycast

Yazi - Terminal file explorer (Check it surely)
```

## Some other packages to explore
```
kitty zathura zellij
```

## install everything in your local system
```
# check the configurations once then run this
git clone https://github.com/abhishekghoshh/dotfiles ~/.config/dotfiles &&
  cd ~/.config/dotfiles && chmod +x installer.sh && ./installer.sh"
```


## To test the dotfiles inside container execute the following command
```
docker run --rm -it --name sandbox ubuntu bash -c "apt-get update && apt-get upgrade -y && 
  apt-get install -y git &&
  mkdir -p ~/.config/dotfiles &&
  git clone https://github.com/abhishekghoshh/dotfiles ~/.config/dotfiles &&
  cd ~/.config/dotfiles && chmod +x installer.sh && ./installer.sh"
```


## Documentation using mkdocs
```
# install python, pip, libcairo2-dev or cairo

pip install --upgrade pip
pip install -r /path/to/requirements.txt
pip install mkdocs mkdocs-material mkdocs-rtd-dropdown pillow cairosvg
pip3 freeze > requirements.txt

# to create the mkdocs repo for the current directory
mkdocs new . 
mkdocs serve
```

## Softwares and their open source replacements
```
Notion -> Appflowy https://github.com/AppFlowy-IO/AppFlowy
Microsoft Office -> LibreOffice https://github.com/LibreOffice

AirTable -> Nocodb https://github.com/nocodb/nocodb

Salesforce -> ERPNext https://github.com/frappe/erpnext
Jira -> Plane https://github.com/makeplane/plane
Slack -> Mattermost https://github.com/mattermost/mattermost
Zoom -> Jitsi https://github.com/jitsi

Firebase -> Convex, Appwrite, Supabase, PocketBase
Firebase -> Instant https://github.com/instantdb/instant

Vercel -> Coolify https://github.com/coollabsio/coolify
Hereko -> Dokku https://github.com/dokku/dokku

```

## Saas Platforms
- [aiven](https://aiven.io/)



## AI tools
```
perplexity -> https://www.perplexity.ai/
chatGPT -> https://chatgpt.com/
claude -> https://claude.ai/
phind -> https://www.phind.com/

aistudio by google -> https://aistudio.google.com/
gemini -> https://gemini.google.com
notebooklm -> https://notebooklm.google.com/

gamma for presentation -> https://gamma.app/

The AI Code Editor (cursor) -> https://www.cursor.com/

Turn product ideas into concepts instantly with GenAI -> https://uizard.io/

Napkin turns your text into visuals so sharing your ideas is quick and effective -> https://www.napkin.ai/

AI Meeting Assistant -> https://otter.ai/
Automate your meeting notes -> https://fireflies.ai/
```