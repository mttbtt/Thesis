#!/bin/bash

#PBS -l walltime= 01:30:00

#PBS -l select=1:ncpus=64:mpiprocs=64

#PBS -e localhost:/home/matteo.bettanin/conti/slits_density/outputs_errors

#PBS -o localhost:/home/matteo.bettanin/conti/slits_density/outputs_errors

#PBS -q short_cpuQ


cd /home/matteo.bettanin/conti/slits_density

#. bashrc

export TOPAS_G4_DATA_DIR=/home/matteo.bettanin/G4Data/
export LD_LIBRARY_PATH=/home/matteo.bettanin/topas/libexternal/:$LD_LIBRARY_PATH


/home/matteo.bettanin/topas/bin/topas /home/matteo.bettanin/conti/slits_density/slits_density_${SEED}.txt > /home/matteo.bettanin/conti/slits_density/results/sr_out


