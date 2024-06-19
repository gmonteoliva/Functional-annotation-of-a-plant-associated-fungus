#!/usr/bin/env bash


######## MANUAL ITSx #######

# https://github.com/fantin-mesny/Extract-ITS-sequences-from-a-fungal-genome
# https://github.com/ncbi/ITSx/blob/master/ITSx%20User's%20Guide.pdf


# You can install it using bioconda
# Once we get the ITS output we blast it against UNITE database https://unite.ut.ee/

#Create variables of input and output data

RUN_PATH_I=/home/gmonteoliva/HI_CBGP/04-assembly/spades/HI_CBGP
RUN_PATH_O=/home/gmonteoliva/HI_CBGP/06-taxonomic_affiliation

# Run command ITSx

ITSx -i $RUN_PATH_I/scaffolds.fasta -o $RUN_PATH_O/ITSx -t "f" --cpu 12 --summary T --graphical T --fasta T 

# -i: input
# -o: output
# -t: can be used to restrict the search to only a few organism group (for example "f" for fungi)
# --cpu: cpus per task
# --summary: generate a summary document (txt)
# --graphical: graphical (text) representation of where each sequence the conserved domains were found
# --fasta: fasta files are written for the extrated ITS
