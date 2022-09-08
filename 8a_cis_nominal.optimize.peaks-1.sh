file1=merged
inputPath=4a_keptPeaks



## 1. cavariates only come from phenotype PCA 
out=8a_cis_nominal.optimize.peaks
mkdir  $out


out1=$out/1.0
mkdir -p $out1
QTLtools cis --vcf   0_BAM/Phenotype_Genotype/BA9_samples.MAF15.vcf.gz       --bed  $inputPath/$file1.sorted.bed.gz         \
             --nominal 0.0001    --std-err  --out $out1/$file1.nominals.txt  --log $out1/$file1.Log   >  $out1/$file1.runLog.txt 2>&1


out1=$out/onlyKnown
mkdir -p $out1
QTLtools cis --vcf   0_BAM/Phenotype_Genotype/BA9_samples.MAF15.vcf.gz       --bed  $inputPath/$file1.sorted.bed.gz      --cov  PCA_PEER/BA9.knownFactors.all.txt   \
             --nominal 0.0001    --std-err  --out $out1/$file1.nominals.txt  --log $out1/$file1.Log   >  $out1/$file1.runLog.txt 2>&1


for n in $(seq 1 21); do
    out1=$out/1.$n
    mkdir -p $out1
    QTLtools cis --vcf   0_BAM/Phenotype_Genotype/BA9_samples.MAF15.vcf.gz       --bed  $inputPath/$file1.sorted.bed.gz    --cov  7a_Peaks_Factors/PCA/PCA.$n.txt    \
                 --nominal 0.0001    --std-err  --out $out1/$file1.nominals.txt  --log $out1/$file1.Log   >  $out1/$file1.runLog.txt 2>&1
done  











