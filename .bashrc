## User specific aliases and functions
alias ll='ls -hAlF'
alias l='ls -A --color=auto'
alias grep='grep --color'
alias jn='jupyter notebook --no-browser --port=8080 --ip='0.0.0.0''

## History settings
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTCONTROL=ignoreboth

alias free-mem="free -h"                     # Show memory usage
alias usage='du -h --max-depth=1'            # Disk usage of directories
alias df='df -h'                             # Disk space usage
alias ports='netstat -tulnp'                 # Open ports and services

source ~/hpc_config.sh
