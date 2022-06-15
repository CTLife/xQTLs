
prefix1=BA9
zcat   $prefix1.recode.vcf.gz  |  grep -P "#CHROM\t"   | sed -e 's/\tQUAL\tFILTER\tINFO\tFORMAT//'  >  $prefix1.genotype.txt 
bcftools query -f '%CHROM\t%POS\t%ID\t%REF\t%ALT[\t%GT]\n'   $prefix1.recode.vcf.gz  >> $prefix1.genotype.txt
gzip   $prefix1.genotype.txt


