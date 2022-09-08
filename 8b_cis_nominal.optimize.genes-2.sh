file1=merged
inputPath=4b_keptGenes



## 2. cavariates only come from phenotype PCA and known factors
out=8b_cis_nominal.optimize.genes
##mkdir  $out



for n in $(seq 1 21); do
    out1=$out/2.$n
    mkdir -p $out1
    QTLtools cis --vcf   0_BAM/Phenotype_Genotype/BA9_samples.MAF15.vcf.gz       --bed  $inputPath/$file1.sorted.bed.gz    --cov  7b_Genes_Factors/PCA/PCA.withKnown.$n.txt    \
                 --nominal 0.0001    --std-err  --out $out1/$file1.nominals.txt  --log $out1/$file1.Log   >  $out1/$file1.runLog.txt 2>&1
done  











