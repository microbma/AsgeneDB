# AsgeneDB: A functional gene database for metagenomic profiling of arsenic metabolism
A manually curated arsenic functional gene database (AsgeneDB) was developed for rapid and accurate metagenomic analysis.

Xinwei Song1,2 , Yongguan Zhu3 ,  Yongming Luo4, Bin Ma*1,2,Jianming Xu 1,2 


Nitrogen (N) cycle is one of the most important biogeochemical cycles in the Earth ecosystem and has gained extensive foci in ecology and environmental studies. During the past decades, extensive efforts have been applied to characterize N cycle pathways in various ecosystems using different approaches. Until recently, shotgun metagenome sequencing have been applied to explore N cycle related gene families and link them with environmental processes. However, there are problems in applying publically available orthology databases to profile N cycle gene families in shotgun metagenomes, such as inefficient database searching, unspecific orthology groups, and low coverage of N cycle genes and/or gene (sub)families in large-scale orthology databases. A curated high quality reference database is therefore in urgent need for metagenomic analysis of N cycle gene families. To solve these issues, we built a manually curated integrative database (NCyc) for fast and accurate profiling of N cycle gene (sub)families from shotgun metagenome sequencing data. 

Arsenic (As) is a kind of toxic metal-like element widely distributed in the world. To understand the microbial community of arsenic metabolism in the environment, we developed a curated arsenic functional gene database (AsgeneDB) covering four arsenic metabolic pathways (oxidative, respiratory, reduction and methylation processes), 59 arsenic biotransformation functional gene families and 414773 representative sequences. Here, protein sequences for As gene families were recruited from multiple public databases such as UniProt, KEGG, COG, eggNOG, arCOG and KOG. AsgeneDB covers 46 phyla and 1653 genera of bacterial archaea and fungi. It can quickly analyze the arsenic metabolism and transformation function of microbial communities by integrating multiple lineal homology databases with high specificity, comprehensiveness, representativeness and accuracy.

<b>1. target_asgene.fasta</b>: fasta format representative sequences obtained by clustering curated sequences at 100% sequence identity. This file can be used for "BLAST" searching arsenic genes in shotgun metagenomes.

<b>2. asgene.map</b>: a mapping file that maps sequence IDs to gene names, only sequences belonging to arsenic gene families are included. This file is used to generate arsenic gene profiles from BLAST-like results against the database.

<b>3. id_gene_tax_pathway.csv</b>: Species information table of sequences. 

<b>4. length.txt</b>: The file contains the length of amino acid sequences in AsgeneDB for standardizing arsenic gene abundance statistics.

<b>5. gene_abundance.R </b>: Script used to statistical information of functional species in samples.

<b>6. sample_gene_tax.R </b>: Script used to calculate and standardize gene abundance in samples.
