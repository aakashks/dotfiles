make_env() {
    conda create -n $1 python=3.11 -y
    conda activate $1
    pip install uv
    uv pip install torch torchvision --index-url https://download.pytorch.org/whl/cu118
    uv pip install jupyter notebook rmate gpustat scikit-learn pandas seaborn
}

remove_env() {
    conda deactivate
    conda remove -n $1 --all -y
    conda clean --all -y
}

## HPC settings
export SPACK_PYTHON=$(which python)

load_spack() {
    module load spack &> /dev/null
    source /home/apps/spack/share/spack/setup-env.sh &> /dev/null
}

load_nvcc() {
    module load cuda/11.6 &> /dev/null
    # load_spack
    # spack load cuda@11.8.0
}

load_tmx() {
    # Check if tmux is installed
    if ! command -v tmux &> /dev/null; then
        echo "Tmux not found. Loading with Spack..."
        load_spack && spack load tmux
    fi

    # Confirm tmux loaded successfully
    if ! command -v tmux &> /dev/null; then
        echo "Error: Tmux could not be loaded. Please check your setup."
        return 1
    fi
}

tmx() {
    load_tmx
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

tmx_ls() {
    load_tmx
    tmux ls
}

tmx_kill() {
    load_tmx
    if [ -n "$1" ]; then
        tmux kill-session -t "$1"
    else
        for session in $(tmux list-sessions -F "#{session_name}"); do
            tmux kill-session -t "$session"
        done
    fi
}
