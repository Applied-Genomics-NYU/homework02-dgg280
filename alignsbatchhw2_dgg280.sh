#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=2
#SBATCH --time=1:00:00
#SBATCH --mem=8GB
#SBATCH --job-name=HW2
#SBATCH --output=slurm_%j.out

echo hello

module load hisat2/intel/2.0.5
hisat2-build /scratch/work/jupyterhub/2020-SP-BIOL-GA.1130-001/class_share/homework02/Arabidopsis.fa Arabindex

for item in /scratch/work/jupyterhub/2020-SP-BIOL-GA.1130-001/class_share/homework02/*_1.fastq
do
hisat2 -p 8 -x Arabindex -1 ${item} -2 ${item::-7}2.fastq -S Aligned_${item:73:-22}.sam

done

