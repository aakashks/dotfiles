alias ll='ls -hAlF'
alias l='ls -A'
alias less='less -R'

alias free-mem="free -h"                     # Show memory usage
alias usage='du -h --max-depth=1'            # Disk usage of directories
alias df='df -h'                             # Disk space usage
alias ports='netstat -tulnp'                 # Open ports and services

alias jn='jupyter notebook --no-browser --port=8080 --ip='0.0.0.0''

make_env() {
    conda create -n $1 python=3.12 -y
    conda activate $1
    pip install uv
    uv pip install torch torchvision --index-url https://download.pytorch.org/whl/cu121
    uv pip install jupyter notebook rmate gpustat scikit-learn pandas seaborn jupyterlab pillow tqdm wandb click rich
    uv pip install python-dotenv loguru fire einsum einops aiohttp icecream ruff plotly torchmetrics lovely_tensors
}

remove_env() {
    conda deactivate
    conda remove -n $1 --all -y
    conda clean --all -y
}

# tmux fix bash history
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

tmx() {
    # load_tmx
    # If a session name is provided, attach to it or create it if it doesn't exist
    if [ -n "$1" ]; then
        if tmux has-session -t "$1" 2>/dev/null; then
            tmux -u -CC attach -t "$1"
        else
            echo "Creating new tmux session named $1"
            tmux -u -CC new-session -s "$1"
        fi
    else
        # No session name provided, start a regular tmux session
        tmux -u -CC
    fi
}

extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.tar.xz)    tar xf $1   ;;
      *.tar.lrz)   lrztar -d $1 ;; 
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted with ex" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
