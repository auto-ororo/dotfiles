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

: "Multi-user Hack" && {
    compaudit > /dev/null 2>&1 || { 
        echo "Need to change file ownership of zsh completion"
        sudo -v || exit
        compaudit 2>/dev/null | sudo xargs chown $(whoami)
    }
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export BAT_THEME="Nord"

