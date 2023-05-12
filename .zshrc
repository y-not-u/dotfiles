# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/john/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

eval "$(starship init zsh)"

# export
export PATH="$PATH:$HOME/.local/bin"
export EDITOR=/usr/bin/nvim

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases
