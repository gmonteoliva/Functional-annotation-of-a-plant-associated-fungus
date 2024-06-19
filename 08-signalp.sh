#!/usr/bin/env bash


############# MANUAL SIGNAL P ###########################

# Request the program in this link https://services.healthtech.dtu.dk/services/SignalP-6.0/ (download -> slow_sequential) 
# Once the program is untar, take a look to READme file to see how to install and set up the program. Manual is in the READme file 

# ACTIVATE signalp ENVIRONTMENT before running


# Create variables of input and output data

RUN_PATH_I=/home/gmonteoliva/HI_CBGP/08-functional-annotation
RUN_PATH_O=/home/gmonteoliva/HI_CBGP/08-functional-annotation/signalp6_slow_sequential/signalp-6-package

# Run the program
signalp6 --fastafile $RUN_PATH_I/prot_seq_newhead.faa --organism eukarya --output_dir $RUN_PATH_O/HI_CBGP_signal_P --format txt --mode slow-sequential  

# --fastafile: specifies the fasta file with the sequences to be predicted
# --output_dir: speicifies the directory in which to save the outputs
# --organism: is either `other` or `eukarya`. Default to other. Specifying `eukarya` triggers post-processing of the SP predictions to prevent spurious results (only predicts type Sec/SPI)
# --format: can take the values `txt`, `png`, `eps`, `all`, `none`. It defines what output files are created for individual sequences
#  --mode: is either `fast`, `slow` or `slow-sequential`. Default is `fast`, which uses a smaller model that approximates the performance of the full model, requiring a fraction of the resources and being significantly faster.
# --bsize: cpus per task. Default is 10
# --torch_num_threads: number of threads used by PyTorch. Defaults to `8`.

