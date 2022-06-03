#!/bin/zsh

# Homebrew Tap
brew tap sanemat/font
brew tap homebrew/cask-fonts

# Install libraries by Homebrew
brew install bat rbenv nvm needle fzf neovim pyenv openssl readline libyaml zlib
brew install --cask iterm2 android-studio slack visual-studio-code alfred notion authy todoist karabiner-elements android-file-transfer 1password font-hack-nerd-font

# Install Ricty
brew install ricty
cp -f /opt/homebrew/opt/ricty/share/fonts/Ricty*.ttf ~/Library/Fonts/
fc-cache -vf

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

mkdir -p ~/.config
ln -sf ~/dotfiles/nvim ~/.config

# change shell
chsh -s $(which zsh)

source ~/dotfiles/.zshrc
source ~/dotfiles/.zpreztorc
