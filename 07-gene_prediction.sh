#!/usr/bin/env bash


fungi=H2

### Link of sources

#https://github.com/gatech-genemark/GeneMark-E-Docs/blob/main/docs/examples/fungal_genome.md
#https://darencard.net/blog/2022-10-13-install-repeat-modeler-masker/

### Annotation of a novel fungal genome ###

#This script shows how to use GeneMark to predict genes in a sequence of a novel fungal genome, for which no data than the genomic sequence itself are available.

# 1) De Novo Repeat Identification and Masking
# Prior to predicting protein coding genes, it is important to identify and mask repetitive elements.A database of species-specific transposable elements (TEs) is unlikely to be available for a novel genome. Since the types and sequences of TEs are highly variable across species, we recommend to build a de novo repeat database with RepeatModeler2:

#mkdir -p logs		# Create both directories (-p is use to overwrite the directory an not throw an error)
#mkdir -p $fungi

#cp /home/gmonteoliva/HI_CBGP/04-assembly/spades/HI_CBGP/scaffolds.fasta $fungi/.
#mv $fungi/scaffolds.fasta $fungi/$fungi"_scaffolds.fasta"

#BuildDatabase -name $fungi"_genome" /home/gmonteoliva/HI_CBGP/07-gene_prediction/HI_CBGP/$fungi"_scaffolds.fasta"

#RepeatModeler2 for automated genomic discovery of transposable element families"

#RepeatModeler -database $fungi"_genome" -threads 20 -LTRStruct  

RepeatModeler -database $fungi"_genome" -threads 20


#The repeat library can then be used by RepeatMasker to soft-mask both simple and interspersed repeats.The masked genome will be saved to genome.fasta.masked file. The use of soft-masking (-xsmall option), i.e. repeat regions are represented by lower-case letters, leads to better results than hard-masking, i.e. replacing repeats with the letter N. Soft-masking enables GeneMark to ignore short repeats located inside protein-coding genes. The maximum length of ignored repeats can be controlled by --soft_mask N parameter or automatically estimated by using --soft_mask auto option.

#RepeatMasker -lib $fungi"_genome-families.fa" -xsmall  $fungi/$fungi"_scaffolds.fasta" 

# 2) Predicting genes with GeneMark-ES 

# We will start by using GeneMark-ES which works with the genomic sequence alone:

#mkdir "ES_"$fungi; cd "ES_"$fungi

#perl /home/gmonteoliva/HI_CBGP/07-gene_prediction/Gene_Mark/gmes_linux_64/gmes_petap.pl --fungus --seq ../$fungi"_scaffolds.fasta.masked" --ES --soft_mask auto --cores 8

#All algorithms in the GeneMark-ES Suite, including ProtHint, have a special mode for running on fungal genomes. This mode triggers, for example, a special branch point model and a different set of default parameters better suited for fungal genomes. To activate the fungal mode, use --fungus option.

#Importance of soft-masking: The use of soft-masking (-xsmall option), i.e. repeat regions are represented by lower-case letters, leads to better results than hard-masking, i.e. replacing repeats with the letter N. Soft-masking enables GeneMark to ignore short repeats located inside protein-coding genes. The maximum length of ignored repeats can be controlled by --soft_mask N parameter or automatically estimated by using --soft_mask auto option.

# 3) Post-Processing genemark.gtf outputfile from GENEMARK to be ready for eggnogmapper. (https://www.biostars.org/p/238460/)

#get_sequence_from_GTF.pl

#Input: gene coordinates in GTF format and sequence in FASTA format
#Output: nucleotide and protein sequences of genes (nuc_seq.fna and prot_seq.faa)

# 3.2 Obtain the nucleotide and protein sequence from the assembled contigs

#perl /home/gmonteoliva/HI_CBGP/07-gene_prediction/Gene_Mark/gmes_linux_64/get_sequence_from_GTF.pl ES/genemark.gtf HI_CBGP_scaffolds.fasta

# 3.3 Editing .fna and .faa sequence headers

#cd HI_CBGP
#printf " > Editing .fna and .faa sequence headers...\n"
#awk '{match($0, /gene_id "([^"]+)";/, gene_id);
#    if (!(($1, gene_id[1]) in count)) {count[$1, gene_id[1]] = ++last_count[$1]}
#    printf("%s\t%s_%d\n", $0, $1, count[$1, gene_id[1]])}' ES/genemark.gtf \
#| awk -F'[ \t]+' '{gsub(/[";]/,"",$10); gsub(/"/,"",$NF); print $10 "\t" $NF}' \
#| awk '!seen[$0]++' > ES/genemark_headers_red.tmp

#awk 'FNR==NR{a[">"$1]=$2;next} /^>/{if($1 in a){$1=">"a[$1]}}1' \
#  ES/genemark_headers_red.tmp prot_seq.faa > prot_seq_newhead.faa

#awk 'FNR==NR{a[">"$1]=$2;next} /^>/{if($1 in a){$1=">"a[$1]}}1' \
#  ES/genemark_headers_red.tmp nuc_seq.fna > nuc_seq_newhead.fna


#printf " > Editing .gtf sequence headers and converting to .gff...\n"
#awk '{match($0, /gene_id "([^"]+)";/, gene_id);
#    if (!(($1, gene_id[1]) in count)) {count[$1, gene_id[1]] = ++last_count[$1]}
#    gsub(/gene_id "[^"]+";/, "gene_id \"" $1 "_" count[$1, gene_id[1]] "\";", $0); 
#    print $0}' ES/genemark.gtf > ES/genemark_newids.gtf

#gffread -E ES/genemark_newids.gtf -o ES/genemark.gff3

# 4. EGMAPPER FROM GENEMARK:


#cd HI_CBGP
#emapper.py -i ES/prot_seq_newhead.faa -o ES/gnmark_emapper --decorate_gff ES/genemark.gff3 --decorate_gff_ID_field geneID
