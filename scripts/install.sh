mkdir $HOME/.tmp

curl https://raw.githubusercontent.com/zchrykng/dotfiles/master/zsh/env.zsh > $HOME/.tmp/env.zsh

source $HOME/.tmp/env.zsh

if [[ "${OS}" == "mac" ]]; then
	xcode-select --install

	# install brew
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

	# brew installs that require options
	brew install git --with-pcre2 --with-persistent-https
	brew install ffmpeg --with-x265 --with-webp

	# brew installs that don't require options
	brew install node r ack git-flow-avh git-lfs go ctags editorconfig cloc gotags hub 

elif [[ "${OS}" == "debian" ]]; then
	sudo apt install git ffmpeg nodejs r ack git-flow git-lfs golang exuberant-ctags editorconfig cloc zsh

elif [[ "${OS}" == "fedora" ]]; then
	sudo dnf install git ffmpeg node r ack git-flow-avh git-lfs go ctags editorconfig cloc hub zsh
fi

# finish setting up installed utilities
git lfs install
sudo git lfs install --system

# setup dotfile repo
mkdir -p $DOTFILES
mkdir -p $ZSHFILES

git clone git@github.com:zchrykng/dotfiles $DOTFILES

ln -s "$DOTFILES/zshrc.zsh" ~/.zshrc
ln -s "$DOTFILES/vimrc.vim" ~/.vimrc


curl -L git.io/antigen > $ZSHFILES/antigen.zsh


if [[ "${OS}" == "mac" ]]; then
	sudo chsh -s /bin/zsh $USER
elif [[ "${OS}" == "debian" || "${OS}" == "fedora" ]]; then
	sudo chsh -s /usr/bin/zsh $USER
fi

rm -r $HOME/.tmp
