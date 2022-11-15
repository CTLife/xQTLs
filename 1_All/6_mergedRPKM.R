args <- commandArgs(TRUE)
print("args: ")
print(args[1])
print(args[2])
print("#############")

inputFile <- args[1]
outputFile<- args[2]
M1 <- read.table(inputFile, header=T ,   sep="\t" ) 
M1 <- M1[order(M1[,1],decreasing=FALSE),]
M1 <- M1[!duplicated(M1[,1]) , ]
write.table(x=M1, file = outputFile, append = FALSE, quote = FALSE, sep = "\t",
            eol = "\n", na = "NA", dec = ".", row.names = FALSE,  col.names = TRUE )



