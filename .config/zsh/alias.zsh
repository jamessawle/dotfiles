#!/bin/zsh

###########
#  Setup  #
###########
# Update dotfiles with yadm
alias yu="yadm pull && yadm bootstrap"

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

case `uname` in
  Darwin)
    source $XDG_CONFIG_HOME/homebrew/homebrew.zsh
  ;;
esac
