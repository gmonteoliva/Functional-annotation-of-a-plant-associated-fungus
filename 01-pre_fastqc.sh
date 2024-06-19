#!/usr/bin/env bash

RUN_PATH_I=/home/gmonteoliva/HI_CBGP/01-raw_reads
RUN_PATH_O=/home/gmonteoliva/HI_CBGP/05-raw_reads

# Running Fastqc

#fastqc [-o output dir] [--(no)extract] [-f fastq|bam|sam] 	# -o: Create all output files in the specified output directory
                                                                # -f: to specify the format (not necessary, automatically recognise the format)
fastqc -o $Path_O $Path_I/*.fastq.gz  

#multiqc .							#Does the same as fastqc but for multiple samples








