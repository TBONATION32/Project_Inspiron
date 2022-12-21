# write a script that will schedule an SRST2 MLST job 

#!/bin/bash

#SBATCH --job-name=srst2_mlst
#SBATCH --output=srst2_mlst.out
#SBATCH --error=srst2_mlst.err
#SBATCH --time=72:00:00
#SBATCH --mem=80G
#SBATCH --cpus-per-task=32

# Set the SRST2 database directory
SRST2_DB="/cbio/users/tbonation/MLST/Streptococcus_pneumoniae.fasta"

# Set the input fastq files
FASTQ_1="/cbio/projects/005/data/Batch_upload/QC_pass/*1.fastq.gz"
FASTQ_2="/cbio/projects/005/data/Batch_upload/QC_pass/*2.fastq.gz"

# Set the output prefix
OUTPUT_PREFIX="cbio/users/tbonation/SBATCH/"

# Run SRST2 MLST
srst2 --input_pe $FASTQ_1 $FASTQ_2 --output $OUTPUT_PREFIX --mlst_db $SRST2_DB --mlst_definitions /cbio/users/tbonation/MLST/profiles.csv --threads 16