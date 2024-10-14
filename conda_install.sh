# removing existing conda installation
# sudo rm -rf /opt/conda

mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh

export PATH=~/miniconda3/bin:$PATH
~/miniconda3/bin/conda init bash
source ~/.bashrc
