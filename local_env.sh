conda create -n temp python=3.11 -y
conda activate temp

uv pip install jupyterlab pandas seaborn scikit-learn
uv pip install torch torchvision

uv cache clean
conda clean --all -y
