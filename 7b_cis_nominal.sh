file1=merged
inputPath=4b_keptRegions.gene

out1=7b_cis_nominal.genes
mkdir -p $out1

QTLtools cis --vcf   0_BAM/Phenotype_Genotype/BA9.recode.vcf.gz    --bed  $inputPath/$file1.sorted.bed.gz    --cov  $inputPath/PCA_phenotype/merged.sorted.11.pca    \
             --nominal 0.0001    --out $out1/$file1.nominals.txt  --log $out1/$file1.Log   >  $out1/$file1.runLog.txt 2>&1 












