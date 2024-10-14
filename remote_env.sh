# it is always best to create from a complete script only

conda create -n temp python=3.11 -y
conda activate temp

# check cuda version: 
nvcc -V

# many libraries need latest GLIBC versions, so check ldd --version before installing
ldd --version

# on paramganga you must use cuda <= 11.8 so download pytorch-cuda=11.8
pip install torch torchvision --index-url https://download.pytorch.org/whl/cu118
# conda install pytorch torchvision pytorch-cuda=11.8 -c pytorch -c nvidia -y

# uv for pip libraries
pip install uv
uv pip install jupyterlab seaborn timm gpustat

