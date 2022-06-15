file1=merged
inputPath=4b_keptRegions.gene


out1=8b_trans_full.genes
mkdir  $out1
 

 
QTLtools trans   --vcf   0_BAM/Phenotype_Genotype/BA9.recode.vcf.gz   --bed  $inputPath/$file1.sorted.bed.gz   --nominal   --threshold 0.0001  --out   $out1/$file1.trans.nominal.txt  --log $out1/$file1.trans.nominal.Log   >  $out1/$file1.trans.nominal.runLog.txt 2>&1 
 



for j in $(seq 1 100); do
      nohup QTLtools trans --vcf 0_BAM/Phenotype_Genotype/BA9.recode.vcf.gz    --bed $inputPath/$file1.sorted.bed.gz   --permute    --out $out1/$file1.trans.permutation.$j.txt     --seed $j   --log $out1/$file1.trans.permutation.$j.Log   >  $out1/$file1.trans.permutation.$j.runLog.txt 2>&1   &                       
done  
 
 
 
