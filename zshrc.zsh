source ~/.config/antigen.zsh

export GOPATH=~/Go
export PATH=$GOPATH/bin:$HOME/.local/bin:$PATH



alias cg="g++ -O2 -std=c++14 -lm"

# Load the oh-my-zsh library
antigen use oh-my-zsh

# Bundles from the default repo
antigen bundle git
antigen bundle lein
antigen bundle command-line-found

# Syntax highlighting bundle
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme
antigen theme https://gitlab.com/zchrykng/zsh-themes.git zchrykng

# Apply antigen config
antigen apply