#!/bin/bash
#SBATCH -J cm_job
#SBATCH -o cm_job.o%j
#SBATCH -e cm_job.e%j
#SBATCH -n 16
#SBATCH -p development
#SBATCH -t 00:30:00
#SBATCH -A P.hallii_expression

SCRIPT="/scratch/02703/samsad/Peer/RNAseq/testall/tag-seq-tools/bin/TagSeqTools" # Path to TagSeqTools
GFF="/scratch/02703/samsad/Peer/RNAseq/testall/reference/Osativa_204_gene.gff3"    # Path to GFF file
INDIR="/scratch/02703/samsad/Peer/RNAseq/67analysis/count/"  # Path to directory containing ONLY GMCounts output files
OFIL="/scratch/02703/samsad/Peer/RNAseq/67analysis/merged/data.tab"   # Output count matrix file

$SCRIPT CountMatrix -i $INDIR -o $OFIL

echo "Parametric job completed..."
date;
