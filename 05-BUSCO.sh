#!/usr/bin/env bash


######## MANUAL BUSCO #######

# https://busco.ezlab.org/busco_userguide.html#getting-started


# We have to use a data base provided by busco to check the orthologs (we can use busco --list-datasets to get the list of data bases)



#Create variables of input and output data

RUN_PATH_I=/home/gmonteoliva/HI_CBGP/04-assembly/spades/HI_CBGP
RUN_PATH_O=/home/gmonteoliva/HI_CBGP/05-qc_assembly/BUSCO

# Run assembly evaluation of each sample

# Quality Assessment Tool for Genome Assemblies

busco -i $RUN_PATH_I/scaffolds.fasta \
	-m genome \
	-l fungi_odb10 \
	-o $RUN_PATH_O/BUSCO_spades \
	-c 16 

# -i: input 
# -m: mode (genome, proteins or transcriptome)
# -l: a reference genome (we can use a predefine list of genomes in BUSCO using busco --list-datasets)
# -o: output
# -c: number of threads/cores to use

