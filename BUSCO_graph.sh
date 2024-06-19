#!/usr/bin/env bash


######## MANUAL BUSCO #######

# https://busco.ezlab.org/busco_userguide.html#getting-started


# Graph

generate_plot.py --working_directory /home/gmonteoliva/HI_CBGP/05-qc_assembly/BUSCO/result/


# We need to create a new file that contain the BUSCO result for SPAdes and masurca in this format "short_summary.specific.fungi_odb10.BUSCO_MaSuRCA.txt" and "short_summary.specific.fungi_odb10.BUSCO_SPAdes.txt"
 
# Replace SPAdes/MaSurca in the name of the file to change the name that will appear in the graph

# In the graph will appear as many result as files we have in the folder
