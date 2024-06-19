#!/bin/bash



############ MANUAL INTERPROSCAN ################

# https://interproscan-docs.readthedocs.io/en/latest/




#1. Running InterProScan 

interproscan.sif -i /home/gmonteoliva/HI_CBGP/08-functional-annotation/prot_seq_newhead.faa -d /data/ -f tsv,gff3,xml -goterms -cpu 16

#--bind : Esto está indicando a Singularity que monte el directorio dentro del contenedor (Esto permite que el contenedor acceda a los archivos en ese directorio)
# -d: output directory
# -cpu: number of cpus per task
# -goterms: lookup of corresponding Gene Ontology annotation
# -i: input file
# -f: output format. comma separated list of output. Default for protein sequences are TSV, XML and GFF3, or for nucleotide sequences GFF3 and XML.
# --bind $PWD:/data: Este enlace hace que el directorio actual en el host ($PWD, que es el directorio actual en el que estás trabajando cuando ejecutas el comando) esté disponible dentro del contenedor en /data.
