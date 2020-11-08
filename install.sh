#!/bin/zsh

# add submodule
git submodule update --init --recursive

# prezto
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
 ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# symlink dotfiles
# ln -sf ~/dotfiles/.zprezto ~/.zprezto
# ln -sf ~/dotfiles/.vimrc ~/.vimrc
# ln -sf ~/dotfiles/.zshrc ~/.zshrc
# ln -sf ~/dotfiles/.zpreztorc ~/.zpreztorc
# ln -sf ~/dotfiles/.vim ~/.vim
# ln -sf ~/dotfiles/.ideavimrc ~/.ideavimrc

for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue

    ln -sf ~/dotfiles/$f ~/$f
done

# change shell
chsh -s $(which zsh)

source ~/dotfiles/.zshrc
source ~/dotfiles/.zpreztorc
