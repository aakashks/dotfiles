# this is for local osx machine
# starship
eval "$(starship init zsh)"

alias ll='ls -hlAF'
alias grep='grep --color'

# zsh auto suggestion
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# History file settings
HISTSIZE=10000
SAVEHIST=10000
# Prevent duplicates and save each command only once in the history
setopt HIST_IGNORE_DUPS   # Ignore duplicate commands in the history
setopt HIST_IGNORE_ALL_DUPS  # Remove older duplicate entries
setopt HIST_SAVE_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY

# color in terminal
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
autoload -U colors && colors

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# iterm2
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# zoxide setup
eval "$(zoxide init zsh)"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# Set up editor
export EDITOR="mate --wait"

# Set up aliases
source ~/.zsh_aliases

conda activate temp

make_env() {
    conda create -n $1 python=3.11 -y
    conda activate $1
    uv pip install jupyterlab notebook pandas seaborn scikit-learn
    uv pip install torch torchvision
}

clean_cache() {
    conda clean --all -y
    pip cache purge
    uv cache clean
    brew cleanup
}

convert_notebook() {
    jupyter nbconvert --no-prompt --to python $1
}
