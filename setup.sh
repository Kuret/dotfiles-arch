#!/usr/bin/env bash
set -e

# Remove old links
sudo rm -rf ~/.npmrc
sudo rm -rf ~/.tmux.conf
sudo rm -rf ~/.zshrc
sudo rm -rf ~/.zsh
sudo rm -rf ~/.config/autorandr
sudo rm -rf ~/.config/dunst
sudo rm -rf ~/.config/nvim/init.vim
sudo rm -rf ~/.config/nvim/config
sudo rm -rf ~/.config/nvim/autoload
sudo rm -rf ~/.config/ranger/rc.conf
sudo rm -rf ~/.config/ranger/scope.sh
sudo rm -rf ~/.config/vala-panel

# Create symlinks
ln -sf $PWD/dotfiles/npmrc ~/.npmrc
ln -sf $PWD/dotfiles/tmux.conf ~/.tmux.conf
ln -sf $PWD/dotfiles/zshrc ~/.zshrc

mkdir -p ~/.zsh
ln -sf $PWD/dotfiles/zsh/alias.zsh ~/.zsh/alias.zsh
ln -sf $PWD/dotfiles/zsh/plug.zsh ~/.zsh/plug.zsh

mkdir -p ~/.config
ln -sf $PWD/dotfiles/autorandr ~/.config

mkdir -p ~/.config/dunst
ln -sf $PWD/dotfiles/dunst/dunstrc ~/.config/dunst/dunstrc

mkdir -p ~/.config/nvim
ln -sf $PWD/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
ln -sf $PWD/dotfiles/nvim/config ~/.config/nvim
ln -sf $PWD/dotfiles/nvim/autoload ~/.config/nvim

mkdir -p ~/.config/ranger
ln -sf $PWD/dotfiles/ranger/rc.conf ~/.config/ranger/rc.conf
ln -sf $PWD/dotfiles/ranger/scope.sh ~/.config/ranger/scope.sh

mkdir -p ~/.config/vala-panel
ln -sf $PWD/dotfiles/vala-panel/default ~/.config/vala-panel/default

nvim --headless +UpdateRemotePlugins +qall >/dev/null 2>&1
nvim --headless +PlugInstall +qall >/dev/null 2>&1
