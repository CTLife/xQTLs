input_g=../0_Genotype_Phenotype/1_Genotype/5_eachBrainRegion_MAF20
output_g=6_PCA_Genotype
mkdir $output_g


output2="$output_g/1_BA9"
mkdir $output2
prefix=BA9_samples
vcf=$input_g/$prefix.vcf.gz
QTLtools pca  --vcf  $vcf   --scale   --center  --distance 5000  --out   $output2/$prefix.vcf   --log $output2/$prefix.vcf.Log  >   $output2/$prefix.vcf.runLog.txt 2>&1                

 

output2="$output_g/2_BA24"
mkdir $output2
prefix=BA24_samples
vcf=$input_g/$prefix.vcf.gz
QTLtools pca  --vcf  $vcf   --scale   --center  --distance 5000  --out   $output2/$prefix.vcf   --log $output2/$prefix.vcf.Log  >   $output2/$prefix.vcf.runLog.txt 2>&1                



output2="$output_g/3_C"
mkdir $output2
prefix=C_samples
vcf=$input_g/$prefix.vcf.gz
QTLtools pca  --vcf  $vcf   --scale   --center  --distance 5000  --out   $output2/$prefix.vcf   --log $output2/$prefix.vcf.Log  >   $output2/$prefix.vcf.runLog.txt 2>&1                



output2="$output_g/4_H"
mkdir $output2
prefix=H_samples
vcf=$input_g/$prefix.vcf.gz
QTLtools pca  --vcf  $vcf   --scale   --center  --distance 5000  --out   $output2/$prefix.vcf   --log $output2/$prefix.vcf.Log  >   $output2/$prefix.vcf.runLog.txt 2>&1                



output2="$output_g/5_T"
mkdir $output2
prefix=T_samples
vcf=$input_g/$prefix.vcf.gz
QTLtools pca  --vcf  $vcf   --scale   --center  --distance 5000  --out   $output2/$prefix.vcf   --log $output2/$prefix.vcf.Log  >   $output2/$prefix.vcf.runLog.txt 2>&1                





