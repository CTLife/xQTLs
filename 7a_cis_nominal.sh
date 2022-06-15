file1=merged
inputPath=4a_keptRegions.peaks

out1=7a_cis_nominal.peaks
mkdir -p $out1

QTLtools cis --vcf   0_BAM/Phenotype_Genotype/BA9.recode.vcf.gz    --bed  $inputPath/$file1.sorted.bed.gz    --cov  $inputPath/PCA_phenotype/merged.sorted.15.pca    \
             --nominal 0.0001    --out $out1/$file1.nominals.txt  --log $out1/$file1.Log   >  $out1/$file1.runLog.txt 2>&1 












