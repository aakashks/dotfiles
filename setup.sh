chmod +x ~/.local/bin/*
chmod +x ~/scripts/*
chmod 600 ~/.netrc
cat ~/scripts/linux_default.sh >> ~/.bashrc

# uninstall current conda installation
# sudo rm -rf /opt/conda
# install miniconda (linux servers + servers w/o sudo access)
# not needed for AWS/GCP

# check for conda installation
if [which conda]; then
    echo "Conda is already installed"
else
    echo "Installing Miniconda..."
    ~/scripts/conda_install.sh
fi
# ~/scripts/conda_install.sh

# Additional setup
# ~/scripts/linux_setup.sh

mkdir -p ~/workspace
cd workspace

## conda environment
tmux new-session -d -s "setup" -n "setup"
tmux send-keys -t setup "make_env temp" C-m
echo "conda activate temp" >> ~/.bashrc

# pip install -U pip
# pip install -U uv

REPOS=(
    "https://github.com/aakashks/repo1.git"
)

for repo in ${REPOS[@]}; do
    repo_name=$(basename $repo .git)
    tmux new-session -d -s "$repo_name" -n "$repo_name"
    tmux send-keys -t $repo_name "git clone $repo && cd $repo_name" C-m
done

rm -rf ~/setup.sh
rm -rf ~/scripts
