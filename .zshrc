if [ $(uname -s)="Darwin" ]; then
  source $ZPLUG_HOME/init.zsh
fi

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
if [ -f $XDG_CONFIG_HOME/custom/alias.zsh ]; then
  source $XDG_CONFIG_HOME/custom/alias.zsh
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
