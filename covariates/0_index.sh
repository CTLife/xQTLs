sed -i -e 's/^X./#/'  merged.bed

sort -k1,1   -k2,2n   merged.bed     >  merged.sorted.bed  
bgzip   merged.sorted.bed 
tabix  -p bed  merged.sorted.bed.gz 



