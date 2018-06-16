#! /bin/bash

mkdir $HOME/.tmp

curl https://raw.githubusercontent.com/zchrykng/dotfiles/master/zsh/env.zsh > $HOME/.tmp/env.zsh

source $HOME/.tmp/env.zsh

if [[ "${OS}" == "mac" ]]; then
	# install brew
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

	# brew installs that require options
	brew install git --with-pcre2 --with-persistent-https
	brew install ffmpeg --with-x265 --with-webp

	# brew installs that don't require options
	brew install node r ack git-flow-avh git-lfs go ctags editorconfig cloc gotags hub 

elif [[ "${OS}" == "debian" ]]; then
	sudo apt install git ffmpeg node r ack git-flow-avh git-lfs go ctags editorconfig cloc hub

elif [[ "${OS}" == "fedora" ]]; then
	sudo dnf install git ffmpeg node r ack git-flow-avh git-lfs go ctags editorconfig cloc hub
fi

# finish setting up installed utilities
sudo git lfs install
sudo git lfs install --system

# setup dotfile repo
mkdir -p $DOTFILES

git clone https://github.com/zchrykng/dotfiles $DOTFILES

ln -s "$(DOTFILES)/zshrc.zsh" ~/.zshrc
ln -s "$(DOTFILES)/vimrc.vim" ~/.vimrc


curl -L git.io/antigen > $ZSHFILES/antigen.zsh


rm -r $HOME/.tmp