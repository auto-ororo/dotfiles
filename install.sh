#!/bin/zsh

# add submodule
git submodule update --init --recursive

# prezto
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
 ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# symlink dotfiles
for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".gitmodules" ]] && continue
    [[ "$f" == ".gitignore" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue

    ln -sf ~/dotfiles/$f ~/$f
done

ln -sf ~/dotfiles/nvim ~/.config/nvim

# change shell
chsh -s $(which zsh)

source ~/dotfiles/.zshrc
source ~/dotfiles/.zpreztorc
