chmod +x ~/.local/bin/*
chmod +x ~/scripts/*
cat ~/scripts/linux_default.sh >> ~/.bashrc

# reinstall conda if needed (e.g. for AWS)
# sudo rm -rf /opt/conda

~/scripts/conda_install.sh

mkdir -p ~/workspace
cd workspace
source ~/.bashrc

## conda environment
make_env temp
echo "conda activate temp" >> ~/.bashrc

# pip install -U pip
# pip install -U uv

rm -rf ~/setup.sh
