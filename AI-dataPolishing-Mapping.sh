#!/bin/bash

# 
# Dependencies:
#   fastqc, SHOVILL
#export 



### manual input of some info regarding working directories




echo -e "test pwd PWD" ;

OUT_FOLDER=$PWD;
ASSEMDIR="$OUT_FOLDER/SHOVILL/";
RAW_FASTQ="$OUT_FOLDER/RAWREADS/";
OUTSTATS="$OUT_FOLDER/01_raw_stats";



./00_structure.sh -i $RAW_FASTQ -o $OUTSTATS;

POLISHED="$OUT_FOLDER/01_polished/";
LOG="$OUT_FOLDER/LOGS/"
ADAPTERPATH="/mnt/lely_DB/Old_Shared_DATABASES/NGSADAPTERS/";
ADAPTER="nextera";							#options: nextera Rubicon TAKARA truseq scriptseqv2 

./01_polishdata.sh -i $RAW_FASTQ -o $POLISHED -l $LOG -p $ADAPTERPATH -a $ADAPTER; 
CONTIGLENGTH=300; # minimum contig length after assembly


./04_SHOVILL.sh -i $POLISHED 

# Manual input

REF="/mnt/lely_scratch/harde004/BACT/genomes/Mannheimia/run_B59NM/REFERENCES/CP004752/CP004752.fasta";
REFSHORT="CP004752"

MUMOUT="$OUT_FOLDER/03_mummerplots_$REFSHORT"

#./03_mummerplots.sh -i $ASSEMDIR -o $MUMOUT -r $REF -s $REFSHORT

BLATJOINMUMOUT="$OUT_FOLDER/04_BlatJoinMummer_$REFSHORT"

#./04_BlatJoinMummer.sh -i $ASSEMDIR -o $BLATJOINMUMOUT -r $REF -s $REFSHORT

MUMMERJOINOUT="$OUT_FOLDER/05_MUMmerJoin_$REFSHORT"

#./05_MUMmerJoin.sh  -i $ASSEMDIR -o $MUMMERJOINOUT -r $REF -s $REFSHORT


MULTIMUMMEROUT="$OUT_FOLDER/06_multimummer_$REFSHORT"

#./06_multimummer.sh -i $BLATJOINMUMOUT -o $MULTIMUMMEROUT -r $REF -s $REFSHORT

MUMMERSMUMIOUT="$OUT_FOLDER/07_mummers_mumi_$REFSHORT"

#./07_run_mummers-mumi.sh -i $BLATJOINMUMOUT -o $MUMMERSMUMIOUT
