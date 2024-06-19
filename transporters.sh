# Create the TCDB database

 /home/gmonteoliva/ncbi-blast-2.15.0+/bin/makeblastdb -in tcbd -dbtype prot -out tcdb

# Blast your proteome to get the transporters

/home/gmonteoliva/ncbi-blast-2.15.0+/bin/blastp -query /home/gmonteoliva/HI_CBGP/08-functional-annotation/prot_seq_newhead.faa -db tcdb -outfmt 6 -out transporters.txt

# To interpret the results: https://www.metagenomics.wiki/tools/blast/blastn-output-format-6

# FIlter by percentaje of identity (pident) > 30 and e-value < 0.001
 
awk '$3 > 30 && $11 < 0.001' tu_archivo.txt > archivo_filtrado.txt

# Finally, we select the best match for each transporter 

awk '!seen[$1]++' output_file_filtrado.txt > transporter_result.txt
-----------------------------------------------------------------------------------------------

# We can classify the type of transporter (check TCDB classification: https://www.tcdb.org/browse.php)

# For families

awk -F'|' '{split($4, a, "."); if (a[1] == 1) count++} END {print count}' input.txt     ## change the number 1 for the number of family you want to count



