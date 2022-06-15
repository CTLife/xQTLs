file1=merged
inputPath=4b_keptRegions.gene



## 1. cavariates  come from phenotype PCA and Known factors

out1=6b_cis_permutation.gene/2.0
mkdir -p $out1
QTLtools cis --vcf   0_BAM/Phenotype_Genotype/BA9.recode.vcf.gz   --bed  $inputPath/$file1.sorted.bed.gz       --cov   BA9.knownFactors.all.txt   \
             --permute 1000    --out $out1/$file1.permutation.txt  --log $out1/$file1.Log    >  $out1/$file1.runLog.txt 2>&1 


out1=6b_cis_permutation.gene/2.1
mkdir -p $out1
QTLtools cis --vcf   0_BAM/Phenotype_Genotype/BA9.recode.vcf.gz   --bed  $inputPath/$file1.sorted.bed.gz    --cov   $inputPath/PCA_phenotype/merged.sorted.wihtKnown.1.pca    \
             --permute 1000    --out $out1/$file1.permutation.txt  --log $out1/$file1.Log    >  $out1/$file1.runLog.txt 2>&1 


out1=6b_cis_permutation.gene/2.2
mkdir -p $out1
QTLtools cis --vcf   0_BAM/Phenotype_Genotype/BA9.recode.vcf.gz   --bed  $inputPath/$file1.sorted.bed.gz    --cov   $inputPath/PCA_phenotype/merged.sorted.wihtKnown.2.pca    \
             --permute 1000    --out $out1/$file1.permutation.txt  --log $out1/$file1.Log     >  $out1/$file1.runLog.txt 2>&1 


out1=6b_cis_permutation.gene/2.3
mkdir -p $out1
QTLtools cis --vcf   0_BAM/Phenotype_Genotype/BA9.recode.vcf.gz   --bed  $inputPath/$file1.sorted.bed.gz    --cov   $inputPath/PCA_phenotype/merged.sorted.wihtKnown.3.pca   \
             --permute 1000    --out $out1/$file1.permutation.txt  --log $out1/$file1.Log   >  $out1/$file1.runLog.txt 2>&1 


out1=6b_cis_permutation.gene/2.4
mkdir -p $out1
QTLtools cis --vcf   0_BAM/Phenotype_Genotype/BA9.recode.vcf.gz   --bed  $inputPath/$file1.sorted.bed.gz    --cov   $inputPath/PCA_phenotype/merged.sorted.wihtKnown.4.pca    \
             --permute 1000    --out $out1/$file1.permutation.txt  --log $out1/$file1.Log   >  $out1/$file1.runLog.txt 2>&1 


out1=6b_cis_permutation.gene/2.5
mkdir -p $out1
QTLtools cis --vcf   0_BAM/Phenotype_Genotype/BA9.recode.vcf.gz   --bed  $inputPath/$file1.sorted.bed.gz    --cov   $inputPath/PCA_phenotype/merged.sorted.wihtKnown.5.pca    \
             --permute 1000    --out $out1/$file1.permutation.txt  --log $out1/$file1.Log   >  $out1/$file1.runLog.txt 2>&1 


out1=6b_cis_permutation.gene/2.6
mkdir -p $out1
QTLtools cis --vcf   0_BAM/Phenotype_Genotype/BA9.recode.vcf.gz   --bed  $inputPath/$file1.sorted.bed.gz    --cov   $inputPath/PCA_phenotype/merged.sorted.wihtKnown.6.pca    \
             --permute 1000    --out $out1/$file1.permutation.txt  --log $out1/$file1.Log   >  $out1/$file1.runLog.txt 2>&1 



out1=6b_cis_permutation.gene/2.7
mkdir -p $out1
QTLtools cis --vcf   0_BAM/Phenotype_Genotype/BA9.recode.vcf.gz   --bed  $inputPath/$file1.sorted.bed.gz    --cov   $inputPath/PCA_phenotype/merged.sorted.wihtKnown.7.pca    \
             --permute 1000    --out $out1/$file1.permutation.txt  --log $out1/$file1.Log   >  $out1/$file1.runLog.txt 2>&1 


out1=6b_cis_permutation.gene/2.8
mkdir -p $out1
QTLtools cis --vcf   0_BAM/Phenotype_Genotype/BA9.recode.vcf.gz   --bed  $inputPath/$file1.sorted.bed.gz    --cov   $inputPath/PCA_phenotype/merged.sorted.wihtKnown.8.pca    \
             --permute 1000    --out $out1/$file1.permutation.txt  --log $out1/$file1.Log   >  $out1/$file1.runLog.txt 2>&1 



out1=6b_cis_permutation.gene/2.9
mkdir -p $out1
QTLtools cis --vcf   0_BAM/Phenotype_Genotype/BA9.recode.vcf.gz   --bed  $inputPath/$file1.sorted.bed.gz    --cov   $inputPath/PCA_phenotype/merged.sorted.wihtKnown.9.pca    \
             --permute 1000    --out $out1/$file1.permutation.txt  --log $out1/$file1.Log   >  $out1/$file1.runLog.txt 2>&1 


out1=6b_cis_permutation.gene/2.10
mkdir -p $out1
QTLtools cis --vcf   0_BAM/Phenotype_Genotype/BA9.recode.vcf.gz   --bed  $inputPath/$file1.sorted.bed.gz    --cov   $inputPath/PCA_phenotype/merged.sorted.wihtKnown.10.pca    \
             --permute 1000    --out $out1/$file1.permutation.txt  --log $out1/$file1.Log   >  $out1/$file1.runLog.txt 2>&1 


out1=6b_cis_permutation.gene/2.11
mkdir -p $out1
QTLtools cis --vcf   0_BAM/Phenotype_Genotype/BA9.recode.vcf.gz   --bed  $inputPath/$file1.sorted.bed.gz    --cov   $inputPath/PCA_phenotype/merged.sorted.wihtKnown.11.pca    \
             --permute 1000    --out $out1/$file1.permutation.txt  --log $out1/$file1.Log   >  $out1/$file1.runLog.txt 2>&1 



out1=6b_cis_permutation.gene/2.12
mkdir -p $out1
QTLtools cis --vcf   0_BAM/Phenotype_Genotype/BA9.recode.vcf.gz   --bed  $inputPath/$file1.sorted.bed.gz    --cov   $inputPath/PCA_phenotype/merged.sorted.wihtKnown.12.pca    \
             --permute 1000    --out $out1/$file1.permutation.txt  --log $out1/$file1.Log   >  $out1/$file1.runLog.txt 2>&1 


out1=6b_cis_permutation.gene/2.13
mkdir -p $out1
QTLtools cis --vcf   0_BAM/Phenotype_Genotype/BA9.recode.vcf.gz   --bed  $inputPath/$file1.sorted.bed.gz    --cov   $inputPath/PCA_phenotype/merged.sorted.wihtKnown.13.pca    \
             --permute 1000    --out $out1/$file1.permutation.txt  --log $out1/$file1.Log   >  $out1/$file1.runLog.txt 2>&1 



out1=6b_cis_permutation.gene/2.14
mkdir -p $out1
QTLtools cis --vcf   0_BAM/Phenotype_Genotype/BA9.recode.vcf.gz   --bed  $inputPath/$file1.sorted.bed.gz    --cov   $inputPath/PCA_phenotype/merged.sorted.wihtKnown.14.pca    \
             --permute 1000    --out $out1/$file1.permutation.txt  --log $out1/$file1.Log   >  $out1/$file1.runLog.txt 2>&1 


out1=6b_cis_permutation.gene/2.15
mkdir -p $out1
QTLtools cis --vcf   0_BAM/Phenotype_Genotype/BA9.recode.vcf.gz   --bed  $inputPath/$file1.sorted.bed.gz    --cov   $inputPath/PCA_phenotype/merged.sorted.wihtKnown.15.pca    \
             --permute 1000    --out $out1/$file1.permutation.txt  --log $out1/$file1.Log   >  $out1/$file1.runLog.txt 2>&1 



out1=6b_cis_permutation.gene/2.16
mkdir -p $out1
QTLtools cis --vcf   0_BAM/Phenotype_Genotype/BA9.recode.vcf.gz   --bed  $inputPath/$file1.sorted.bed.gz    --cov   $inputPath/PCA_phenotype/merged.sorted.wihtKnown.16.pca    \
             --permute 1000    --out $out1/$file1.permutation.txt  --log $out1/$file1.Log   >  $out1/$file1.runLog.txt 2>&1 


out1=6b_cis_permutation.gene/2.17
mkdir -p $out1
QTLtools cis --vcf   0_BAM/Phenotype_Genotype/BA9.recode.vcf.gz   --bed  $inputPath/$file1.sorted.bed.gz    --cov   $inputPath/PCA_phenotype/merged.sorted.wihtKnown.17.pca    \
             --permute 1000    --out $out1/$file1.permutation.txt  --log $out1/$file1.Log   >  $out1/$file1.runLog.txt 2>&1 



out1=6b_cis_permutation.gene/2.18
mkdir -p $out1
QTLtools cis --vcf   0_BAM/Phenotype_Genotype/BA9.recode.vcf.gz   --bed  $inputPath/$file1.sorted.bed.gz    --cov   $inputPath/PCA_phenotype/merged.sorted.wihtKnown.18.pca    \
             --permute 1000    --out $out1/$file1.permutation.txt  --log $out1/$file1.Log   >  $out1/$file1.runLog.txt 2>&1 


out1=6b_cis_permutation.gene/2.19
mkdir -p $out1
QTLtools cis --vcf   0_BAM/Phenotype_Genotype/BA9.recode.vcf.gz   --bed  $inputPath/$file1.sorted.bed.gz    --cov   $inputPath/PCA_phenotype/merged.sorted.wihtKnown.19.pca    \
             --permute 1000    --out $out1/$file1.permutation.txt  --log $out1/$file1.Log   >  $out1/$file1.runLog.txt 2>&1 



out1=6b_cis_permutation.gene/2.20
mkdir -p $out1
QTLtools cis --vcf   0_BAM/Phenotype_Genotype/BA9.recode.vcf.gz   --bed  $inputPath/$file1.sorted.bed.gz    --cov   $inputPath/PCA_phenotype/merged.sorted.wihtKnown.20.pca    \
             --permute 1000    --out $out1/$file1.permutation.txt  --log $out1/$file1.Log   >  $out1/$file1.runLog.txt 2>&1 


 






















