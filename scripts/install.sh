#!/bin/bash

mkdir $HOME/.tmp

curl https://raw.githubusercontent.com/zchrykng/dotfiles/master/zsh/env.zsh > $HOME/.tmp/env.zsh

source $HOME/.tmp/env.zsh

if [[ "${OS}" == "mac" ]]; then
	xcode-select --install

	# install brew
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

elif [[ "${OS}" == "debian" ]]; then
	sudo apt install git ffmpeg nodejs r ack git-flow git-lfs golang exuberant-ctags editorconfig cloc zsh

elif [[ "${OS}" == "fedora" ]]; then
	sudo dnf install git ffmpeg node r ack git-flow-avh git-lfs go ctags editorconfig cloc hub zsh
fi

# setup dotfile repo
mkdir -p $DOTFILES
mkdir -p $ZSHFILES

git clone https://github.com/zchrykng/dotfiles $DOTFILES

inputfile="$DOTFILES/links/main.csv"
OLDIFS="$IFS"
IFS=","
while read NAME VALUES ; do
	eval "ln -s \"$DOTFILES/$NAME\" \"~/${VALUES[0]}\" "
done < "$inputfile"
IFS="$OLDIFS"

if [[ "${OS}" == "mac" ]]; then
	inputfile="$DOTFILES/links/mac.csv"
	OLDIFS="$IFS"
	IFS=","
	while read NAME VALUES ; do
		eval "ln -s \"$DOTFILES/$NAME\" \"~/${VALUES[0]}\" "
	done < "$inputfile"
	IFS="$OLDIFS"

	brew bundle install --global
fi

curl -L git.io/antigen > $ZSHFILES/antigen.zsh

if [[ "${OS}" == "mac" ]]; then
	sudo chsh -s /bin/zsh $USER
elif [[ "${OS}" == "debian" || "${OS}" == "fedora" ]]; then
	sudo chsh -s /usr/bin/zsh $USER
fi

rm -r $HOME/.tmp
