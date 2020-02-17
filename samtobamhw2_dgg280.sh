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

module load samtools/intel/1.9


for item in ./*.sam
do
samtools view -bS ${item} > ${item::-4}_BAM.bam

done

