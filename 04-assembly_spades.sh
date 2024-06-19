#!/usr/bin/env bash


############# MANUAL SPADES ###########################

# https://github.com/ablab/spades 


# Create variables of input and output data

RUN_PATH_I=/home/gmonteoliva/HI_CBGP/02-trimming
RUN_PATH_O=/home/gmonteoliva/HI_CBGP/04-assembly/spades

# Run assembly of each sample

SPAdes/3.15.2-GCC-8.2.0-2.31.1/bin/spades.py -1 $RUN_PATH_I/HI_CBGP_R1.clean_qc_pair.fastq -2 $RUN_PATH_I/HI_CBGP_R2.clean_qc_pair.fastq -k 21,33,55,77,99,127 --careful -t 10 -m 200 -o $RUN_PATH_O/HI_CBGP/

# SPAdes: iterative short-read genome assembly module; values of K are selected automatically based on the read length and data set type.
# -1 and -2: data files (sequences, forward and reverse)
# -k: <int,int,...> Comma-separated list of k-mer sizes to be used (all values must be odd, less than 128 and listed in ascending order). The numbers of k in the command are recommender (Check section 3.3 of the manual) 
# --careful: tries to reduce the number of mismatches and short indels. Also runs MismatchCorrector - a post processing tool, which uses BWA tool (comes with SPAdes). This option is recommended only for assembly of small genomes. We strongly recommend not to use it for large and medium-size eukaryotic genomes
# -t: number of threads
# -m: memmory limit (Gb)
# -o: output






