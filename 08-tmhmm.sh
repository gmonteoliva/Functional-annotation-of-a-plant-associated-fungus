#!/usr/bin/env bash


############# MANUAL TMHMM ###########################

# https://services.healthtech.dtu.dk/services/TMHMM-2.0/
# All the information is the REAMme and html files once you decompress the downloaded program


# Create variables of input and output data

RUN_PATH_I=/home/gmonteoliva/HI_CBGP/08-functional-annotation
RUN_PATH_O=/home/gmonteoliva/HI_CBGP/08-functional-annotation/tmhmm-2.0c

# Run the program
 
tmhmm $RUN_PATH_I/prot_seq_newhead.faa > results_tmhmm.txt
