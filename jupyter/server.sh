#!/bin/sh
#SBATCH --job-name=jupyter-server
#SBATCH --account=g.my_acct
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --nodes=1
#SBATCH --time=00:40:00

# This is an example for running a Jupyter Notebook server for
# interactive Python.
#
# Before running this example, at a minimum, set a strong password in
# the Jupyter Notebook configuration file at `~/.jupyter/`.  See the
# following for information on the configuration file, including how to
# generate one:
#
# https://jupyter-notebook.readthedocs.io/en/stable/config.html
#
# After logging in, load modules, activate the Python environment, then
# submit the job to Slurm:
#
# $ module load Anaconda3
# $ source activate /share/apps/conda_envs/ba-hpc
# $ cd data/use-hpc/jupyter/
# $ sbatch server.sh
#
# After the job is successfully running, check the slurm-*.out file for
# the compute node name where the server has been started.  To access
# the Jupyter Notebook server using a local web browser, start the
# following process in a local terminal:
#
# $ ssh -NL 8888:my_comp:8888 my_login@login01.c2.hpc.bibalex.org
#
# Access the Jupyter Notebook server at the following address using the
# local web browser:
#
# localhost:8888
#
# See the "Jupyter Notebook" documentation:
#
# https://jupyter-notebook.readthedocs.io/en/stable/
#
# This example is part of the BA-HPC examples package:
#
# https://hpc.bibalex.org/examples/

jupyter notebook --no-browser --ip=0.0.0.0
echo "$SLURM_JOB_NODELIST"
