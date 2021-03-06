source $HOME/.config/dotfiles/zsh/env.zsh
source $ZSHFILES/antigen.zsh

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

autoload zmv
alias zmv='noglob zmv'
alias zcp='noglob zmv -C'
alias zln='noglob zmv -L'
alias zsy='noglob zmv -Ls'

alias cg="g++ -O2 -std=c++14 -lm"
alias t=todo.sh



export EDITOR=nvim

export PATH=~/.composer/vendor/bin:$PATH

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

