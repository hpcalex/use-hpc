#!/bin/sh
#SBATCH --job-name=pw.x
#SBATCH --partition=cpu
#SBATCH --ntasks=24
#SBATCH --cpus-per-task=1
#SBATCH --time=12:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=  # Fill in your email address

# This is an example for running `pw.x` from the Quantum ESPRESSO
# package for first-principles electronic-structure calculations and
# materials modeling.
#
# See the following for information on the pw.x input file format:
#
# https://www.quantum-espresso.org/Doc/INPUT_PW.html
#
# An example input file, scf.in, is included in this directory and is
# copied from the following tutorial by N. T. Hung, A. R. T. Nugraha,
# and R. Saito:
#
# https://flex.phys.tohoku.ac.jp/QE/workshop_QE_2016/DFT-hands-on-nguyen.pdf
#
# After logging in, load modules then submit the job to Slurm:
#
# $ module load intel/2018b
# $ PATH="/share/apps/q-e-qe-6.3/bin:$PATH"
# $ sbatch pw.x.sh
#
# The above assumes version 6.3 of the software is installed under the
# directory /share/apps and is built with the intel/2018b toolchain.
#
# This example is part of the BA-HPC examples package:
#
# https://hpc.bibalex.org/examples/

#export ESPRESSO_USE=_omp
#export OMP_NUM_THREADS=1
#export I_MPI_PMI_LIBRARY=/usr/lib64/libpmi.so

echo "Job ${SLURM_JOB_ID} is running on ${SLURM_JOB_NODELIST}"

mpirun -np 24 pw.x scf.in > opt.out
