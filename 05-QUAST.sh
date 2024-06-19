#!/usr/bin/env bash


######## MANUAL QUAST #######

# https://github.com/ablab/quast


#Create variables of input and output data

RUN_PATH_I=/home/gmonteoliva/HI_CBGP/04-assembly/spades/HI_CBGP
RUN_PATH_O=/home/gmonteoliva/HI_CBGP/05-qc_assembly/QUAST      

# Run assembly evaluation of each sample

# Quality Assessment Tool for Genome Assemblies
/home/gmonteoliva/quast-5.2.0/quast.py -l 'HI_CBGP SPAdes,HI_CBGP MaSuRCA,Especie 1,Especie 2,Especie 3, Especie 4,Especie 5,Especie 6' $RUN_PATH_I/scaffolds.fasta /home/gmonteoliva/HI_CBGP/04-assembly/masurca/CA/scaffolds.ref.fa /home/gmonteoliva/HI_CBGP/04-assembly/reference_genome/Especie1.fna /home/gmonteoliva/HI_CBGP/04-assembly/reference_genome/Especie2.fna /home/gmonteoliva/HI_CBGP/04-assembly/reference_genome/Especie3.fna /home/gmonteoliva/HI_CBGP/04-assembly/reference_genome/Especie4.fna /home/gmonteoliva/HI_CBGP/04-assembly/reference_genome/Especie5.fna /home/gmonteoliva/HI_CBGP/04-assembly/reference_genome/Especie6.fna --threads 16 -o $RUN_PATH_O/05-qc_quast_report

# 'name of each organism separated by "," '
# --threads: cpus per task
# -o: output 
# -l: to put names of each genome in the report

