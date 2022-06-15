file1=merged
inputPath=4a_keptRegions.peaks


out1=8a_trans_full.peaks
mkdir  $out1
 

 
QTLtools trans   --vcf   0_BAM/Phenotype_Genotype/BA9.recode.vcf.gz   --bed  $inputPath/$file1.sorted.bed.gz   --nominal   --threshold 0.0001  --out   $out1/$file1.trans.nominal.txt  --log $out1/$file1.trans.nominal.Log   >  $out1/$file1.trans.nominal.runLog.txt 2>&1 
 



for j in $(seq 1 50); do
      nohup QTLtools trans --vcf 0_BAM/Phenotype_Genotype/BA9.recode.vcf.gz    --bed $inputPath/$file1.sorted.bed.gz   --permute    --out $out1/$file1.trans.permutation.$j.txt     --seed $j   --log $out1/$file1.trans.permutation.$j.Log   >  $out1/$file1.trans.permutation.$j.runLog.txt 2>&1   &                       
done  
 
 
 
 

#for j in $(seq 51 100); do
#      nohup QTLtools trans --vcf 0_BAM/Phenotype_Genotype/BA9.recode.vcf.gz    --bed $inputPath/$file1.sorted.bed.gz   --permute    --out $out1/$file1.trans.permutation.$j.txt     --seed $j   --log $out1/$file1.trans.permutation.$j.Log   >  $out1/$file1.trans.permutation.$j.runLog.txt 2>&1   &                       
#done  
 
 
 
