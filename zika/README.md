# Capturing the essence of bioinformatics: A case study on the Zika virus genome



---

## Download 

* [PyMOL](https://pymol.org/ep): User: jun2021  pw: betabarrel 

---

## Scenario

Following the emergence of an enigmatic disease and your suspicion of its transmissibility, you requested the sequencing of a collected biological sample. After a period of time, you have now received the results of the sequencing.

## Task 1

The class should be divided into two groups, and each group should elect a representative. Take 10 min  to formulate hypotheses and develop a well-defined strategy for conducting the analysis. :clock130:

## Task 2
The sequence has been stored in a plain text format in `data/row_sequence.txt`. 

1. Why we use the plain text format for this sequence.
2. Could you find a tool that calculates the size of the  genome from the sequence file 
3. Using ChatGPT (or Google Bard), find out which sequence could be used to store the sequence 💻
4. Arrange the sequence to include **data** and **metadata**

## Task 3

Determine the organism to which the genome belongs.

tips: 

1. Identify the required input 
2. identify which tool you need to use to carry the analysis
3. Use  ChatGPT (or Google Bard) to answer the questions

## Task 4 

Is it possible to determine the count of GenBank entries for Zika virus sequences?

tips

1. Use the querying system from ENTREZ
2. Use  ChatGPT (or Google Bard)  to construct the query

## Task 5

A BLAST analysis can also be employed to gather sequences that share homology.

1. Select a subset of homologous sequences
2. Extract to a multi FASTA file. 

I have already collected the sequences in the file `data/zika_sequences.fasta` 

## Task 6 

Perform a multiple sequence alignment of all the genomes included in the file `data/zika_sequences.fasta` . Perform the alignment and save the output in CLUSTALW format. The [Kalign](https://www.ebi.ac.uk/Tools/msa/kalign/) server could be used for a fast alignment (not necessary the best)

## Task 7 

Now, we will proceed to determine the evolutionary relationship among the collected sequences. To accomplish this, we can utilize the  [Simple Phylogeny Server at EBI](https://www.ebi.ac.uk/Tools/phylogeny/simple_phylogeny/). It's important to note that while this method serves our tutorial purposes, there are more advanced and accurate approaches available. To begin, upload the alignment file to the server and initiate the analysis. Once completed, save the results in a tree file format. To visualize the generated tree, we will employ [TreeView](http://etetoolkit.org/treeview/).





