#######################################################################################################################################
IP1    <- read.table( "2_mergedRPKM/1_BA9/IP/forward/merged.bed",     head=T, comment.char = "")
Input1 <- read.table( "2_mergedRPKM/1_BA9/Input/forward/merged.bed",  head=T, comment.char = "")
print("dimension of raw matrix:")
dim(IP1)
dim(Input1)
 
bool1 = (IP1[, 4] == Input1[, 4])
print("length of boole:")
length(bool1 )
length(bool1[bool1])
length(bool1[!bool1])

IP1_head = as.matrix( IP1[,1:6] )
IP1      = as.matrix( IP1[,-c(1:6)] )
Input1_head = as.matrix( Input1[,1:6] )
Input1      = as.matrix( Input1[,-c(1:6)] )
print("dimension of four matrixes:")
dim(IP1_head)
dim(IP1)
dim(Input1_head)
dim(Input1)
  
mat1_head = as.matrix( IP1_head )
mat1      = as.matrix( log2((IP1+0.01)/(Input1+0.01)) )
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
IP2    <- read.table( "2_mergedRPKM/2_BA24/IP/forward/merged.bed",     head=T, comment.char = "")
Input2 <- read.table( "2_mergedRPKM/2_BA24/Input/forward/merged.bed",  head=T, comment.char = "")
print("dimension of raw matrix:")
dim(IP2)
dim(Input2)
 
bool2 = (IP2[, 4] == Input2[, 4])
print("length of boole:")
length(bool2 )
length(bool2[bool2])
length(bool2[!bool2])

IP2_head = as.matrix( IP2[,1:6] )
IP2      = as.matrix( IP2[,-c(1:6)] )
Input2_head = as.matrix( Input2[,1:6] )
Input2      = as.matrix( Input2[,-c(1:6)] )
print("dimension of four matrixes:")
dim(IP2_head)
dim(IP2)
dim(Input2_head)
dim(Input2)
  
mat2_head = as.matrix( IP2_head )
mat2      = as.matrix( log2((IP2+0.01)/(Input2+0.01)) )
print("dimension of final matrixes:")
dim(mat2_head)
dim(mat2)

cmat2 = as.vector(mat2)
print("length:")
length(cmat2)
length(cmat2[cmat2>0])
length(cmat2[cmat2==0])
length(cmat2[cmat2<0])

AllResults2 <- "3_finalPhenotypeMatrix/2_BA24"
if( ! file.exists(AllResults2) ) { dir.create(path=AllResults2, recursive = TRUE) }
mat2_head[,5] = as.numeric(mat2_head[,3]) - as.numeric(mat2_head[,2])
write.table(  cbind(mat2_head, mat2), paste0(AllResults2, "/merged.bed"), quote=F, sep="\t", row.names=F, col.names=T )

system( " sed -i -e 's/^X./#/'  3_finalPhenotypeMatrix/2_BA24/merged.bed " )
system( " sort -k1,1   -k2,2n   3_finalPhenotypeMatrix/2_BA24/merged.bed     >  3_finalPhenotypeMatrix/2_BA24/merged.sorted.bed   " )
system( " bgzip   3_finalPhenotypeMatrix/2_BA24/merged.sorted.bed  " )
system( " tabix  -p bed  3_finalPhenotypeMatrix/2_BA24/merged.sorted.bed.gz  " )
print("End.")
cat("\n\n\n\n\n")
#######################################################################################################################################









#######################################################################################################################################
IP3    <- read.table( "2_mergedRPKM/3_C/IP/forward/merged.bed",     head=T, comment.char = "")
Input3 <- read.table( "2_mergedRPKM/3_C/Input/forward/merged.bed",  head=T, comment.char = "")
print("dimension of raw matrix:")
dim(IP3)
dim(Input3)
 
bool3 = (IP3[, 4] == Input3[, 4])
print("length of boole:")
length(bool3 )
length(bool3[bool3])
length(bool3[!bool3])

IP3_head = as.matrix( IP3[,1:6] )
IP3      = as.matrix( IP3[,-c(1:6)] )
Input3_head = as.matrix( Input3[,1:6] )
Input3      = as.matrix( Input3[,-c(1:6)] )
print("dimension of four matrixes:")
dim(IP3_head)
dim(IP3)
dim(Input3_head)
dim(Input3)
  
mat3_head = as.matrix( IP3_head )
mat3      = as.matrix( log2((IP3+0.01)/(Input3+0.01)) )
print("dimension of final matrixes:")
dim(mat3_head)
dim(mat3)

cmat3 = as.vector(mat3)
print("length:")
length(cmat3)
length(cmat3[cmat3>0])
length(cmat3[cmat3==0])
length(cmat3[cmat3<0])

AllResults3 <- "3_finalPhenotypeMatrix/3_C"
if( ! file.exists(AllResults3) ) { dir.create(path=AllResults3, recursive = TRUE) }
mat3_head[,5] = as.numeric(mat3_head[,3]) - as.numeric(mat3_head[,3])
write.table(  cbind(mat3_head, mat3), paste0(AllResults3, "/merged.bed"), quote=F, sep="\t", row.names=F, col.names=T )

system( " sed -i -e 's/^X./#/'  3_finalPhenotypeMatrix/3_C/merged.bed " )
system( " sort -k1,1   -k2,2n   3_finalPhenotypeMatrix/3_C/merged.bed     >  3_finalPhenotypeMatrix/3_C/merged.sorted.bed   " )
system( " bgzip   3_finalPhenotypeMatrix/3_C/merged.sorted.bed  " )
system( " tabix  -p bed  3_finalPhenotypeMatrix/3_C/merged.sorted.bed.gz  " )
print("End.")
cat("\n\n\n\n\n")
#######################################################################################################################################












#######################################################################################################################################
IP4    <- read.table( "2_mergedRPKM/4_H/IP/forward/merged.bed",     head=T, comment.char = "")
Input4 <- read.table( "2_mergedRPKM/4_H/Input/forward/merged.bed",  head=T, comment.char = "")
print("dimension of raw matrix:")
dim(IP4)
dim(Input4)
 
bool4 = (IP4[, 4] == Input4[, 4])
print("length of boole:")
length(bool4 )
length(bool4[bool4])
length(bool4[!bool4])

IP4_head = as.matrix( IP4[,1:6] )
IP4      = as.matrix( IP4[,-c(1:6)] )
Input4_head = as.matrix( Input4[,1:6] )
Input4      = as.matrix( Input4[,-c(1:6)] )
print("dimension of four matrixes:")
dim(IP4_head)
dim(IP4)
dim(Input4_head)
dim(Input4)
  
mat4_head = as.matrix( IP4_head )
mat4      = as.matrix( log2((IP4+0.01)/(Input4+0.01)) )
print("dimension of final matrixes:")
dim(mat4_head)
dim(mat4)

cmat4 = as.vector(mat4)
print("length:")
length(cmat4)
length(cmat4[cmat4>0])
length(cmat4[cmat4==0])
length(cmat4[cmat4<0])

AllResults4 <- "3_finalPhenotypeMatrix/4_H"
if( ! file.exists(AllResults4) ) { dir.create(path=AllResults4, recursive = TRUE) }
mat4_head[,5] = as.numeric(mat4_head[,3]) - as.numeric(mat4_head[,2])
write.table(  cbind(mat4_head, mat4), paste0(AllResults4, "/merged.bed"), quote=F, sep="\t", row.names=F, col.names=T )

system( " sed -i -e 's/^X./#/'  3_finalPhenotypeMatrix/4_H/merged.bed " )
system( " sort -k1,1   -k2,2n   3_finalPhenotypeMatrix/4_H/merged.bed     >  3_finalPhenotypeMatrix/4_H/merged.sorted.bed   " )
system( " bgzip   3_finalPhenotypeMatrix/4_H/merged.sorted.bed  " )
system( " tabix  -p bed  3_finalPhenotypeMatrix/4_H/merged.sorted.bed.gz  " )
print("End.")
cat("\n\n\n\n\n")
#######################################################################################################################################







#######################################################################################################################################
IP5    <- read.table( "2_mergedRPKM/5_T/IP/forward/merged.bed",     head=T, comment.char = "")
Input5 <- read.table( "2_mergedRPKM/5_T/Input/forward/merged.bed",  head=T, comment.char = "")
print("dimension of raw matrix:")
dim(IP5)
dim(Input5)
 
bool5 = (IP5[, 4] == Input5[, 4])
print("length of boole:")
length(bool5 )
length(bool5[bool5])
length(bool5[!bool5])

IP5_head = as.matrix( IP5[,1:6] )
IP5      = as.matrix( IP5[,-c(1:6)] )
Input5_head = as.matrix( Input5[,1:6] )
Input5      = as.matrix( Input5[,-c(1:6)] )
print("dimension of four matrixes:")
dim(IP5_head)
dim(IP5)
dim(Input5_head)
dim(Input5)
  
mat5_head = as.matrix( IP5_head )
mat5      = as.matrix( log2((IP5+0.01)/(Input5+0.01)) )
print("dimension of final matrixes:")
dim(mat5_head)
dim(mat5)

cmat5 = as.vector(mat5)
print("length:")
length(cmat5)
length(cmat5[cmat5>0])
length(cmat5[cmat5==0])
length(cmat5[cmat5<0])

AllResults5 <- "3_finalPhenotypeMatrix/5_T"
if( ! file.exists(AllResults5) ) { dir.create(path=AllResults5, recursive = TRUE) }
mat5_head[,5] = as.numeric(mat5_head[,3]) - as.numeric(mat5_head[,2])
write.table(  cbind(mat5_head, mat5), paste0(AllResults5, "/merged.bed"), quote=F, sep="\t", row.names=F, col.names=T )

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
