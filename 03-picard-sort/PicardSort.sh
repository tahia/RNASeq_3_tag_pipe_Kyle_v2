#!/bin/bash
#SBATCH -J picard_sort
#SBATCH -o picard_sort.o%j
#SBATCH -e picard_sort.e%j
#SBATCH -N 1
#SBATCH -n 16
#SBATCH -p development
#SBATCH -t 01:00:00
#SBATCH -A P.hallii_expression

module load picard
module load launcher
CMD="Convert-SAM_samtools.param"

EXECUTABLE=$TACC_LAUNCHER_DIR/init_launcher
$TACC_LAUNCHER_DIR/paramrun $EXECUTABLE $CMD

echo "DONE";
date;
Sam_reliable.sh (END) 


