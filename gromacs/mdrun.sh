#!/bin/sh
#SBATCH --job-name=mdrun
#SBATCH --partition=cpu
#SBATCH --ntasks=24
#SBATCH --cpus-per-task=1
#SBATCH --time=3-00:00:00

# This is an example for running `gmx mdrun`, the "main computational
#chemistry engine within GROMACS."
#
# To run this example, an input file in the .tpr file format is
# required, which is assumed to have been uploaded as `my_run.tpr` and placed
# next to this script file.  See the following for information on the .tpr file
# format:
#
# https://manual.gromacs.org/archive/5.0.1/online/tpr.html
#
# After logging in, load modules then submit the job to Slurm:
#
# $ module load GROMACS
# $ cd data/use-hpc/gromacs/
# $ sbatch mdrun.sh
#
# See the following for information on the `gmx mdrun` command:
#
# https://manual.gromacs.org/current/onlinehelp/gmx-mdrun.html
#
# This example is part of the BA-HPC examples package:
#
# https://hpc.bibalex.org/examples/

mpirun -np 24 gmx_mpi mdrun -s my_run.tpr -deffnm my_run
