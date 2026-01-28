#!/bin/bash
#SBATCH --time=00:00:30
#SBATCH --mem-per-cpu=1G
#SBATCH --cpus-per-task=1
#SBATCH --job-name="test"
module load r/4.5.0
Rscript shell_script.R

