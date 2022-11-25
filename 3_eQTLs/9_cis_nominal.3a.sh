genotype=../0_Genotype_Phenotype/1_Genotype/5_eachBrainRegion_MAF20/C_samples.vcf.gz
phenotype=4_INT/3_C/Full.logOR_INT.sorted.bed.gz
file1=3_C


## 1. cavariates only come from phenotype PCA 
out=9_cis_nominal/3_C
mkdir  -p  $out


out1=$out/1.0
mkdir -p $out1
QTLtools cis --vcf   $genotype       --bed  $phenotype         \
             --nominal 0.005         --std-err  --out $out1/$file1.nominals.txt  --log $out1/$file1.Log   >  $out1/$file1.runLog.txt 2>&1


out1=$out/onlyKnown
mkdir -p $out1
QTLtools cis --vcf   $genotype       --bed  $phenotype      --cov  0_Regions/knownFactors/$file1.knownFactors.all.txt   \
             --nominal 0.005         --std-err  --out $out1/$file1.nominals.txt  --log $out1/$file1.Log   >  $out1/$file1.runLog.txt 2>&1


for n in $(seq 1 21); do
    out1=$out/1.$n
    mkdir -p $out1
    QTLtools cis --vcf   $genotype       --bed  $phenotype    --cov  7_Covariates/$file1/PCA/PCA.$n.txt    \
                 --nominal 0.005         --std-err  --out $out1/$file1.nominals.txt  --log $out1/$file1.Log   >  $out1/$file1.runLog.txt 2>&1
done  











