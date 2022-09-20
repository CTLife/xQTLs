
#####################
file1=merged
inputPath=4b_keptGenes

out=10b_cis_permutation.optimize.genes
mkdir  $out


out1=$out/1.0
mkdir -p $out1
QTLtools cis --vcf   0_BAM/Phenotype_Genotype/BA9_samples.MAF15.vcf.gz       --bed  $inputPath/$file1.sorted.bed.gz         \
             --permute 1000    --std-err  --out $out1/$file1.permutation.txt  --log $out1/$file1.Log   >  $out1/$file1.runLog.txt 2>&1


out1=$out/onlyKnown
mkdir -p $out1
QTLtools cis --vcf   0_BAM/Phenotype_Genotype/BA9_samples.MAF15.vcf.gz       --bed  $inputPath/$file1.sorted.bed.gz      --cov  PCA_PEER/BA9.knownFactors.all.txt   \
             --permute 1000    --std-err  --out $out1/$file1.permutation.txt  --log $out1/$file1.Log   >  $out1/$file1.runLog.txt 2>&1


for n in $(seq 1 3); do
    out1=$out/1.$n
    mkdir -p $out1
    QTLtools cis --vcf   0_BAM/Phenotype_Genotype/BA9_samples.MAF15.vcf.gz       --bed  $inputPath/$file1.sorted.bed.gz    --cov  7a_Peaks_Factors/PCA/PCA.$n.txt    \
                 --permute 1000    --std-err  --out $out1/$file1.permutation.txt  --log $out1/$file1.Log   >  $out1/$file1.runLog.txt 2>&1
done  













