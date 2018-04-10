# Override shellder prompt colors
MSYS=" " # Need to pass the MSYS check in shellder theme to override git BG colors
DEFAULT_USER=`whoami`
SHELLDER_DIRECTORY_BG=black
SHELLDER_DIRECTORY_FG=white
SHELLDER_GIT_DIRTY_BG=yellow
SHELLDER_GIT_CLEAN_BG=cyan

# Zplug
if [ -f ~/.zplug/init.zsh ]; then
  source ~/.zplug/init.zsh
elif [ -f /usr/share/zsh/scripts/zplug/init.zsh ]; then
  source /usr/share/zsh/scripts/zplug/init.zsh
fi

zplugs=()
zplug 'simnalamburt/shellder', as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  echo; zplug install
fi

# Load plugins
zplug load
