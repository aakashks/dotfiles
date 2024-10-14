# this is for local osx machine
# starship
eval "$(starship init zsh)"

alias ll='ls -hlAF'
alias grep='grep --color'

# zsh auto suggestion
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# History file settings
HISTSIZE=5000
SAVEHIST=10000
# Prevent duplicates and save each command only once in the history
setopt HIST_IGNORE_DUPS   # Ignore duplicate commands in the history
setopt HIST_IGNORE_ALL_DUPS  # Remove older duplicate entries
setopt HIST_SAVE_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_SPACE

# color in terminal
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# iterm2
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# zoxide setup
eval "$(zoxide init zsh)"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

export VISUAL="subl --wait"
