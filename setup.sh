#!/usr/bin/env bash
set -e

# Remove old links
sudo rm -rf ~/.config/autorandr
sudo rm -rf ~/.config/kak/kakrc
sudo rm -rf ~/.config/nvim/init.vim
sudo rm -rf ~/.config/nvim/config
sudo rm -rf ~/.config/nvim/autoload
sudo rm -rf ~/.config/ranger/rc.conf
sudo rm -rf ~/.config/ranger/scope.sh

mkdir -p ~/.config
ln -sf $PWD/dotfiles/autorandr ~/.config

mkdir -p ~/.config/kak
ln -sf $PWD/dotfiles/kak/kakrc ~/.config/kak/kakrc

mkdir -p ~/.config/nvim
ln -sf $PWD/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
ln -sf $PWD/dotfiles/nvim/config ~/.config/nvim
ln -sf $PWD/dotfiles/nvim/autoload ~/.config/nvim

mkdir -p ~/.config/ranger
ln -sf $PWD/dotfiles/ranger/rc.conf ~/.config/ranger/rc.conf
ln -sf $PWD/dotfiles/ranger/scope.sh ~/.config/ranger/scope.sh

nvim --headless +UpdateRemotePlugins +qall >/dev/null 2>&1
nvim --headless +PlugInstall +qall >/dev/null 2>&1
