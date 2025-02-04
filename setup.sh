chmod +x ~/.local/bin/*
chmod +x ~/scripts/*
cat ~/scripts/linux_default.sh >> ~/.bashrc

# reinstall conda if needed (e.g. for AWS)
# sudo rm -rf /opt/conda

~/scripts/conda_install.sh

mkdir -p ~/workspace
cd workspace
source ~/.bashrc

make_env temp

echo "conda activate temp" >> ~/.bashrc

rm -rf ~/scripts
rm -rf ~/setup.sh
