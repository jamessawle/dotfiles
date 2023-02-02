export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.local/cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

export HISTFILE=$XDG_STATE_HOME/zsh/history
export LESSHISTFILE=$XDG_STATE_HOME/lesshst

export NVM_DIR=$XDG_STATE_HOME/nvm
export NVM_NO_USE=true
export NVM_AUTO_USE=true                        # Auto-set Node version based on .nvmrc files

export ZPLUG_HOME=/usr/local/opt/zplug          # ZPLUG_HOME based on Homebrew install

export STARSHIP_CACHE=$XDG_CACHE_HOME/starship
