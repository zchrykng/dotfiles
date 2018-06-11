unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac

export CONFIGROOT=$HOME/.config
export DOTFILES=$CONFIGROOT/dotfiles
export ZSHFILES=$CONFIGROOT/zsh
export GOPATH=$HOME/Go
export PATH=$GOPATH/bin:$HOME/.local/bin:$PATH


