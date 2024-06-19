# Functional-annotation-of-a-plant-associated-fungus
The aim of this work has been the analysis of a fungal endophyte genome, from its assembly to the annotation and description of the different predicted functions of the coding sequences, with special attention to biological functions that may be related to the interaction of the fungus with the plant.

## PIPELINE
In the next pipline we see the workflow and the tools used for that speficic purpose

![image](https://github.com/gmonteoliva/Functional-annotation-of-a-plant-associated-fungus/assets/166056678/591c03e9-456a-4934-bcdd-95c63ead64ea)

## REQUIRED DEPENDENCIES
The use of the scripts require the next version of these tools (the number in brackets referst to the step in the workflow):

- Quality analysis (2, 4): FastQC v.0.12.0 or MultiQC v.1.21.0
- Trimming (3): Trimmomatic v.0.38
- Assembly (5): SPAdes v.3.15.2 or MaSuRCA v.4.1.1 (in our specific case SPAdes did a better perfomance)
- Assembly quality analysis (6): QUAST v.5.2.0 and BUSCO v.5.7.1
- Taxonomic affiliation (7): ITSx v.1.1 to extract ITS from the assembled genome. Blast agains [UNITE database](https://unite.ut.ee/)
- Gene prediction (8): GeneMark-ES v.4.30 (RepeatModeler v.2.0.4 and RepeatMasker to identify transposable elemments)
- Secretome (9): SignalP v.6.0 (signal peptide) - TMHMM v.2.0c (to identify transmembrane domains) - Prosite v.6.0 (proteins retained in endoplasmatic reticulum) = secreted proteins
- Transporters (10): local blastp against TCDB database. Download BLAST+ from https://blast.ncbi.nlm.nih.gov/doc/blast-help/downloadblastdata.html and TCDB (All Proteins in TCDB) from [https://www.ebi.ac.uk/merops/download_list.shtml](https://www.tcdb.org/download.php)
- Secondary metabolism (11): antiSMASH v.7.0 (https://fungismash.secondarymetabolites.org/#!/start)
- CAZYmes (12): CUPP v.2.1.0 (https://cupp.info/submit) or DBCan3 v.12.0 (https://bcb.unl.edu/dbCAN2/blast.php)
- Proteases (13): local blastp against MEROPS database. Download BLAST+ from https://blast.ncbi.nlm.nih.gov/doc/blast-help/downloadblastdata.html and MEROPS (3. Peptidase Protein Sequences) from https://www.ebi.ac.uk/merops/download_list.shtml
- Effectors (14): EffectorP v.3.0 (https://effectorp.csiro.au/)
- Metabolic pathways (KEGG) (15): BlastKoala (https://www.kegg.jp/blastkoala/)
- Gene ontology (GO) (16): InterProScan v.5.66-98.0
- Cluster of orthologies (COG) (17): EggNOG mapper v.2.1.12 (http://eggnog-mapper.embl.de/)

## WORKFLOW

### Genome assembly
1. Get raw_read files from Illumina sequencing
2. Use [01-pre_fastqc.sh](https://github.com/gmonteoliva/Functional-annotation-of-a-plant-associated-fungus/blob/main/01-pre_fastqc.sh) to check the quality of the sequencing files (I prefer multiqc)
3. Remove low quality reads and adapters using [02-trimming.sh](https://github.com/gmonteoliva/Functional-annotation-of-a-plant-associated-fungus/blob/main/02-trimming.sh)
4. Analyse again the quality of the reads post-trimming using [01-pre_fastqc.sh](https://github.com/gmonteoliva/Functional-annotation-of-a-plant-associated-fungus/blob/main/01-pre_fastqc.sh)
5. Do the genome assembly. You can use [04-assembly_masurca.sh](https://github.com/gmonteoliva/Functional-annotation-of-a-plant-associated-fungus/blob/main/04-assembly_masurca.sh) or [04-assembly_spades.sh](https://github.com/gmonteoliva/Functional-annotation-of-a-plant-associated-fungus/blob/main/04-assembly_spades.sh) (In our case we got better perfomance using SPAdes)
6. Analyse the quality of the assembly using [05-QUAST.sh](https://github.com/gmonteoliva/Functional-annotation-of-a-plant-associated-fungus/blob/main/05-QUAST.sh). If you want you can use a reference assembled genome or other assembled genomes from the same relative closed taxonomic genus to compare assemblies and genome parameters as genome size: I got them from [NCBI](https://www.ncbi.nlm.nih.gov/datasets/genome/)
7. Analyse the quality of the genome using [05-BUSCO.sh](https://github.com/gmonteoliva/Functional-annotation-of-a-plant-associated-fungus/blob/main/05-BUSCO.sh)
7.1. You can visualize using [BUSCO_graph.sh](https://github.com/gmonteoliva/Functional-annotation-of-a-plant-associated-fungus/blob/main/BUSCO_graph.sh) (better for multiple assemblies)
8. To identify the specie of your fungi, extract the ITS secuence with [06-taxonomic_affiliation.sh](https://github.com/gmonteoliva/Functional-annotation-of-a-plant-associated-fungus/blob/main/06-taxonomic_affiliation.sh). Once you have, do a blast with that sequence in [UNITE database](https://unite.ut.ee/)

### Gene prediction and Functional Annotation
9. Gene prediction [07-gene_prediction.sh](https://github.com/gmonteoliva/Functional-annotation-of-a-plant-associated-fungus/blob/main/07-gene_prediction.sh)
10. COG annotation: it can be done at he last part of this script [07-gene_prediction.sh](https://github.com/gmonteoliva/Functional-annotation-of-a-plant-associated-fungus/blob/main/07-gene_prediction.sh) or via web [EggNOG MApper](http://eggnog-mapper.embl.de/)
11. KEGG annotation: done via web [BlastKoala](https://www.kegg.jp/blastkoala/)
12. GO annotation: use [interproscan.sh](https://github.com/gmonteoliva/Functional-annotation-of-a-plant-associated-fungus/blob/main/interproscan.sh) to get GO terms. Then you can extrac those GO terms (Check [InterProScan Documentation]([https://interproscan-docs.readthedocs.io/en/latest/Introduction.html](https://interproscan-docs.readthedocs.io/en/latest/OutputFormats.html))
12.1. You can get a very general summary of the GO functions. Download [GO database ](https://geneontology.org/docs/download-ontology/) (go-basic.obo). Transform it in a manageable databse using [R](https://posit.co/download/rstudio-desktop/) and this script [obo-database.sh](https://github.com/gmonteoliva/Functional-annotation-of-a-plant-associated-fungus/blob/main/obo-database.sh). Then we can parse our file with all GO_terms with the database and get a summary of the functions of our genome
13. Transporters: Download [BLAST+](https://blast.ncbi.nlm.nih.gov/doc/blast-help/downloadblastdata.html) and [Transporters database, TCDB](https://www.ebi.ac.uk/merops/download_list.shtml) (All Proteins in TCDB). Use [transporters.sh](https://github.com/gmonteoliva/Functional-annotation-of-a-plant-associated-fungus/blob/main/transporters.sh) to get the transporters and classify them
14. Secondary metabolism: do it via web [antiSMASH](https://fungismash.secondarymetabolites.org/#!/start)
15. Secreted proteins (Secretome): You need to predict proteins with signal peptide using [08-signalp.sh](https://github.com/gmonteoliva/Functional-annotation-of-a-plant-associated-fungus/blob/main/08-signalp.sh). To that result you need to remove those proteins with transmembrane domain that you can predict using [08-tmhmm.sh](https://github.com/gmonteoliva/Functional-annotation-of-a-plant-associated-fungus/blob/main/08-tmhmm.sh). Finally, there are also proteins with signal peptide that are retained in the endoplasmatic reticulum. So, you need to remove those ones predict with [ProSite](https://prosite.expasy.org/scanprosite/)


