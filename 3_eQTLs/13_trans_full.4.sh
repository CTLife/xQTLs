
genotype=../0_Genotype_Phenotype/1_Genotype/5_eachBrainRegion_MAF20/H_samples.vcf.gz
file1=4_H
phenotype=4_INT/$file1/Full.logOR_INT.sorted.bed.gz
covariates=7_Covariates/$file1/PEER/factors.withKnown.15.txt
out=13_trans_full/$file1
mkdir  -p  $out

QTLtools trans   --vcf   $genotype   --bed   $phenotype   --cov  $covariates  --nominal   --window 1e6   --threshold 1e-4  \
                 --out   $out/$file1.trans.nominal.txt  --log $out/$file1.trans.nominal.Log   >  $out/$file1.trans.nominal.runLog.txt 2>&1 
 

for j in $(seq 1 100); do
       QTLtools trans  --vcf $genotype   --bed $phenotype  --cov $covariates  --permute     --window 1e6   --threshold 1e-4    \
       --out $out/$file1.trans.permutation.$j.txt     --seed $j   --log $out/$file1.trans.permutation.$j.Log   >  $out/$file1.trans.permutation.$j.runLog.txt 2>&1                        
done  
 
 
 
