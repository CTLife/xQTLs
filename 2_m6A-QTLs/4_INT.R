library(ggplot2)
library(preprocessCore)
library(RNOmni)

library(RColorBrewer)
qual_col_pals = brewer.pal.info[brewer.pal.info$category == 'qual',]
col_vec = unlist(mapply(brewer.pal, qual_col_pals$maxcolors, rownames(qual_col_pals))) # 74 colors in RcolorBrewer


################################################################################################
logOR <- read.table( "3_finalPhenotypeMatrix/1_BA9/merged.bed", head=T, comment.char = "")
dim(logOR)
head(logOR)

logOR_head = logOR[,1:6]
logOR = logOR[,-c(1:6)]
dim(logOR_head)
dim(logOR)
head(logOR_head)
head(logOR)

logOR_INT = apply(logOR, 1, RNOmni::RankNorm)
dim(logOR_INT)
logOR_INT = t(logOR_INT) 
dim(logOR_INT)


AllResults_g <- "4_INT/1_BA9"
if( ! file.exists(AllResults_g) ) { dir.create(path=AllResults_g, recursive = TRUE) }

write.table(x=logOR_INT, file = paste(AllResults_g, "logOR_INT.txt", sep="/"), 
            append = FALSE, quote = FALSE, sep = "\t",    row.names = FALSE,  col.names = TRUE )

write.table(x=cbind(logOR_head, logOR_INT), file = paste(AllResults_g, "Full.logOR_INT.bed", sep="/"), 
            append = FALSE, quote = FALSE, sep = "\t",    row.names = FALSE,  col.names = TRUE )


pdf(  paste(AllResults_g, "1a.raw.rows.pdf", sep="/")  )
plot(density(as.numeric(logOR[1,])), col=col_vec[1], ylim=c(0, 1) )
for(i in 2:50) lines(density( as.numeric(logOR[i,])), col=col_vec[i])
plot(density(as.numeric(logOR[101,])), col=col_vec[1], ylim=c(0, 1) )
for(i in 102:150) lines(density( as.numeric(logOR[i,])), col=col_vec[i-100])
plot(density(as.numeric(logOR[300,])), col=col_vec[1])
plot(density(as.numeric(logOR[600,])), col=col_vec[1])
plot(density(as.numeric(logOR[900,])), col=col_vec[1])
dev.off()

pdf(  paste(AllResults_g, "1b.raw.columns.pdf", sep="/")  )
plot(density(as.numeric(logOR[,1])), col=col_vec[1], ylim=c(0, 0.6) )
for(i in 2:19) lines(density( as.numeric(logOR[,i])), col=col_vec[i])
plot(density(as.numeric(logOR[,3])), col=col_vec[1])
plot(density(as.numeric(logOR[,9])), col=col_vec[1])
plot(density(as.numeric(logOR[,15])), col=col_vec[1])
dev.off()

pdf(  paste(AllResults_g, "2a.INT.rows.pdf", sep="/")  )
plot(density(as.numeric(logOR_INT[1,])), col=col_vec[1], ylim=c(0, 1) )
for(i in 2:50) lines(density( as.numeric(logOR_INT[i,])), col=col_vec[i])
plot(density(as.numeric(logOR_INT[101,])), col=col_vec[1], ylim=c(0, 1) )
for(i in 102:150) lines(density( as.numeric(logOR_INT[i,])), col=col_vec[i-100])
plot(density(as.numeric(logOR_INT[300,])), col=col_vec[1])
plot(density(as.numeric(logOR_INT[600,])), col=col_vec[1])
plot(density(as.numeric(logOR_INT[900,])), col=col_vec[1])
dev.off()

pdf(  paste(AllResults_g, "2b.INT.columns.pdf", sep="/")  )
plot(density(as.numeric(logOR_INT[,1])), col=col_vec[1], ylim=c(0, 0.6) )
for(i in 2:19) lines(density( as.numeric(logOR_INT[,i])), col=col_vec[i])
plot(density(as.numeric(logOR_INT[,3])), col=col_vec[1])
plot(density(as.numeric(logOR_INT[,9])), col=col_vec[1])
plot(density(as.numeric(logOR_INT[,15])), col=col_vec[1])
dev.off()

system( " sed -i -e 's/^X./#/'  4_INT/1_BA9/Full.logOR_INT.bed " )
system( " sort -k1,1   -k2,2n   4_INT/1_BA9/Full.logOR_INT.bed     >  4_INT/1_BA9/Full.logOR_INT.sorted.bed   " )
system( " bgzip   4_INT/1_BA9/Full.logOR_INT.sorted.bed  " )
system( " tabix  -p bed  4_INT/1_BA9/Full.logOR_INT.sorted.bed.gz  " )






################################################################################################
logOR <- read.table( "3_finalPhenotypeMatrix/2_BA24/merged.bed", head=T, comment.char = "")
dim(logOR)
head(logOR)

logOR_head = logOR[,1:6]
logOR = logOR[,-c(1:6)]
dim(logOR_head)
dim(logOR)
head(logOR_head)
head(logOR)

logOR_INT = apply(logOR, 1, RNOmni::RankNorm)
dim(logOR_INT)
logOR_INT = t(logOR_INT) 
dim(logOR_INT)


AllResults_g <- "4_INT/2_BA24"
if( ! file.exists(AllResults_g) ) { dir.create(path=AllResults_g, recursive = TRUE) }

write.table(x=logOR_INT, file = paste(AllResults_g, "logOR_INT.txt", sep="/"), 
            append = FALSE, quote = FALSE, sep = "\t",    row.names = FALSE,  col.names = TRUE )

write.table(x=cbind(logOR_head, logOR_INT), file = paste(AllResults_g, "Full.logOR_INT.bed", sep="/"), 
            append = FALSE, quote = FALSE, sep = "\t",    row.names = FALSE,  col.names = TRUE )


pdf(  paste(AllResults_g, "1a.raw.rows.pdf", sep="/")  )
plot(density(as.numeric(logOR[1,])), col=col_vec[1], ylim=c(0, 1) )
for(i in 2:50) lines(density( as.numeric(logOR[i,])), col=col_vec[i])
plot(density(as.numeric(logOR[101,])), col=col_vec[1], ylim=c(0, 1) )
for(i in 102:150) lines(density( as.numeric(logOR[i,])), col=col_vec[i-100])
plot(density(as.numeric(logOR[300,])), col=col_vec[1])
plot(density(as.numeric(logOR[600,])), col=col_vec[1])
plot(density(as.numeric(logOR[900,])), col=col_vec[1])
dev.off()

pdf(  paste(AllResults_g, "1b.raw.columns.pdf", sep="/")  )
plot(density(as.numeric(logOR[,1])), col=col_vec[1], ylim=c(0, 0.6) )
for(i in 2:19) lines(density( as.numeric(logOR[,i])), col=col_vec[i])
plot(density(as.numeric(logOR[,3])), col=col_vec[1])
plot(density(as.numeric(logOR[,9])), col=col_vec[1])
plot(density(as.numeric(logOR[,15])), col=col_vec[1])
dev.off()

pdf(  paste(AllResults_g, "2a.INT.rows.pdf", sep="/")  )
plot(density(as.numeric(logOR_INT[1,])), col=col_vec[1], ylim=c(0, 1) )
for(i in 2:50) lines(density( as.numeric(logOR_INT[i,])), col=col_vec[i])
plot(density(as.numeric(logOR_INT[101,])), col=col_vec[1], ylim=c(0, 1) )
for(i in 102:150) lines(density( as.numeric(logOR_INT[i,])), col=col_vec[i-100])
plot(density(as.numeric(logOR_INT[300,])), col=col_vec[1])
plot(density(as.numeric(logOR_INT[600,])), col=col_vec[1])
plot(density(as.numeric(logOR_INT[900,])), col=col_vec[1])
dev.off()

pdf(  paste(AllResults_g, "2b.INT.columns.pdf", sep="/")  )
plot(density(as.numeric(logOR_INT[,1])), col=col_vec[1], ylim=c(0, 0.6) )
for(i in 2:19) lines(density( as.numeric(logOR_INT[,i])), col=col_vec[i])
plot(density(as.numeric(logOR_INT[,3])), col=col_vec[1])
plot(density(as.numeric(logOR_INT[,9])), col=col_vec[1])
plot(density(as.numeric(logOR_INT[,15])), col=col_vec[1])
dev.off()

system( " sed -i -e 's/^X./#/'  4_INT/2_BA24/Full.logOR_INT.bed " )
system( " sort -k1,1   -k2,2n   4_INT/2_BA24/Full.logOR_INT.bed     >  4_INT/2_BA24/Full.logOR_INT.sorted.bed   " )
system( " bgzip   4_INT/2_BA24/Full.logOR_INT.sorted.bed  " )
system( " tabix  -p bed  4_INT/2_BA24/Full.logOR_INT.sorted.bed.gz  " )





################################################################################################
logOR <- read.table( "3_finalPhenotypeMatrix/3_C/merged.bed", head=T, comment.char = "")
dim(logOR)
head(logOR)

logOR_head = logOR[,1:6]
logOR = logOR[,-c(1:6)]
dim(logOR_head)
dim(logOR)
head(logOR_head)
head(logOR)

logOR_INT = apply(logOR, 1, RNOmni::RankNorm)
dim(logOR_INT)
logOR_INT = t(logOR_INT) 
dim(logOR_INT)


AllResults_g <- "4_INT/3_C"
if( ! file.exists(AllResults_g) ) { dir.create(path=AllResults_g, recursive = TRUE) }

write.table(x=logOR_INT, file = paste(AllResults_g, "logOR_INT.txt", sep="/"), 
            append = FALSE, quote = FALSE, sep = "\t",    row.names = FALSE,  col.names = TRUE )

write.table(x=cbind(logOR_head, logOR_INT), file = paste(AllResults_g, "Full.logOR_INT.bed", sep="/"), 
            append = FALSE, quote = FALSE, sep = "\t",    row.names = FALSE,  col.names = TRUE )


pdf(  paste(AllResults_g, "1a.raw.rows.pdf", sep="/")  )
plot(density(as.numeric(logOR[1,])), col=col_vec[1], ylim=c(0, 1) )
for(i in 2:50) lines(density( as.numeric(logOR[i,])), col=col_vec[i])
plot(density(as.numeric(logOR[101,])), col=col_vec[1], ylim=c(0, 1) )
for(i in 102:150) lines(density( as.numeric(logOR[i,])), col=col_vec[i-100])
plot(density(as.numeric(logOR[300,])), col=col_vec[1])
plot(density(as.numeric(logOR[600,])), col=col_vec[1])
plot(density(as.numeric(logOR[900,])), col=col_vec[1])
dev.off()

pdf(  paste(AllResults_g, "1b.raw.columns.pdf", sep="/")  )
plot(density(as.numeric(logOR[,1])), col=col_vec[1], ylim=c(0, 0.6) )
for(i in 2:19) lines(density( as.numeric(logOR[,i])), col=col_vec[i])
plot(density(as.numeric(logOR[,3])), col=col_vec[1])
plot(density(as.numeric(logOR[,9])), col=col_vec[1])
plot(density(as.numeric(logOR[,15])), col=col_vec[1])
dev.off()

pdf(  paste(AllResults_g, "2a.INT.rows.pdf", sep="/")  )
plot(density(as.numeric(logOR_INT[1,])), col=col_vec[1], ylim=c(0, 1) )
for(i in 2:50) lines(density( as.numeric(logOR_INT[i,])), col=col_vec[i])
plot(density(as.numeric(logOR_INT[101,])), col=col_vec[1], ylim=c(0, 1) )
for(i in 102:150) lines(density( as.numeric(logOR_INT[i,])), col=col_vec[i-100])
plot(density(as.numeric(logOR_INT[300,])), col=col_vec[1])
plot(density(as.numeric(logOR_INT[600,])), col=col_vec[1])
plot(density(as.numeric(logOR_INT[900,])), col=col_vec[1])
dev.off()

pdf(  paste(AllResults_g, "2b.INT.columns.pdf", sep="/")  )
plot(density(as.numeric(logOR_INT[,1])), col=col_vec[1], ylim=c(0, 0.6) )
for(i in 2:19) lines(density( as.numeric(logOR_INT[,i])), col=col_vec[i])
plot(density(as.numeric(logOR_INT[,3])), col=col_vec[1])
plot(density(as.numeric(logOR_INT[,9])), col=col_vec[1])
plot(density(as.numeric(logOR_INT[,15])), col=col_vec[1])
dev.off()

system( " sed -i -e 's/^X./#/'  4_INT/3_C/Full.logOR_INT.bed " )
system( " sort -k1,1   -k2,2n   4_INT/3_C/Full.logOR_INT.bed     >  4_INT/3_C/Full.logOR_INT.sorted.bed   " )
system( " bgzip   4_INT/3_C/Full.logOR_INT.sorted.bed  " )
system( " tabix  -p bed  4_INT/3_C/Full.logOR_INT.sorted.bed.gz  " )





################################################################################################
logOR <- read.table( "3_finalPhenotypeMatrix/4_H/merged.bed", head=T, comment.char = "")
dim(logOR)
head(logOR)

logOR_head = logOR[,1:6]
logOR = logOR[,-c(1:6)]
dim(logOR_head)
dim(logOR)
head(logOR_head)
head(logOR)

logOR_INT = apply(logOR, 1, RNOmni::RankNorm)
dim(logOR_INT)
logOR_INT = t(logOR_INT) 
dim(logOR_INT)


AllResults_g <- "4_INT/4_H"
if( ! file.exists(AllResults_g) ) { dir.create(path=AllResults_g, recursive = TRUE) }

write.table(x=logOR_INT, file = paste(AllResults_g, "logOR_INT.txt", sep="/"), 
            append = FALSE, quote = FALSE, sep = "\t",    row.names = FALSE,  col.names = TRUE )

write.table(x=cbind(logOR_head, logOR_INT), file = paste(AllResults_g, "Full.logOR_INT.bed", sep="/"), 
            append = FALSE, quote = FALSE, sep = "\t",    row.names = FALSE,  col.names = TRUE )


pdf(  paste(AllResults_g, "1a.raw.rows.pdf", sep="/")  )
plot(density(as.numeric(logOR[1,])), col=col_vec[1], ylim=c(0, 1) )
for(i in 2:50) lines(density( as.numeric(logOR[i,])), col=col_vec[i])
plot(density(as.numeric(logOR[101,])), col=col_vec[1], ylim=c(0, 1) )
for(i in 102:150) lines(density( as.numeric(logOR[i,])), col=col_vec[i-100])
plot(density(as.numeric(logOR[300,])), col=col_vec[1])
plot(density(as.numeric(logOR[600,])), col=col_vec[1])
plot(density(as.numeric(logOR[900,])), col=col_vec[1])
dev.off()

pdf(  paste(AllResults_g, "1b.raw.columns.pdf", sep="/")  )
plot(density(as.numeric(logOR[,1])), col=col_vec[1], ylim=c(0, 0.6) )
for(i in 2:19) lines(density( as.numeric(logOR[,i])), col=col_vec[i])
plot(density(as.numeric(logOR[,3])), col=col_vec[1])
plot(density(as.numeric(logOR[,9])), col=col_vec[1])
plot(density(as.numeric(logOR[,15])), col=col_vec[1])
dev.off()

pdf(  paste(AllResults_g, "2a.INT.rows.pdf", sep="/")  )
plot(density(as.numeric(logOR_INT[1,])), col=col_vec[1], ylim=c(0, 1) )
for(i in 2:50) lines(density( as.numeric(logOR_INT[i,])), col=col_vec[i])
plot(density(as.numeric(logOR_INT[101,])), col=col_vec[1], ylim=c(0, 1) )
for(i in 102:150) lines(density( as.numeric(logOR_INT[i,])), col=col_vec[i-100])
plot(density(as.numeric(logOR_INT[300,])), col=col_vec[1])
plot(density(as.numeric(logOR_INT[600,])), col=col_vec[1])
plot(density(as.numeric(logOR_INT[900,])), col=col_vec[1])
dev.off()

pdf(  paste(AllResults_g, "2b.INT.columns.pdf", sep="/")  )
plot(density(as.numeric(logOR_INT[,1])), col=col_vec[1], ylim=c(0, 0.6) )
for(i in 2:19) lines(density( as.numeric(logOR_INT[,i])), col=col_vec[i])
plot(density(as.numeric(logOR_INT[,3])), col=col_vec[1])
plot(density(as.numeric(logOR_INT[,9])), col=col_vec[1])
plot(density(as.numeric(logOR_INT[,15])), col=col_vec[1])
dev.off()

system( " sed -i -e 's/^X./#/'  4_INT/4_H/Full.logOR_INT.bed " )
system( " sort -k1,1   -k2,2n   4_INT/4_H/Full.logOR_INT.bed     >  4_INT/4_H/Full.logOR_INT.sorted.bed   " )
system( " bgzip   4_INT/4_H/Full.logOR_INT.sorted.bed  " )
system( " tabix  -p bed  4_INT/4_H/Full.logOR_INT.sorted.bed.gz  " )





################################################################################################
logOR <- read.table( "3_finalPhenotypeMatrix/5_T/merged.bed", head=T, comment.char = "")
dim(logOR)
head(logOR)

logOR_head = logOR[,1:6]
logOR = logOR[,-c(1:6)]
dim(logOR_head)
dim(logOR)
head(logOR_head)
head(logOR)

logOR_INT = apply(logOR, 1, RNOmni::RankNorm)
dim(logOR_INT)
logOR_INT = t(logOR_INT) 
dim(logOR_INT)


AllResults_g <- "4_INT/5_T"
if( ! file.exists(AllResults_g) ) { dir.create(path=AllResults_g, recursive = TRUE) }

write.table(x=logOR_INT, file = paste(AllResults_g, "logOR_INT.txt", sep="/"), 
            append = FALSE, quote = FALSE, sep = "\t",    row.names = FALSE,  col.names = TRUE )

write.table(x=cbind(logOR_head, logOR_INT), file = paste(AllResults_g, "Full.logOR_INT.bed", sep="/"), 
            append = FALSE, quote = FALSE, sep = "\t",    row.names = FALSE,  col.names = TRUE )


pdf(  paste(AllResults_g, "1a.raw.rows.pdf", sep="/")  )
plot(density(as.numeric(logOR[1,])), col=col_vec[1], ylim=c(0, 1) )
for(i in 2:50) lines(density( as.numeric(logOR[i,])), col=col_vec[i])
plot(density(as.numeric(logOR[101,])), col=col_vec[1], ylim=c(0, 1) )
for(i in 102:150) lines(density( as.numeric(logOR[i,])), col=col_vec[i-100])
plot(density(as.numeric(logOR[300,])), col=col_vec[1])
plot(density(as.numeric(logOR[600,])), col=col_vec[1])
plot(density(as.numeric(logOR[900,])), col=col_vec[1])
dev.off()

pdf(  paste(AllResults_g, "1b.raw.columns.pdf", sep="/")  )
plot(density(as.numeric(logOR[,1])), col=col_vec[1], ylim=c(0, 0.6) )
for(i in 2:19) lines(density( as.numeric(logOR[,i])), col=col_vec[i])
plot(density(as.numeric(logOR[,3])), col=col_vec[1])
plot(density(as.numeric(logOR[,9])), col=col_vec[1])
plot(density(as.numeric(logOR[,15])), col=col_vec[1])
dev.off()

pdf(  paste(AllResults_g, "2a.INT.rows.pdf", sep="/")  )
plot(density(as.numeric(logOR_INT[1,])), col=col_vec[1], ylim=c(0, 1) )
for(i in 2:50) lines(density( as.numeric(logOR_INT[i,])), col=col_vec[i])
plot(density(as.numeric(logOR_INT[101,])), col=col_vec[1], ylim=c(0, 1) )
for(i in 102:150) lines(density( as.numeric(logOR_INT[i,])), col=col_vec[i-100])
plot(density(as.numeric(logOR_INT[300,])), col=col_vec[1])
plot(density(as.numeric(logOR_INT[600,])), col=col_vec[1])
plot(density(as.numeric(logOR_INT[900,])), col=col_vec[1])
dev.off()

pdf(  paste(AllResults_g, "2b.INT.columns.pdf", sep="/")  )
plot(density(as.numeric(logOR_INT[,1])), col=col_vec[1], ylim=c(0, 0.6) )
for(i in 2:19) lines(density( as.numeric(logOR_INT[,i])), col=col_vec[i])
plot(density(as.numeric(logOR_INT[,3])), col=col_vec[1])
plot(density(as.numeric(logOR_INT[,9])), col=col_vec[1])
plot(density(as.numeric(logOR_INT[,15])), col=col_vec[1])
dev.off()

system( " sed -i -e 's/^X./#/'  4_INT/5_T/Full.logOR_INT.bed " )
system( " sort -k1,1   -k2,2n   4_INT/5_T/Full.logOR_INT.bed     >  4_INT/5_T/Full.logOR_INT.sorted.bed   " )
system( " bgzip   4_INT/5_T/Full.logOR_INT.sorted.bed  " )
system( " tabix  -p bed  4_INT/5_T/Full.logOR_INT.sorted.bed.gz  " )





