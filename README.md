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
- Taxonomic affiliation (7): ITSx v.1.1 to extract ITS from the assembled genome. Blast agains UNITE database (https://unite.ut.ee/)
- Gene prediction (8): GeneMark-ES v.4.30
