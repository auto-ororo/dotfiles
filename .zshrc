#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

export PATH="$HOME/Library/Android/sdk/platform-tools:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export BAT_THEME="Nord"

alias g='git'
alias v='nvim'

alias ls='lsd'
alias l='lsd -l'
alias ll='lsd -l'
alias la='lsd -la'
alias lt='lsd --tree'

alias teee='tee >(pbcopy)'

export PATH="$PATH:~/.local/bin"

export JAVA_HOME=/Applications/Android\ Studio.app/Contents/jbr/Contents/Home
export PATH=$PATH:$JAVA_HOME/bin

export PATH=$PATH:$HOME/.maestro/bin
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
eval "$(uv generate-shell-completion zsh)"
