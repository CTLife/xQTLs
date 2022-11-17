IP <- read.table( "6_mergedRPKM/finalMergedPeaks/IP/forward/merged.bed", head=T, comment.char = "")
dim(IP)
IP[1:10, 1:10]

Input <- read.table( "6_mergedRPKM/finalMergedPeaks/Input/forward/merged.bed", head=T, comment.char = "")
dim(Input)
Input[1:10, 1:10]

IP[1:10, 4]
Input[1:10, 4]
bool1 = (IP[, 4] == Input[, 4])
bool1 
length(bool1 )
length(bool1[bool1])

IP_head = as.matrix( IP[,1:6] )
IP = as.matrix( IP[,-c(1:6)] )

Input_head = as.matrix( Input[,1:6] )
Input = as.matrix( Input[,-c(1:6)] )

IP_head[1:5,]
Input_head[1:5,]

mat_head = as.matrix( IP_head )
mat = as.matrix( log2((IP+0.01)/(Input+0.01)) )
dim(mat_head)
dim(mat)
mat_head[1:10,]
mat[1:10,1:10]

cMat = as.vector(mat)
length(cMat)
length(cMat[cMat>0])
length(cMat[cMat==0])
length(cMat[cMat<0])

count <- read.table( "4_mergedCounts/finalMergedPeaks/IP/forward/merged.bed", head=T, comment.char = "")
dim(count)
count <- count[order(count[,4],decreasing=FALSE),]

count_head = as.matrix( count[,1:6] )
count = as.matrix( count[,-c(1:6)] )
dim(count_head)
dim(count)
count_head[1:10,]
count[1:10,1:10]

bool1 = (mat_head[,4] == count_head[,4])
length(bool1[bool1])
#######################################################################################################################################




#######################################################################################################################################
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
length(numOfZero1[numOfZero1>10])
length(numOfZero1[numOfZero1<5])


## Standard Deviation of each row
rowSD1 = apply(mat,  1,  sd, na.rm=TRUE)
length(rowSD1)
length(rowSD1[rowSD1==0])
length(rowSD1[rowSD1>2])
length(rowSD1[rowSD1<1])


## Coefficient of Variation of each row
CoefficientOfVariation <- function(x) {
  cv = 0
  if(mean(x) != 0) {cv = sd(x)/mean(x) }
  if(mean(x) == 0) {cv = sd(x)/0.001 }
  return( cv )
}
CV1 = apply(mat,  1, CoefficientOfVariation )
length(CV1)
length(CV1[abs(CV1)<0.5])
length(CV1[abs(CV1)<0.2])
length(CV1[abs(CV1)<0.1])


## Top 20%
Top20percent <- function(x) {
   temp20 = as.numeric( quantile(x, probs = seq(0, 1, 0.2),  na.rm = TRUE ) )
   return( temp20[5] )
}
Top20p = apply(mat,  1, Top20percent )
length(Top20p)
length(Top20p[Top20p>3])
length(Top20p[Top20p>2])
length(Top20p[Top20p>1])
length(Top20p[Top20p>0.1])
 


print("#####################################1")
length(rowMax1)
length(numOfZero1)
length(rowSD1)
length(CV1)
length(Top20p)


print("#####################################2")
length( rowMax1[ rowMax1 > 1 ] )
length( numOfZero1[ numOfZero1 < 20 ] )
length( rowSD1[ rowSD1 > 0.1 ] )
length( CV1[ abs(CV1)  > 0.1 ] )
length( Top20p[Top20p  > 0   ] )
print("#####################################3")
#######################################################################################################################################




count_Top20p = apply(count,  1, Top20percent )
length( count_Top20p )
length( count_Top20p[count_Top20p  >= 20   ] )
#######################################################################################################################################








mybool = (     (numOfZero1<=10)   & (Top20p>= -5)  &  (count_Top20p>=10) )
length( mybool )
length( mybool[mybool] )


mat1 = mat[mybool,]
mat_head1 = mat_head[mybool,]
dim(mat_head1)
dim(mat1)
print("#####################################4")


AllResults_g <- "8a_filter-m6A-Peaks"
if( ! file.exists(AllResults_g) ) { dir.create(path=AllResults_g, recursive = TRUE) }

write.table(  cbind(mat_head1, mat1), paste0(AllResults_g, "/merged.bed"), quote=F, sep="\t", row.names=F, col.names=T )
write.table(   mat1 , paste0(AllResults_g, "/merged.txt"), quote=F, sep="\t", row.names=F, col.names=T )
write.table(   mat_head1 , paste0(AllResults_g, "/merged.onlyregions.bed"), quote=F, sep="\t", row.names=F, col.names=F )



mat2 = mat[!mybool,]
mat_head2 = mat_head[!mybool,]
write.table(  cbind(mat_head2, mat2), paste0(AllResults_g, "/removed.merged.bed"), quote=F, sep="\t", row.names=F, col.names=T )
write.table(   mat2 , paste0(AllResults_g, "/removed.merged.txt"), quote=F, sep="\t", row.names=F, col.names=T )
dim(mat_head2)
dim(mat2)



system( " sed -i -e 's/^X./#/'  8a_filter-m6A-Peaks/merged.bed " )
system( " sort -k1,1   -k2,2n   8a_filter-m6A-Peaks/merged.bed     >  8a_filter-m6A-Peaks/merged.sorted.bed   " )
system( " bgzip   8a_filter-m6A-Peaks/merged.sorted.bed  " )
system( " tabix  -p bed  8a_filter-m6A-Peaks/merged.sorted.bed.gz  " )










