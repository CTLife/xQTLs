mat <- read.table( "3b_merge.gene/merged.bed", head=T, comment.char = "")
dim(mat)
head(mat)
mat_head = as.matrix( mat[,1:6] )
mat = as.matrix( mat[,-c(1:6)] )
dim(mat_head)
dim(mat)

## max of each row
rowMax1 = apply(mat,  1,  max, na.rm=TRUE)
length(rowMax1)
length(rowMax1[rowMax1>1])
length(rowMax1[rowMax1<=1])

## Number of zeros of each row
numOfZero <- function(x) {
    return(length(which(x == 0)))
}
numOfZero1 = apply(mat,  1, numOfZero )
length(numOfZero1)
mat[numOfZero1>10,]
length(numOfZero1[numOfZero1>10])

## Standard Deviation of each row
rowSD1 = apply(mat,  1,  sd, na.rm=TRUE)
length(rowSD1)
length(rowSD1[rowSD1==0])

## Coefficient of Variation of each row
CoefficientOfVariation <- function(x) {
  cv = 0
  if(mean(x) != 0) {cv = sd(x)/mean(x) }
  if(mean(x) == 0) {cv = sd(x)/0.001 }
  return( cv )
}
CV1 = apply(mat,  1, CoefficientOfVariation )
length(CV1)
length(CV1[abs(CV1)<0.2])



## Top 20%
Top20percent <- function(x) {
   temp20 = as.numeric( quantile(x, probs = seq(0, 1, 0.2),  na.rm = TRUE ) )
   return( temp20[5] )
}
Top20p = apply(mat,  1, Top20percent )
length(Top20p)
length(Top20p[Top20p>1])


print("#####################################1")
length(rowMax1)
length(numOfZero1)
length(rowSD1)
length(CV1)
length(Top20p)

print("#####################################2")
length(rowMax1[ rowMax1>1 ])
length(numOfZero1[ numOfZero1<11 ])
length(rowSD1[ rowSD1 > 0 ])
length(CV1[ abs(CV1)>0.1 ])
length(Top20p[Top20p>0.5])
print("#####################################3")

mybool = (   (rowMax1>=1) & (numOfZero1<15) & (rowSD1>0.01)  & (abs(CV1)>0.01)   )
length(mybool[mybool])

mat1 = mat[mybool,]
mat_head1 = mat_head[mybool,]
dim(mat_head1)
dim(mat1)
print("#####################################4")


AllResults_g <- "4b_keptGenes"
if( ! file.exists(AllResults_g) ) { dir.create(path=AllResults_g, recursive = TRUE) }

write.table(  cbind(mat_head1, mat1), paste0(AllResults_g, "/merged.bed"), quote=F, sep="\t", row.names=F, col.names=T )
write.table(   mat1 , paste0(AllResults_g, "/merged.txt"), quote=F, sep="\t", row.names=F, col.names=T )



mat2 = mat[!mybool,]
mat_head2 = mat_head[!mybool,]
write.table(  cbind(mat_head2, mat2), paste0(AllResults_g, "/removed.merged.bed"), quote=F, sep="\t", row.names=F, col.names=T )
write.table(   mat2 , paste0(AllResults_g, "/removed.merged.txt"), quote=F, sep="\t", row.names=F, col.names=T )
dim(mat_head2)
dim(mat2)



system( " sed -i -e 's/^X./#/'  4b_keptGenes/merged.bed " )
system( " sort -k1,1   -k2,2n   4b_keptGenes/merged.bed     >  4b_keptGenes/merged.sorted.bed   " )
system( " bgzip   4b_keptGenes/merged.sorted.bed  " )
system( " tabix  -p bed  4b_keptGenes/merged.sorted.bed.gz  " )




