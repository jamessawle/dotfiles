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
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export browser="${BROWSER:-open}"
fi

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

#
# ZSH plugin management
#

# Z auto-completion configuration
export ZSHZ_DATA=$XDG_STATE_HOME/z/z
export ZSHZ_TILDE=1

export ZPLUG_HOME=/usr/local/opt/zplug          # ZPLUG_HOME based on Homebrew install

export STARSHIP_CACHE=$XDG_CACHE_HOME/starship

#
# Darwin
#

case `uname` in
  Darwin)
    # Make Apple Terminal behave
    export SHELL_SESSIONS_DISABLE=1
  ;;
esac


