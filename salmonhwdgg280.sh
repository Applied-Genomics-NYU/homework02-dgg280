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

module load salmon/1.0.0
salmon index -t /scratch/work/jupyterhub/2020-SP-BIOL-GA.1130-001/class_share/homework02/athal.fa.gz -i athal_index

for item in /scratch/work/jupyterhub/2020-SP-BIOL-GA.1130-001/class_share/homework02/*_1.fastq
do
salmon quant -i athal_index -l A -1 ${item} -2 ${item::-7}2.fastq -p 8 --validateMappings -o quants/${item:73:-22}_salmon

done

