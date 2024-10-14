## User specific aliases and functions
alias ll='ls -hAlF'
alias grep='grep --color'
alias jn='jupyter notebook --no-browser --port=8080 --NotebookApp.allow_origin='*' --NotebookApp.ip='0.0.0.0''

## History settings
export HISTSIZE=5000
export HISTFILESIZE=5000
export HISTCONTROL=ignoredups:erasedups

## HPC settings
export SPACK_PYTHON=$(which python)
module load spack &> /dev/null
source /home/apps/spack/share/spack/setup-env.sh &> /dev/null
spack load tmux

# module load git/2
if [[ $(hostname) == gpu* ]]; then
    spack load cuda@11.8.0  # if you want to use nvcc
fi

## Directory settings
# very important if home directory doesn't have enough space
# set symlinks to scratch
# ln -s /scratch/$USER/.cache ~/.cache
# other way is to change default cache path location
# export XDG_CACHE_HOME=/scratch/$USER/.cache

# ## other setup
# # Cargo setup
# . "$HOME/.cargo/env"
# # Zoxide, cd replacement
# eval "$(zoxide init bash)"
# # Set up fzf key bindings and fuzzy completion (use for fuzzy search)
# eval "$(fzf --bash)"
