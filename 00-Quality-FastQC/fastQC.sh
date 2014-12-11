#!/bin/bash
#SBATCH -J fastQC
#SBATCH -o fastQC.o%j
#SBATCH -e fastQC.e%j
#SBATCH -N 1
#SBATCH -n 16
#SBATCH -p development
#SBATCH -t 01:00:00
#SBATCH -A P.hallii_expression

module load fastqc
module load launcher
CMD="fastqc.param"

EXECUTABLE=$TACC_LAUNCHER_DIR/init_launcher
$TACC_LAUNCHER_DIR/paramrun $EXECUTABLE $CMD

echo "DONE";
date;
