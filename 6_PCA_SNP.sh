output_g=6_PCA_SNP
mkdir $output_g

file1=SNPs
QTLtools pca  --vcf  0_BAM/Phenotype_Genotype/BA24_samples.MAF15.vcf.gz   --scale   --center  --maf 0.15  --distance 5000  --out   $output_g/$file1.vcf   --log $output_g/$file1.vcf.Log  >   $output_g/$file1.vcf.runLog.txt 2>&1                

## Then change the column orders, let them match the order of the matrix of genotype and phenotype.


