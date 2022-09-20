
#####################
file1=merged
inputPath=4a_keptPeaks

out=10a_cis_permutation.optimize.peaks


for n in $(seq 13 16); do
    out1=$out/1.$n
    mkdir -p $out1
    QTLtools cis --vcf   0_BAM/Phenotype_Genotype/BA9_samples.MAF15.vcf.gz       --bed  $inputPath/$file1.sorted.bed.gz    --cov  7a_Peaks_Factors/PCA/PCA.$n.txt    \
                 --permute 1000    --std-err  --out $out1/$file1.permutation.txt  --log $out1/$file1.Log   >  $out1/$file1.runLog.txt 2>&1
done  













