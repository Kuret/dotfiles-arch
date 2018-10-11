#!/usr/bin/env bash
set -e

# Remove old links
sudo rm -rf ~/.xinitrc
sudo rm -rf ~/.Xresources
sudo rm -rf ~/bin
sudo rm -rf ~/.config/compton.conf
sudo rm -rf ~/.config/libinput-gestures.conf
sudo rm -rf ~/.config/alacritty/alacritty.yml
sudo rm -rf ~/.config/autorandr
sudo rm -rf ~/.config/bspwm
sudo rm -rf ~/.config/fish/config.fish
sudo rm -rf ~/.config/fish/functions/fish_prompt.fish
sudo rm -rf ~/.config/flashfocus/flashfocus.yml
sudo rm -rf ~/.config/kak/kakrc
sudo rm -rf ~/.config/nvim/init.vim
sudo rm -rf ~/.config/nvim/config
sudo rm -rf ~/.config/nvim/autoload
sudo rm -rf ~/.config/polybar/config
sudo rm -rf ~/.config/qutebrowser/config.py
sudo rm -rf ~/.config/qutebrowser/darculized-all-sites.css
sudo rm -rf ~/.config/ranger/rc.conf
sudo rm -rf ~/.config/ranger/scope.sh
sudo rm -rf ~/.config/sxhkd
sudo rm -rf ~/.config/twmn/twmn.conf

ln -sf $PWD/dotfiles/.xinitrc ~/.xinitrc
ln -sf $PWD/dotfiles/.Xresources ~/.Xresources
ln -sf $PWD/dotfiles/bin $HOME
chmod +x $HOME/bin/*

mkdir -p ~/.config
ln -sf $PWD/dotfiles/compton.conf ~/.config/compton.conf
ln -sf $PWD/dotfiles/libinput-gestures.conf ~/.config/libinput-gestures.conf
ln -sf $PWD/dotfiles/autorandr ~/.config
ln -sf $PWD/dotfiles/bspwm ~/.config
ln -sf $PWD/dotfiles/sxhkd ~/.config

mkdir -p ~/.config/alacritty
ln -sf $PWD/dotfiles/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

mkdir -p ~/.config/fish/functions
ln -sf $PWD/dotfiles/fish/config.fish ~/.config/fish/config.fish
ln -sf $PWD/dotfiles/fish/functions/fish_prompt.fish ~/.config/fish/functions/fish_prompt.fish

mkdir -p ~/.config/flashfocus
ln -sf $PWD/dotfiles/flashfocus/flashfocus.yml ~/.config/flashfocus/flashfocus.yml

mkdir -p ~/.config/kak
ln -sf $PWD/dotfiles/kak/kakrc ~/.config/kak/kakrc

mkdir -p ~/.config/nvim
ln -sf $PWD/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
ln -sf $PWD/dotfiles/nvim/config ~/.config/nvim
ln -sf $PWD/dotfiles/nvim/autoload ~/.config/nvim

mkdir -p ~/.config/polybar
ln -sf $PWD/dotfiles/polybar/config ~/.config/polybar/config

mkdir -p ~/.config/qutebrowser
ln -sf $PWD/dotfiles/qutebrowser/config.py ~/.config/qutebrowser/config.py
ln -sf $PWD/dotfiles/qutebrowser/darculized-all-sites.css ~/.config/qutebrowser/darculized-all-sites.css

mkdir -p ~/.config/ranger
ln -sf $PWD/dotfiles/ranger/rc.conf ~/.config/ranger/rc.conf
ln -sf $PWD/dotfiles/ranger/scope.sh ~/.config/ranger/scope.sh

mkdir -p ~/.config/twmn
ln -sf $PWD/dotfiles/twmn/twmn.conf ~/.config/twmn/twmn.conf

nvim --headless +UpdateRemotePlugins +qall >/dev/null 2>&1
nvim --headless +PlugInstall +qall >/dev/null 2>&1
