file1=merged
inputPath=4b_keptRegions.gene



## 1. cavariates only come from phenotype PCA 

out1=6b_cis_permutation.gene/1.0
mkdir -p $out1
QTLtools cis --vcf   0_BAM/Phenotype_Genotype/BA9.recode.vcf.gz   --bed  $inputPath/$file1.sorted.bed.gz         \
             --permute 1000    --out $out1/$file1.permutation.txt  --log $out1/$file1.Log    >  $out1/$file1.runLog.txt 2>&1 


out1=6b_cis_permutation.gene/1.1
mkdir -p $out1
QTLtools cis --vcf   0_BAM/Phenotype_Genotype/BA9.recode.vcf.gz   --bed  $inputPath/$file1.sorted.bed.gz    --cov   $inputPath/PCA_phenotype/merged.sorted.1.pca    \
             --permute 1000    --out $out1/$file1.permutation.txt  --log $out1/$file1.Log    >  $out1/$file1.runLog.txt 2>&1 


out1=6b_cis_permutation.gene/1.2
mkdir -p $out1
QTLtools cis --vcf   0_BAM/Phenotype_Genotype/BA9.recode.vcf.gz   --bed  $inputPath/$file1.sorted.bed.gz    --cov   $inputPath/PCA_phenotype/merged.sorted.2.pca    \
             --permute 1000    --out $out1/$file1.permutation.txt  --log $out1/$file1.Log     >  $out1/$file1.runLog.txt 2>&1 


out1=6b_cis_permutation.gene/1.3
mkdir -p $out1
QTLtools cis --vcf   0_BAM/Phenotype_Genotype/BA9.recode.vcf.gz   --bed  $inputPath/$file1.sorted.bed.gz    --cov   $inputPath/PCA_phenotype/merged.sorted.3.pca   \
             --permute 1000    --out $out1/$file1.permutation.txt  --log $out1/$file1.Log   >  $out1/$file1.runLog.txt 2>&1 


out1=6b_cis_permutation.gene/1.4
mkdir -p $out1
QTLtools cis --vcf   0_BAM/Phenotype_Genotype/BA9.recode.vcf.gz   --bed  $inputPath/$file1.sorted.bed.gz    --cov   $inputPath/PCA_phenotype/merged.sorted.4.pca    \
             --permute 1000    --out $out1/$file1.permutation.txt  --log $out1/$file1.Log   >  $out1/$file1.runLog.txt 2>&1 


out1=6b_cis_permutation.gene/1.5
mkdir -p $out1
QTLtools cis --vcf   0_BAM/Phenotype_Genotype/BA9.recode.vcf.gz   --bed  $inputPath/$file1.sorted.bed.gz    --cov   $inputPath/PCA_phenotype/merged.sorted.5.pca    \
             --permute 1000    --out $out1/$file1.permutation.txt  --log $out1/$file1.Log   >  $out1/$file1.runLog.txt 2>&1 


out1=6b_cis_permutation.gene/1.6
mkdir -p $out1
QTLtools cis --vcf   0_BAM/Phenotype_Genotype/BA9.recode.vcf.gz   --bed  $inputPath/$file1.sorted.bed.gz    --cov   $inputPath/PCA_phenotype/merged.sorted.6.pca    \
             --permute 1000    --out $out1/$file1.permutation.txt  --log $out1/$file1.Log   >  $out1/$file1.runLog.txt 2>&1 



out1=6b_cis_permutation.gene/1.7
mkdir -p $out1
QTLtools cis --vcf   0_BAM/Phenotype_Genotype/BA9.recode.vcf.gz   --bed  $inputPath/$file1.sorted.bed.gz    --cov   $inputPath/PCA_phenotype/merged.sorted.7.pca    \
             --permute 1000    --out $out1/$file1.permutation.txt  --log $out1/$file1.Log   >  $out1/$file1.runLog.txt 2>&1 


out1=6b_cis_permutation.gene/1.8
mkdir -p $out1
QTLtools cis --vcf   0_BAM/Phenotype_Genotype/BA9.recode.vcf.gz   --bed  $inputPath/$file1.sorted.bed.gz    --cov   $inputPath/PCA_phenotype/merged.sorted.8.pca    \
             --permute 1000    --out $out1/$file1.permutation.txt  --log $out1/$file1.Log   >  $out1/$file1.runLog.txt 2>&1 



out1=6b_cis_permutation.gene/1.9
mkdir -p $out1
QTLtools cis --vcf   0_BAM/Phenotype_Genotype/BA9.recode.vcf.gz   --bed  $inputPath/$file1.sorted.bed.gz    --cov   $inputPath/PCA_phenotype/merged.sorted.9.pca    \
             --permute 1000    --out $out1/$file1.permutation.txt  --log $out1/$file1.Log   >  $out1/$file1.runLog.txt 2>&1 


out1=6b_cis_permutation.gene/1.10
mkdir -p $out1
QTLtools cis --vcf   0_BAM/Phenotype_Genotype/BA9.recode.vcf.gz   --bed  $inputPath/$file1.sorted.bed.gz    --cov   $inputPath/PCA_phenotype/merged.sorted.10.pca    \
             --permute 1000    --out $out1/$file1.permutation.txt  --log $out1/$file1.Log   >  $out1/$file1.runLog.txt 2>&1 


out1=6b_cis_permutation.gene/1.11
mkdir -p $out1
QTLtools cis --vcf   0_BAM/Phenotype_Genotype/BA9.recode.vcf.gz   --bed  $inputPath/$file1.sorted.bed.gz    --cov   $inputPath/PCA_phenotype/merged.sorted.11.pca    \
             --permute 1000    --out $out1/$file1.permutation.txt  --log $out1/$file1.Log   >  $out1/$file1.runLog.txt 2>&1 



out1=6b_cis_permutation.gene/1.12
mkdir -p $out1
QTLtools cis --vcf   0_BAM/Phenotype_Genotype/BA9.recode.vcf.gz   --bed  $inputPath/$file1.sorted.bed.gz    --cov   $inputPath/PCA_phenotype/merged.sorted.12.pca    \
             --permute 1000    --out $out1/$file1.permutation.txt  --log $out1/$file1.Log   >  $out1/$file1.runLog.txt 2>&1 


out1=6b_cis_permutation.gene/1.13
mkdir -p $out1
QTLtools cis --vcf   0_BAM/Phenotype_Genotype/BA9.recode.vcf.gz   --bed  $inputPath/$file1.sorted.bed.gz    --cov   $inputPath/PCA_phenotype/merged.sorted.13.pca    \
             --permute 1000    --out $out1/$file1.permutation.txt  --log $out1/$file1.Log   >  $out1/$file1.runLog.txt 2>&1 



out1=6b_cis_permutation.gene/1.14
mkdir -p $out1
QTLtools cis --vcf   0_BAM/Phenotype_Genotype/BA9.recode.vcf.gz   --bed  $inputPath/$file1.sorted.bed.gz    --cov   $inputPath/PCA_phenotype/merged.sorted.14.pca    \
             --permute 1000    --out $out1/$file1.permutation.txt  --log $out1/$file1.Log   >  $out1/$file1.runLog.txt 2>&1 


out1=6b_cis_permutation.gene/1.15
mkdir -p $out1
QTLtools cis --vcf   0_BAM/Phenotype_Genotype/BA9.recode.vcf.gz   --bed  $inputPath/$file1.sorted.bed.gz    --cov   $inputPath/PCA_phenotype/merged.sorted.15.pca    \
             --permute 1000    --out $out1/$file1.permutation.txt  --log $out1/$file1.Log   >  $out1/$file1.runLog.txt 2>&1 



out1=6b_cis_permutation.gene/1.16
mkdir -p $out1
QTLtools cis --vcf   0_BAM/Phenotype_Genotype/BA9.recode.vcf.gz   --bed  $inputPath/$file1.sorted.bed.gz    --cov   $inputPath/PCA_phenotype/merged.sorted.16.pca    \
             --permute 1000    --out $out1/$file1.permutation.txt  --log $out1/$file1.Log   >  $out1/$file1.runLog.txt 2>&1 


out1=6b_cis_permutation.gene/1.17
mkdir -p $out1
QTLtools cis --vcf   0_BAM/Phenotype_Genotype/BA9.recode.vcf.gz   --bed  $inputPath/$file1.sorted.bed.gz    --cov   $inputPath/PCA_phenotype/merged.sorted.17.pca    \
             --permute 1000    --out $out1/$file1.permutation.txt  --log $out1/$file1.Log   >  $out1/$file1.runLog.txt 2>&1 



out1=6b_cis_permutation.gene/1.18
mkdir -p $out1
QTLtools cis --vcf   0_BAM/Phenotype_Genotype/BA9.recode.vcf.gz   --bed  $inputPath/$file1.sorted.bed.gz    --cov   $inputPath/PCA_phenotype/merged.sorted.18.pca    \
             --permute 1000    --out $out1/$file1.permutation.txt  --log $out1/$file1.Log   >  $out1/$file1.runLog.txt 2>&1 


out1=6b_cis_permutation.gene/1.19
mkdir -p $out1
QTLtools cis --vcf   0_BAM/Phenotype_Genotype/BA9.recode.vcf.gz   --bed  $inputPath/$file1.sorted.bed.gz    --cov   $inputPath/PCA_phenotype/merged.sorted.19.pca    \
             --permute 1000    --out $out1/$file1.permutation.txt  --log $out1/$file1.Log   >  $out1/$file1.runLog.txt 2>&1 



out1=6b_cis_permutation.gene/1.20
mkdir -p $out1
QTLtools cis --vcf   0_BAM/Phenotype_Genotype/BA9.recode.vcf.gz   --bed  $inputPath/$file1.sorted.bed.gz    --cov   $inputPath/PCA_phenotype/merged.sorted.20.pca    \
             --permute 1000    --out $out1/$file1.permutation.txt  --log $out1/$file1.Log   >  $out1/$file1.runLog.txt 2>&1 


 






















