# Installation

### Install neovim with lua-jit
```
sudo apt update && sudo apt upgrade -y
sudo apt install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl
git clone https://github.com/neovim/neovim.git
cd neovim && git checkout stable
make CMAKE_BUILD_TYPE=Release
sudo make install
echo 'export PATH="$PATH:/path/to/neovim"' >> ~/.zshrc
source ~/.zshrc
```