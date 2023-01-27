HISTFILE="$XDG_STATE_HOME/zsh/history"

source $ZPLUG_HOME/init.zsh

zplug "agkozak/zsh-z"
zplug "marlonrichert/zsh-autocomplete"
zplug "zsh-users/zsh-completions"
zplug "lukechilds/zsh-nvm"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load

source $XDG_CONFIG_HOME/zsh/alias.zsh
if [ $HOME/.alias.local ]; then
  source $HOME/.alias.local
fi

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
