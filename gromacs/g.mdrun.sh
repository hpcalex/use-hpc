#!/bin/sh
#SBATCH --job-name=Apo
#SBATCH --partition=gpu
#SBATCH --account=g.my_acct
#SBATCH --cpus-per-task=16
#SBATCH --gres=gpu:2
#SBATCH --time=120:00:00

# This is an example for running `gmx mdrun`, the "main computational
# chemistry engine within GROMACS."
#
# This version of the example uses GPU resources.
#
# To run this example, an input file in the .tpr file format is
# required, which is assumed to have been uploaded as `em.tpr` and placed
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
# Use `gmx grompp`, the "GROMACS preprocessor," to preprocess a
# molecular topology and expand a molecular description to an atomic
# description.  See the following for information on the `gmx grompp`
# command:
#
# https://manual.gromacs.org/current/onlinehelp/gmx-grompp.html
#
# This example is part of the BA-HPC examples package:
#
# https://hpc.bibalex.org/examples/

gmx mdrun -nt 16 -s my_run.tpr -deffnm my_run
