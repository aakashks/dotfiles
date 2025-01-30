chmod +x ~/.local/bin/*
chmod +x ~/scripts/*
cat ~/scripts/bashrc >> ~/.bashrc

# reinstall conda if needed (e.g. for AWS)
# sudo rm -rf /opt/conda

./scripts/conda_install.sh

mkdir -p ~/workspace
cd workspace
make_env temp
