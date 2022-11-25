library(edgeR)



#######################################################################################################################################
Input1 <- read.table( "2_mergedCounts/1_BA9/Input/merged.bed",  head=T, comment.char = "")
print("dimension of raw matrix:")
dim(Input1)

Input1_head = as.matrix( Input1[,1:6] )
Input1      = as.matrix( Input1[,-c(1:6)] )
print("dimension of four matrixes:")
dim(Input1_head)
dim(Input1)
  

#/ make the DGEList:
yy <- DGEList(counts = as.matrix(Input1) )
yy$samples
#/ calculate TMM normalization factors:
yyy <- calcNormFactors(yy , method="TMM")
yyy$samples
#/ get the normalized counts:
cpms <- cpm(yyy, log=FALSE)
dim(cpms)

mat1_head = as.matrix( Input1_head )
mat1      = log2(cpms + 1)
print("dimension of final matrixes:")
dim(mat1_head)
dim(mat1)

cMat1 = as.vector(mat1)
print("length:")
length(cMat1)
length(cMat1[cMat1>0])
length(cMat1[cMat1==0])
length(cMat1[cMat1<0])

AllResults1 <- "3_finalPhenotypeMatrix/1_BA9"
if( ! file.exists(AllResults1) ) { dir.create(path=AllResults1, recursive = TRUE) }
mat1_head[,5] = as.numeric(mat1_head[,3]) - as.numeric(mat1_head[,2])
write.table(  cbind(mat1_head, mat1), paste0(AllResults1, "/merged.bed"), quote=F, sep="\t", row.names=F, col.names=T )

system( " sed -i -e 's/^X./#/'  3_finalPhenotypeMatrix/1_BA9/merged.bed " )
system( " sort -k1,1   -k2,2n   3_finalPhenotypeMatrix/1_BA9/merged.bed     >  3_finalPhenotypeMatrix/1_BA9/merged.sorted.bed   " )
system( " bgzip   3_finalPhenotypeMatrix/1_BA9/merged.sorted.bed  " )
system( " tabix  -p bed  3_finalPhenotypeMatrix/1_BA9/merged.sorted.bed.gz  " )
print("End.")
cat("\n\n\n\n\n")
#######################################################################################################################################







#######################################################################################################################################
Input2 <- read.table( "2_mergedCounts/2_BA24/Input/merged.bed",  head=T, comment.char = "")
print("dimension of raw matrix:")
dim(Input2)

Input2_head = as.matrix( Input2[,1:6] )
Input2      = as.matrix( Input2[,-c(1:6)] )
print("dimension of four matrixes:")
dim(Input2_head)
dim(Input2)
  

#/ make the DGEList:
yy <- DGEList(counts = as.matrix(Input2) )
yy$samples
#/ calculate TMM normalization factors:
yyy <- calcNormFactors(yy , method="TMM")
yyy$samples
#/ get the normalized counts:
cpms <- cpm(yyy, log=FALSE)
dim(cpms)

mat2_head = as.matrix( Input2_head )
mat2      = log2(cpms + 1)
print("dimension of final matrixes:")
dim(mat2_head)
dim(mat2)

cmat2 = as.vector(mat2)
print("length:")
length(cmat2)
length(cmat2[cmat2>0])
length(cmat2[cmat2==0])
length(cmat2[cmat2<0])

AllResults1 <- "3_finalPhenotypeMatrix/2_BA24"
if( ! file.exists(AllResults1) ) { dir.create(path=AllResults1, recursive = TRUE) }
mat2_head[,5] = as.numeric(mat2_head[,3]) - as.numeric(mat2_head[,2])
write.table(  cbind(mat2_head, mat2), paste0(AllResults1, "/merged.bed"), quote=F, sep="\t", row.names=F, col.names=T )

system( " sed -i -e 's/^X./#/'  3_finalPhenotypeMatrix/2_BA24/merged.bed " )
system( " sort -k1,1   -k2,2n   3_finalPhenotypeMatrix/2_BA24/merged.bed     >  3_finalPhenotypeMatrix/2_BA24/merged.sorted.bed   " )
system( " bgzip   3_finalPhenotypeMatrix/2_BA24/merged.sorted.bed  " )
system( " tabix  -p bed  3_finalPhenotypeMatrix/2_BA24/merged.sorted.bed.gz  " )
print("End.")
cat("\n\n\n\n\n")
#######################################################################################################################################






#######################################################################################################################################
Input3 <- read.table( "2_mergedCounts/3_C/Input/merged.bed",  head=T, comment.char = "")
print("dimension of raw matrix:")
dim(Input3)

Input3_head = as.matrix( Input3[,1:6] )
Input3      = as.matrix( Input3[,-c(1:6)] )
print("dimension of four matrixes:")
dim(Input3_head)
dim(Input3)
  

#/ make the DGEList:
yy <- DGEList(counts = as.matrix(Input3) )
yy$samples
#/ calculate TMM normalization factors:
yyy <- calcNormFactors(yy , method="TMM")
yyy$samples
#/ get the normalized counts:
cpms <- cpm(yyy, log=FALSE)
dim(cpms)

mat3_head = as.matrix( Input3_head )
mat3      = log2(cpms + 1)
print("dimension of final matrixes:")
dim(mat3_head)
dim(mat3)

cmat3 = as.vector(mat3)
print("length:")
length(cmat3)
length(cmat3[cmat3>0])
length(cmat3[cmat3==0])
length(cmat3[cmat3<0])

AllResults1 <- "3_finalPhenotypeMatrix/3_C"
if( ! file.exists(AllResults1) ) { dir.create(path=AllResults1, recursive = TRUE) }
mat3_head[,5] = as.numeric(mat3_head[,3]) - as.numeric(mat3_head[,2])
write.table(  cbind(mat3_head, mat3), paste0(AllResults1, "/merged.bed"), quote=F, sep="\t", row.names=F, col.names=T )

system( " sed -i -e 's/^X./#/'  3_finalPhenotypeMatrix/3_C/merged.bed " )
system( " sort -k1,1   -k2,2n   3_finalPhenotypeMatrix/3_C/merged.bed     >  3_finalPhenotypeMatrix/3_C/merged.sorted.bed   " )
system( " bgzip   3_finalPhenotypeMatrix/3_C/merged.sorted.bed  " )
system( " tabix  -p bed  3_finalPhenotypeMatrix/3_C/merged.sorted.bed.gz  " )
print("End.")
cat("\n\n\n\n\n")
#######################################################################################################################################









#######################################################################################################################################
Input4 <- read.table( "2_mergedCounts/4_H/Input/merged.bed",  head=T, comment.char = "")
print("dimension of raw matrix:")
dim(Input4)

Input4_head = as.matrix( Input4[,1:6] )
Input4      = as.matrix( Input4[,-c(1:6)] )
print("dimension of four matrixes:")
dim(Input4_head)
dim(Input4)
  

#/ make the DGEList:
yy <- DGEList(counts = as.matrix(Input4) )
yy$samples
#/ calculate TMM normalization factors:
yyy <- calcNormFactors(yy , method="TMM")
yyy$samples
#/ get the normalized counts:
cpms <- cpm(yyy, log=FALSE)
dim(cpms)

mat4_head = as.matrix( Input4_head )
mat4      = log2(cpms + 1)
print("dimension of final matrixes:")
dim(mat4_head)
dim(mat4)

cmat4 = as.vector(mat4)
print("length:")
length(cmat4)
length(cmat4[cmat4>0])
length(cmat4[cmat4==0])
length(cmat4[cmat4<0])

AllResults1 <- "3_finalPhenotypeMatrix/4_H"
if( ! file.exists(AllResults1) ) { dir.create(path=AllResults1, recursive = TRUE) }
mat4_head[,5] = as.numeric(mat4_head[,3]) - as.numeric(mat4_head[,2])
write.table(  cbind(mat4_head, mat4), paste0(AllResults1, "/merged.bed"), quote=F, sep="\t", row.names=F, col.names=T )

system( " sed -i -e 's/^X./#/'  3_finalPhenotypeMatrix/4_H/merged.bed " )
system( " sort -k1,1   -k2,2n   3_finalPhenotypeMatrix/4_H/merged.bed     >  3_finalPhenotypeMatrix/4_H/merged.sorted.bed   " )
system( " bgzip   3_finalPhenotypeMatrix/4_H/merged.sorted.bed  " )
system( " tabix  -p bed  3_finalPhenotypeMatrix/4_H/merged.sorted.bed.gz  " )
print("End.")
cat("\n\n\n\n\n")
#######################################################################################################################################











#######################################################################################################################################
Input5 <- read.table( "2_mergedCounts/5_T/Input/merged.bed",  head=T, comment.char = "")
print("dimension of raw matrix:")
dim(Input5)

Input5_head = as.matrix( Input5[,1:6] )
Input5      = as.matrix( Input5[,-c(1:6)] )
print("dimension of four matrixes:")
dim(Input5_head)
dim(Input5)
  

#/ make the DGEList:
yy <- DGEList(counts = as.matrix(Input5) )
yy$samples
#/ calculate TMM normalization factors:
yyy <- calcNormFactors(yy , method="TMM")
yyy$samples
#/ get the normalized counts:
cpms <- cpm(yyy, log=FALSE)
dim(cpms)

mat5_head = as.matrix( Input5_head )
mat5      = log2(cpms + 1)
print("dimension of final matrixes:")
dim(mat5_head)
dim(mat5)

cmat5 = as.vector(mat5)
print("length:")
length(cmat5)
length(cmat5[cmat5>0])
length(cmat5[cmat5==0])
length(cmat5[cmat5<0])

AllResults1 <- "3_finalPhenotypeMatrix/5_T"
if( ! file.exists(AllResults1) ) { dir.create(path=AllResults1, recursive = TRUE) }
mat5_head[,5] = as.numeric(mat5_head[,3]) - as.numeric(mat5_head[,2])
write.table(  cbind(mat5_head, mat5), paste0(AllResults1, "/merged.bed"), quote=F, sep="\t", row.names=F, col.names=T )

system( " sed -i -e 's/^X./#/'  3_finalPhenotypeMatrix/5_T/merged.bed " )
system( " sort -k1,1   -k2,2n   3_finalPhenotypeMatrix/5_T/merged.bed     >  3_finalPhenotypeMatrix/5_T/merged.sorted.bed   " )
system( " bgzip   3_finalPhenotypeMatrix/5_T/merged.sorted.bed  " )
system( " tabix  -p bed  3_finalPhenotypeMatrix/5_T/merged.sorted.bed.gz  " )
print("End.")
cat("\n\n\n\n\n")
#######################################################################################################################################








print("Compare the names of row in each matrix:")
cmp2 = (mat1_head[, 4] == mat2_head[, 4])
length(cmp2 )
length(cmp2[cmp2])
length(cmp2[!cmp2])

cmp3 = (mat1_head[, 4] == mat3_head[, 4])
length(cmp3 )
length(cmp3[cmp3])
length(cmp3[!cmp3])

cmp4 = (mat1_head[, 4] == mat4_head[, 4])
length(cmp4 )
length(cmp4[cmp4])
length(cmp4[!cmp4])

cmp5 = (mat1_head[, 4] == mat5_head[, 4])
length(cmp5 )
length(cmp5[cmp5])
length(cmp5[!cmp5])

cat("\n\n\n\n\n")
