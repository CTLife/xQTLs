genotype=../0_Genotype_Phenotype/1_Genotype/5_eachBrainRegion_MAF20/H_samples.vcf.gz
phenotype=4_INT/4_H/Full.logOR_INT.sorted.bed.gz
file1=4_H


## 3. cavariates only come from phenotype PEER factors
out=11_cis_permutation/4_H
mkdir  -p  $out



for n in $(seq 1 21); do
    out1=$out/3.$n
    mkdir -p $out1
    QTLtools cis --vcf   $genotype       --bed  $phenotype    --cov  7_Covariates/$file1/PEER/factors.$n.txt    \
                 --permute 1000          --std-err  --out $out1/$file1.permutation.txt  --log $out1/$file1.Log   >  $out1/$file1.runLog.txt 2>&1
done  











