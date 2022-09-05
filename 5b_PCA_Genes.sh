input_g=4b_keptGenes
output_g=5b_PCA_Genes
mkdir $output_g

QTLtools pca  --bed  $input_g/merged.sorted.bed.gz   --scale   --center   --out   $output_g/merged   --log $output_g/merged.Log  >   $output_g/merged.runLog.txt 2>&1      


## Then change the column order, let them match the column order of the matrix of genotype and phenotype.




