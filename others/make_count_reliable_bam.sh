#!/bin/bash
# Derived from the make-sort script created by Kyle Hernandez
# Altered by DLD 10.7.13 for to generate a command file for the SAM to BAM conversion
# make-convert.sh - Author the parameter file for converting sam files to bam files with picard

if [[ -z $1 ]] | [[ -z $2 ]]; then
  echo "Usage make-convert.sh in/dir out/dir"
  exit 1;
fi

# DD- The backslash in front of the PICARD TACC invocation in the script line tells bash that the dollar symbol is actually the text, not a variable

SCRIPT="samtools view -c -F 4 "
INDIR=$1
ODIR=$2
PARAM="bam_reliable.param"
LOG="logs/"

if [ ! -d $LOG ]; then mkdir $LOG; fi

if [ -e $PARAM ]; then rm $PARAM; fi
touch $PARAM

# Loop over the filtered sam files and
# create a sorted sam file. Here I am assuming that the file names end with "Q20.sam".
# You could simply change sam to bam if they are bam files, or change Q20 to something else if you
# used a differen cutoff value.
for fil in ${INDIR}*.bam; do
  BASE=$(basename $fil)
  NAME=${BASE%.*}
  OUT="${ODIR}reliable"
  OLOG="${LOG}${NAME}.log"
  #echo "$fil"
# I kept the same java parameters from the sam sort commands. not sure if they're necessary
  echo "$SCRIPT $fil >>$OUT" >> $PARAM
done
