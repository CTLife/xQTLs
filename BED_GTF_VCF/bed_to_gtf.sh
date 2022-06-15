name1=BA9.peaks
sort  -k1,1   -k2,2n   $name1.bed     >  $name1.sorted.bed 
bedToGenePred   $name1.sorted.bed   $name1.sorted.genePred
genePredToGtf   file   $name1.sorted.genePred     $name1.sorted.gtf

bgzip   $name1.sorted.gtf
 



