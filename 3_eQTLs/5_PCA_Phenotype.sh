#########################################
input_g=4_INT/1_BA9
output_g=5_PCA_Phenotype/1_BA9
mkdir -p  $output_g

prefix=Full.logOR_INT
QTLtools pca  --bed  $input_g/$prefix.sorted.bed.gz      --out   $output_g/$prefix   --log $output_g/$prefix.Log  >   $output_g/$prefix.runLog.txt 2>&1      


#########################################
input_g=4_INT/2_BA24
output_g=5_PCA_Phenotype/2_BA24
mkdir -p  $output_g

prefix=Full.logOR_INT
QTLtools pca  --bed  $input_g/$prefix.sorted.bed.gz      --out   $output_g/$prefix   --log $output_g/$prefix.Log  >   $output_g/$prefix.runLog.txt 2>&1      


  
#########################################
input_g=4_INT/3_C
output_g=5_PCA_Phenotype/3_C
mkdir -p  $output_g

prefix=Full.logOR_INT
QTLtools pca  --bed  $input_g/$prefix.sorted.bed.gz      --out   $output_g/$prefix   --log $output_g/$prefix.Log  >   $output_g/$prefix.runLog.txt 2>&1      


 
#########################################
input_g=4_INT/4_H
output_g=5_PCA_Phenotype/4_H
mkdir -p  $output_g

prefix=Full.logOR_INT
QTLtools pca  --bed  $input_g/$prefix.sorted.bed.gz      --out   $output_g/$prefix   --log $output_g/$prefix.Log  >   $output_g/$prefix.runLog.txt 2>&1      


 
#########################################
input_g=4_INT/5_T
output_g=5_PCA_Phenotype/5_T
mkdir -p  $output_g

prefix=Full.logOR_INT
QTLtools pca  --bed  $input_g/$prefix.sorted.bed.gz      --out   $output_g/$prefix   --log $output_g/$prefix.Log  >   $output_g/$prefix.runLog.txt 2>&1      






