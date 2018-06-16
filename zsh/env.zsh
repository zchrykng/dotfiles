unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac

if [[ "${machine}" == "Linux" ]] ; then
	if [[ -f /etc/debian_version ]]; then
		os=debian
	elif [[ -f /etc/fedora-release ]]; then
		os=fedora
	fi
elif [[ "${machine}" == "Mac" ]]; then
	os=mac
fi

export OS=$os
export CONFIGROOT=$HOME/.config
export DOTFILES=$CONFIGROOT/dotfiles
export ZSHFILES=$CONFIGROOT/zsh
export GOPATH=$HOME/Go
export PATH=$GOPATH/bin:$HOME/.local/bin:$PATH


