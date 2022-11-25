genotype=../0_Genotype_Phenotype/1_Genotype/5_eachBrainRegion_MAF20/T_samples.vcf.gz
phenotype=4_INT/5_T/Full.logOR_INT.sorted.bed.gz
file1=5_T


## 1. cavariates only come from phenotype PCA 
out=11_cis_permutation/5_T
mkdir  -p  $out


out1=$out/1.0
mkdir -p $out1
QTLtools cis --vcf   $genotype       --bed  $phenotype         \
             --permute 1000          --std-err  --out $out1/$file1.permutation.txt  --log $out1/$file1.Log   >  $out1/$file1.runLog.txt 2>&1


out1=$out/onlyKnown
mkdir -p $out1
QTLtools cis --vcf   $genotype       --bed  $phenotype      --cov  0_Regions/knownFactors/$file1.knownFactors.all.txt   \
             --permute 1000          --std-err  --out $out1/$file1.permutation.txt  --log $out1/$file1.Log   >  $out1/$file1.runLog.txt 2>&1


for n in $(seq 1 21); do
    out1=$out/1.$n
    mkdir -p $out1
    QTLtools cis --vcf   $genotype       --bed  $phenotype    --cov  7_Covariates/$file1/PCA/PCA.$n.txt    \
                 --permute 1000          --std-err  --out $out1/$file1.permutation.txt  --log $out1/$file1.Log   >  $out1/$file1.runLog.txt 2>&1
done  











