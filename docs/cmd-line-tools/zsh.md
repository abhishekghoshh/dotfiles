
# All ZSH related config & links are here

## ZSH

### Setup ZSH with oh-my-zsh, fonts, suggestions and powerlevel10k

```zsh
# Install it using package manager
sudo apt install zsh

# Make it default browser
chsh -s $(which zsh)

# Verify using this command
echo $0
echo $SHELL

# Install oh-my-zsh plugin manager using curl
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Edit the ~/.zshrc file and change this ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"



# Install plugins (zsh-autosuggestions and zsh-syntax-highlighting)

# Download zsh-autosuggestions :
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
# Download zsh-syntax-higlighting :
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# Edit ~/.zshrc file, find plugins=(git) replace plugins=(git) with :
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)



# Install and move the nerd-fonts(JetBrainsMono) using the following command
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip \
&& cd ~/.local/share/fonts \
&& unzip JetBrainsMono.zip \
&& rm JetBrainsMono.zip \
&& fc-cache -fv


# Now Save the file, and then open a new terminal. The powerline may looks broken.
# Install the powerline 
sudo apt-get install fonts-powerline



#  Install powerlevel10k for Oh my zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Now, edit the ZSH_THEME in ~/.zshrc file into
ZSH_THEME="powerlevel10k/powerlevel10k"

# Open a new terminal, and you should see the powerlevel10k theme has applied.
# If the p10k configuration wizard does not start automatically, 
# you can run the configuration wizard the powerlevel10k theme with this command 
p10k configure
```

### Youtube
- [This Zsh config is perhaps my favorite one yet. | powerlevel10k](https://www.youtube.com/watch?v=ud7YxC33Z3w)


### Blogs 
- [Install NerdFont (or any fonts) using the command line in Debian (or other Linux).](https://medium.com/@almatins/install-nerdfont-or-any-fonts-using-the-command-line-in-debian-or-other-linux-f3067918a88c)
- [Setup Zsh + Oh my Zsh + Powerlevel10k + Dracula theme with auto-suggestions and syntax-higlighting](https://medium.com/@satriajanaka09/setup-zsh-oh-my-zsh-powerlevel10k-on-ubuntu-20-04-c4a4052508fd)



## fzf

### Youtube
- [This may be my favorite CLI tool ever](https://www.youtube.com/watch?v=oTNRvnQLLLs)
- [FZF Will CHANGE How You Work](https://www.youtube.com/watch?v=MvLQor1Ck3M)



## zoxide

### configure setup

```zsh
# Add this to your zsh config
eval "$(zoxide init zsh)"
```


### Youtube
- [zoxide has forever improved the way I navigate in the terminal.](https://www.youtube.com/watch?v=aghxkpyRVDY)




## Command line password manager

### Youtube
- [This is perhaps my favorite password manager for the terminal](https://www.youtube.com/watch?v=FhwsfH2TpFA)


