## HPC settings

# Fixing locale (gpu fs usually misses locale so need to set manually)
export LOCPATH=~/locales
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export SPACK_PYTHON=$(which python)

load_spack() {
    # check if spack is installed
    if ! command -v spack &> /dev/null; then
        echo "Spack not found. Loading with module..."
        module load spack &> /dev/null
        source /home/apps/spack/share/spack/setup-env.sh &> /dev/null
    fi
}

load_nvcc() {
    module load cuda/11.6 &> /dev/null
    # load_spack
    # spack load gcc/lef6arr
    # spack load cuda/rxp7j5e
}
