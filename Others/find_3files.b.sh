cp  ../../../4b_keptRegions.gene/merged.bed    ./merged.bed    
cp  ../../../0_BAM/Phenotype_Genotype/BA9.genotype.txt   ./BA9.genotype.txt

sleep 3m

perl   find_3files.pl   -file1  All.txt      -file2   merged.bed      -file3 BA9.genotype.txt
