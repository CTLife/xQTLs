output_g=PCA_phenotype
file1=merged.sorted
mkdir $output_g
QTLtools pca  --bed  $file1.bed.gz   --scale   --center   --out   $output_g/$file1.bed   --log $output_g/$file1.bed.Log  >   $output_g/$file1.bed.runLog.txt 2>&1 

known2="../BA9.knownFactors.all.nohead"

for n in $(seq 1 20); do
    let "m=n+1"
    head -n $m   $output_g/$file1.bed.pca  >   $output_g/$file1.$n.pca
    cat  $output_g/$file1.$n.pca  $known2  >   $output_g/$file1.wihtKnown.$n.pca
done  

 



output2=PCA_genotype
mkdir $output2
for n in $(seq 1 20); do
    let "m=n+1"
    head -n $m   ../5_PCA_genotype/SNPs.vcf.pca  >   $output2/genotype.$n.pca
    cat  $output2/genotype.$n.pca  $known2       >   $output2/genotype.wihtKnown.$n.pca
done  

 
