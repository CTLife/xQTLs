output_g=5_PCA_genotype
mkdir $output_g

file1=SNPs
QTLtools pca  --vcf  0_BAM/Phenotype_Genotype/BA9.recode.vcf.gz   --scale   --center  --maf 0.1 --distance 5000  --out   $output_g/$file1.vcf   --log $output_g/$file1.vcf.Log  >   $output_g/$file1.vcf.runLog.txt 2>&1                




