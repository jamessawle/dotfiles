#
# XDG
#

# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_STATE_HOME=${XDG_STATE_HOME:-$HOME/.local/state}
export XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR:-$HOME/.xdg}

for xdgdir in XDG_{CONFIG,CACHE,DATA,STATE}_HOME XDG_RUNTIME_DIR; do
  [[ -e ${(P)xdgdir} ]] || mkdir -p ${(P)xdgdir}
done

#
# Editors
#
export EDITOR="${EDITOR:-nvim}"
export VISUAL="${VISUAL:-code}"
export PAGER="${PAGER:-bat}"

#
# Regional Settings
#
export LANG="${LANG:-en_US.UTF-8}"

# OS specific environment variables
if [[ "$OSTYPE" == darwin* ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"         # Setup homebrew shell integrations

  export ZPLUG_HOME=/opt/homebrew/opt/zplug         # ZPLUG_HOME based on Homebrew install
  export ZPLUG_INIT=$ZPLUG_HOME/init.zsh

  export SHELL_SESSIONS_DISABLE=1                   # Make Apple Terminal behave
else
  export ZPLUG_HOME=$XDG_DATA_HOME/zplug
  export ZPLUG_INIT=/usr/share/zsh/scripts/zplug/init.zsh
fi

export STARSHIP_CACHE=$XDG_CACHE_HOME/starship
