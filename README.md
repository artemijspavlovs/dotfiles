### npm because the world runs on js

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
source ~/.bashrc
command -v nvm
nvm install node # "node" is an alias for the latest version
```

### cargo because a smaller portion of the world runs on rust

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source ~/.bashrc
command -v cargo
```

### some linux stuff for neovim

```bash
sudo apt install unzip

```

### neovim

[linux: debian install](https://github.com/neovim/neovim/blob/master/INSTALL.md#debian)

```bash
# Add stable PPA
sudo add-apt-repository ppa:neovim-ppa/stable -y

# Update package list
sudo apt update

# Install Neovim
sudo apt install neovim
```

add to `~/.bashrc`

```bash
export PATH="$PATH:/opt/nvim-linux64/bin"
```

[mac: install - homebrew](https://github.com/neovim/neovim/blob/master/INSTALL.md#homebrew-on-macos-or-linux)

```bash
brew install neovim
```

```bash
cp -r nvim/ ~/.config/
```
