# Start X at login
if status --is-login
    if test -z "$DISPLAY" -a $XDG_VTNR = 1
        exec startx
    end
end

set -U fish_greeting

# Set editor to kakoune
set -gx VISUAL kak
set -gx EDITOR $VISUAL

# Load custom config for ranger
set -gx RANGER_LOAD_DEFAULT_RC FALSE

# ASDF
source ~/.asdf/asdf.fish

set -gx KERL_CONFIGURE_OPTIONS "--disable-debug --without-javac"

# Set PATH
set -gx PATH $HOME/bin $HOME/.local/bin $npm_packages/bin /var/lib/snapd/snap/bin $PATH

# Aliases
alias db "mix deps.get; and yarn; and node_modules/brunch/bin/brunch build; and mix ecto.migrate"
alias dms "mix deps.get; and yarn; and node_modules/brunch/bin/brunch build; and mix phx.server"
alias dup "git checkout master; and git pull --rebase; and mix deps.get; and mix ecto.migrate; and yarn; and node_modules/brunch/bin/brunch build"
alias ga "git add"
alias gaa "git add -A"
alias gca "git commit --amend"
alias gco "git checkout"
alias gl "git log --graph --oneline"
alias gld "git log --graph --oneline origin/development.."
alias glm "git log --graph --online origin/master.."
alias gp "git push"
alias gpr "git pull --rebase"
alias gr "git rebase"
alias grd "git fetch -p; and git rebase origin/development"
alias grm "git fetch -p; and git rebase origin/master"
alias gst "git status"
alias iem "iex -S mix"
alias ls "ls_extended"
alias lsl "ls_extended -l"
alias mixg "mix gettext.extract; and mix gettext.merge priv/gettext --no-fuzzy"
alias vi "kak"

# Git commit alias
function gc; git commit -m "$argv"; end
function gcp; git commit -m "$argv"; and git push; end

# Find dirs/files and cd/open/edit it
function fd; pushd (rofi-dirs $argv); end
function ff; open (rofi-files $argv); end
function fe; kak (rofi-files $argv); end

# Launch a command and disown it
function kbye; fish -c "$argv & disown"; end

fortune | cowsay | lolcat
