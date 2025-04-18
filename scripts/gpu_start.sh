#!/bin/bash
#SBATCH --job-name=job          # Job name
#SBATCH --partition=dgx            # Partition (queue) name
#SBATCH --gres=gpu:4               # Request 4 GPUs
#SBATCH --ntasks=1                 # Number of tasks (typically 1 for interactive jobs)
#SBATCH --cpus-per-gpu=5           # Request 5 CPUs per GPU
#SBATCH --time=infinite            # Time limit (hh:mm:ss)

# Load necessary modules (modify as needed)
# module load cuda

# To use srun instead of sbatch script (sbatch this_script.sh)
# srun -p dgx --gres=gpu:4 --ntasks=1 --cpus-per-gpu=5 --pty bash -i

while true
do
  # Your code goes here
  echo "Running..."
  sleep 1  # Optional: pauses for 1 second before next iteration
done
