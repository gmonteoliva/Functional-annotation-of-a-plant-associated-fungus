#!/usr/bin/env bash


############# MANUAL MASURCA ###########################

# https://github.com/alekseyzimin/masurca 

# download last version from https://github.com/alekseyzimin/masurca/releases
# We have used Marsuca v4.1.1


# Create variables of input and output data

RUN_PATH_I=/home/gmonteoliva/HI_CBGP/02-trimming
RUN_PATH_O=/home/gmonteoliva/HI_CBGP/04-assembly/masurca

# Run assembly of each sample

masurca -t 10 -i $RUN_PATH_I/HI_CBGP_R1.clean_qc_pair.fastq,$RUN_PATH_I/HI_CBGP_R2.clean_qc_pair.fastq


# -t specifies the number of threads to use
# -i specifies the names and paths to Illumina paired end reads files
# -r specifies the name and the path to the long reads file


