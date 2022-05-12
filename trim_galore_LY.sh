#!/bin/bash

#SBATCH --time=12:00:00
#SBATCH --nodes=2
#SBATCH --ntasks=2
#SBATCH --mem=2G

ml trim_galore

#gunzip  -d *.gz

ls *.fastq | sed 's/_R[0-9]_.*//' | sort -u | while read line; do trim_galore -o adapter_removed -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCAC -a2 AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT --paired --path_to_cutadapt $(which cutadapt) ${line}_R1_001.fastq ${line}_R2_001.fastq; done

