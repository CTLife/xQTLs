args <- commandArgs(TRUE)
print("args: ")
print(args[1])
print(args[2])
print("#############")

inputFile <- args[1]
outputFile<- args[2]
M1 <- read.table(inputFile, header=T ,   sep=" " ) 

M1_head <- M1[,1]
M1      <- M1[,-1]
M2 <- M1[ , order(nchar(colnames(M1))) ]
M3 <- cbind(M1_head, M2)
colnames(M3)[1] <- "SampleID"

write.table(x=M3, file = outputFile, append = FALSE, quote = FALSE, sep = "\t",
            eol = "\n", na = "NA", dec = ".", row.names = FALSE,  col.names = TRUE )



