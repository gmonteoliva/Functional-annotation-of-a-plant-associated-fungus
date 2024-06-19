#!/usr/bin/env bash


# Load required modules

#Create variables of input and output data

Path_I=/home/gmonteoliva/HI_CBGP/01-raw_reads
Path_O=/home/gmonteoliva/HI_CBGP/02-trimming

# Run trimming analysis on each fastq file


java -jar $EBROOTTRIMMOMATIC/trimmomatic-0.38.jar PE -phred33 -threads $SLURM_CPUS_PER_TASK $Path_I/HI_CBGP_1.fastq.gz  $Path_I/HI_CBGP_2.fastq.gz $Path_O/HI_CBGP_R1.clean_qc_pair.fastq $Path_O/HI_CBGP_R1.clean_qc_unpair.fastq $Path_O/HI_CBGP_R2.clean_qc_pair.fastq $Path_O/HI_CBGP_R2.clean_qc_unpair.fastq ILLUMINACLIP:$EBROOTTRIMMOMATIC/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:50


############## EXPLANATION ##############

# Manual: chrome-extension://efaidnbmnnnibpcajpcglclefindmkaj/http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/TrimmomaticManual_V0.32.pdf
# Remove adapters (ILLUMINACLIP:TruSeq3-PE.fa:2:30:10)
# Remove leading low quality or N bases (below quality 3) (LEADING:3)
# Remove trailing low quality or N bases (below quality 3) (TRAILING:3)
# Scan the read with a 4-base wide sliding window, cutting when the average quality per base drops below 15 (SLIDINGWINDOW:4:15)
# Drop reads below the 50 bases long (MINLEN:50)
#-threads $SLURM_CPUS_PER_TASK --> number of tasks given to the job up in the job info from script
#--mem --> $SBATCH_MEM_PER_NODE 
