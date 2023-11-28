#!/bin/zsh

###########
#  Setup  #
###########
# Update dotfiles with yadm
alias yu="yadm pull && yadm bootstrap"

####################
#  File Operation  #
####################
# Touch file, creating intermediary folders if needed
function mkt() {
  if [ ! -f $1 ]; then
    mkdir -p $(dirname $1) && touch $1;
  else
    echo "File already exists"
  fi
}

#############
#  Colorls  #
#############
alias lc="colorls --sd"
alias ll="colorls --sd -ll"
alias la="colorls --sd -a"
alias lr="colorls --sd --report"

############
#  NeoVim  #
############
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias vd="nvim ."

#########
#  Git  #
#########
alias gcm="git checkout main"
alias gcd="git checkout develop"

#######################
#  VSCode Extensions  #
#######################
alias -s json=code
alias -s yml=code
alias -s js=code
alias -s ts=code

if [[ "$OSTYPE" == darwin* ]]; then
  source $XDG_CONFIG_HOME/homebrew/homebrew.zsh
fi
