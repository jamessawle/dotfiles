# Load environment variables from root .env file
if [ -f "$HOME/.env" ]; then
    export $(echo $(cat $HOME/.env | sed 's/#.*//g'| xargs) | envsubst)
fi

export NVM_DIR="$XDG_STATE_HOME/nvm"
export NVM_NO_USE=true
export NVM_AUTO_USE=true      # Auto-set Node version based on .nvmrc files

# ZPLUG_HOME based on Homebrew install
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# ZPlug plugins
zplug "agkozak/zsh-z"
zplug "marlonrichert/zsh-autocomplete"
zplug "zsh-users/zsh-completions"
zplug "lukechilds/zsh-nvm"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

source $XDG_CONFIG_HOME/zsh/alias.zsh
if [ $HOME/.alias.local ]; then
  source $HOME/.alias.local
fi

# 1Password CLI completions
eval "$(op completion zsh)"; compdef _op op

path=(
  $PATH
  $BREW_PREFIX/{bin,sbin}
  /usr/local/{bin,sbin}
  /usr/{bin,sbin}
  ~/.local/bin
  /{bin,sbin}
)

eval "$(starship init zsh)"
