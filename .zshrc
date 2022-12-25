# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
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

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh" # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

export RBENV_ROOT=$(brew --prefix rbenv) 
export PATH=$RBENV_ROOT/bin:$PATH
eval "$(rbenv init -)"

# export PATH=$PATH:$HOME/tools/flutter/bin

export JAVA_HOME=/Applications/Android\ Studio.app/Contents/jre/Contents/Home
export PATH=$PATH:$JAVA_HOME/bin

export PATH="$HOME/.rbenv/bin:$PATH"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

. /opt/homebrew/opt/asdf/libexec/asdf.sh

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
