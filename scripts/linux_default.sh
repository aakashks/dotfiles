# alias ls='ls --color=auto'

# some more ls aliases
# alias ll='ls -hAlF'
# alias la='ls -A'
# alias l='ls -A'

## History settings
HISTSIZE=10000
HISTFILESIZE=20000
HISTCONTROL=ignoreboth

export PATH="$HOME/.local/bin:$HOME/bin:$HOME/go/bin:$HOME/.cargo/bin:$PATH"

# export EDITOR="micro"

# . "$HOME/.cargo/env"
# Zoxide, cd replacement
eval "$(zoxide init bash)"
# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

# export PATH="$PATH:$HOME/.local/bin:$HOME/bin:$HOME/go/bin:$HOME/.cargo/bin"

