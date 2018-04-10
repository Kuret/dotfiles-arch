# Dotfiles

This repo contains my dotfiles for an Arch/Antergos install on Wayland+Gnome and development (primarily Elixir)

# Apps to install and setup

- sakura (terminal)
- git
- aurman (AUR Helper)
- zsh + zplug
- keybase-bin (encrypted files/chat/git)
- pkgbrowser
- paper-icon-theme
- oomox (To customize Gnome/gtk theme colors)

# Development

- chromedriver
- postgresql
- elixir
- neovim python-neovim
- ripgrep
- nodejs npm
- yarn

# Smooth login on encrypted filesystem

- plymouth
- gdm-plymouth

```
systemctl disable lightdm
systemctl enable gdm <- also enables Wayland login by default, lightdm has issues
```

Follow plymouth+silent boot arch wiki entries

# GNOME Extensions

- Activities Configurator
- No Title Bar
- Overview Titles Shrink
- Quick Close In Overview
- Dynamic Battery
- No Workspace Switcher Popup
- Workspace Navigator
- Gravatar
- Remove Dropdown Arrows
- Suspend Button
- Sound Input & Output Device Chooser

# Postgres setup

```
sudo -u postgres -i
initdb --locale $LANG -E UTF8 -D '/var/lib/postgres/data'
createuser --interactive
createdb <username>
```

Activate the service:
```
systemctl enable postgres
systemctl start postgres
```

# Symlinking dotfiles

The script requires root and will ask for the root password by itself, **don't start the script as root, use your normal user**

```
cd ~
git clone git@github.com:Kuret/dotfiles.git
cd dotfiles
chmod +x setup.sh
./setup.sh
```

# Permissions

- Visudo to set permissions how you want
- When setting NOPASSWD, remove the `/etc/sudoers.d/10-installer` file Antergos created

# TODO

- Add terminal config
- Add icon config
- Add themes
- Automatically install apps via Pacman/AUR

