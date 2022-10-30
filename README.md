# HEV-consensus

email:  frank.harders@wur.nl
date:   30-10-2022

determine consensus sequence through mapping reads to reference file

reference file is MT362711.1 Hepeviridae isolate HEVgt3c_NL_serum_906010, partial genome 
located in the ./references directory. Polished reads will be align against this reference file.
A consensus sequence is generated based upon the sequence and location of the reference file. GFF file can be used for gene position. GFF must be altered if BAM files from consensus is used.

conda env is create "samtools"
installed progs:
- rename
- bbmap
- samtools
- freebayes

