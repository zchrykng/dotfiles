#! /bin/bash

# install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# brew installs that require options
brew install git --with-pcre2 --with-persistent-https
brew install ffmpeg --with-x265 --with-webp

# brew installs that don't require options
brew install node r ack git-flow-avh git-lfs go ctags editorconfig cloc gotags hub 

# finish setting up installed utilities
git lfs install
git lfs install --system


# setup dotfile repo
mkdir -p ~/.config/dotfiles

git clone https://github.com/zchrykng/dotfiles ~/.config/dotfiles



curl -L git.io/antigen > ~/.config/antigen.zsh
