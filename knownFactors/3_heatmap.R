

suppressPackageStartupMessages( library(optparse) )  ## To run the script in command lines.

getParameters_f <- function() {
  option_list_Local <- list(   ## Options list with associated default value.  16 options.

      optparse::make_option(opt_str=c("-k", "--knownFactors"),
      default="BA9.knownFactors.all.txt",
      type="character",   dest="knownFactors",
      help=" File with the known Factors. [default: %default]."),

      optparse::make_option(opt_str=c("-e", "--peerFactors"),
      default="BA9.knownFactors.all.txt",
      type="character",   dest="peerFactors",
      help=" File with the peer factors of phenotypes. [default: %default]."),

      optparse::make_option(opt_str=c("-c", "--PCAs"),
      default="BA9.knownFactors.all.txt",
      type="character",   dest="PCAs",
      help=" File with the PCAs of phenotypes. [default: %default]."),

      optparse::make_option(opt_str=c("-g", "--genotypes"),
      default="BA9.knownFactors.all.txt",
      type="character",   dest="genotypes",
      help=" File with the PCAs of genotypes. [default: %default]."),

      optparse::make_option(opt_str=c("-o", "--output"),
      default="5a_Peaks_Factors/PEER",
      type="character",   dest="output",
      help=" Output path.  [default: %default].")

  )
  
  ## Now parse the command line to check which option is given and get associated values.
  parser_Local <- optparse::OptionParser(usage="usage: %prog [options]",
      option_list=option_list_Local, 
      description="Version 0.1, 20222-09-01.",                             
      epilogue="For comments, bug reports etc..., please visit https://github.com/CTLife or contact Yong Peng <yongp@outlook.com>."
  )
  opt_Local <- optparse::parse_args(parser_Local, args=commandArgs(trailingOnly=TRUE), positional_arguments=0)$options
  return(opt_Local)
}
 


opt_g            <- getParameters_f()  
knownFactors_g   <- opt_g$knownFactors
peerFactors_g    <- opt_g$peerFactors
PCAs_g           <- opt_g$PCAs
genotypes_g      <- opt_g$genotypes
output_g         <- opt_g$output


print("Parameters:")
print( knownFactors_g )
print( peerFactors_g )
print( PCAs_g )
print( genotypes_g )
print( output_g )


 
suppressPackageStartupMessages( library(ComplexHeatmap) ) 
suppressPackageStartupMessages( library(corrplot) )
suppressPackageStartupMessages( library(gplots) )
suppressPackageStartupMessages( library(stringr) )


reset_outliers2 <- function(x, na.rm = TRUE ) {
  qnt <- quantile(x, probs=c(0.05, 0.95) , type=1,  na.rm = na.rm )  
  y <- x
  y[x < qnt[1] ] <- qnt[1]
  y[x > qnt[2] ] <- qnt[2]    
  y
}


myScaleMatrix2 <- function( matrix_temp8, upper_temp8 = 1, lower_temp8 = -1 ) {
    rawMatrix_2 = reset_outliers2(matrix_temp8)  
    rawMatrix_2 = lower_temp8 + (upper_temp8 - lower_temp8) * ( rawMatrix_2 - min(rawMatrix_2) )/( max(rawMatrix_2)- min(rawMatrix_2) )
    return(rawMatrix_2)
}


MyHeatmaps_1_cluster <- function(matrix2,  path2,   fileName2,   height2=30,   width2=30, is.corr2=TRUE,  my_col2 ) {  ## perform clustering                                                           
  ##matrix2 = myScaleMatrix2( matrix2 )  
  pdf( file = paste(path2, fileName2, sep="/"),  width=width2, height=height2  )
       corrplot(matrix2, method = "circle", type = "full",  title = "", is.corr = is.corr2,  order = "hclust",  hclust.method = "ward.D2",   tl.col = "black", col = my_col2 )     
       corrplot(matrix2, method = "square", type = "full",  title = "", is.corr = is.corr2,  order = "hclust",  hclust.method = "ward.D2",   tl.col = "black", col = my_col2 )                                         
       corrplot(matrix2, method = "square", type = "full",  title = "", is.corr = is.corr2,  order = "hclust",  hclust.method = "complete",  tl.col = "black", col = my_col2 )     
       corrplot(matrix2, method = "number", type = "full",  title = "", is.corr = is.corr2,  order = "hclust",  hclust.method = "ward.D2",   tl.col = "black", col = my_col2 )     
       corrplot(matrix2, method = "color",  type = "full",  title = "", is.corr = is.corr2,  order = "hclust",  hclust.method = "ward.D2",   tl.col = "black", col = my_col2 )    
       corrplot(matrix2, method = "color",  type = "full",  title = "", is.corr = is.corr2,  order = "hclust",  hclust.method = "complete",  tl.col = "black", col = my_col2 )     
  dev.off()
}  


MyHeatmaps_1_original <- function(matrix2,  path2,   fileName2,   height2=30,   width2=30, is.corr2=TRUE,  my_col2 ) { ## original order                                                            
  ## matrix2 = myScaleMatrix2( matrix2 )  
  pdf( file = paste(path2, fileName2, sep="/"),  width=width2, height=height2  )
      corrplot(matrix2, method = "circle", type = "full",   title = "", is.corr = is.corr2,  order = "original",  tl.col = "black", col = my_col2 )     
      corrplot(matrix2, method = "square", type = "full",   title = "", is.corr = is.corr2,  order = "original",  tl.col = "black", col = my_col2 )                                         
      corrplot(matrix2, method = "square", type = "lower",  title = "", is.corr = is.corr2,  order = "original",  tl.col = "black", col = my_col2 )     
      corrplot(matrix2, method = "number", type = "full",   title = "", is.corr = is.corr2,  order = "original",  tl.col = "black", col = my_col2 )     
      corrplot(matrix2, method = "color",  type = "full",   title = "", is.corr = is.corr2,  order = "original",  tl.col = "black", col = my_col2 )     
      corrplot(matrix2, method = "color",  type = "lower",  title = "", is.corr = is.corr2,  order = "original",  tl.col = "black", col = my_col2 )     
  dev.off()
}  


MyHeatmaps_2_f <- function(matrix2,  path2,   fileName2,   height2=30,   width2=30 ) { 
  matrix2 = myScaleMatrix2( matrix2 )  
  pdf( file = paste(path2, fileName2, sep="/"),  width=width2, height=height2  )
       heatmap(x = matrix2,  col = colorRampPalette(c("blue", "white", "red"))(20),       symm = FALSE,  scale =  "none"     )  
       heatmap(x = matrix2,  col = colorRampPalette(c("green4", "white", "purple"))(20),  symm = FALSE,  scale =  "none"     )  
       heatmap(x = matrix2,  col = colorRampPalette(c("cyan", "white", "red"))(20),       symm = FALSE,  scale =  "none"     )  
       heatmap(x = matrix2,  col = colorRampPalette(c("cyan", "white", "purple"))(20),    symm = FALSE,  scale =  "none"     )  
       heatmap(x = matrix2,  col = colorRampPalette(c("blue", "white", "purple"))(20),    symm = FALSE,  scale =  "none"     )  
  dev.off()
}  


MyHeatmaps_3_f <- function(matrix2,  path2,   fileName2,   height2=30,   width2=30 ) { 
  matrix2 = myScaleMatrix2( matrix2 )  
  pdf( file = paste(path2, fileName2, sep="/"),  width=width2, height=height2  )
       ComplexHeatmap::Heatmap(matrix2,  col = colorRampPalette(c("blue", "white", "red"))(20)        , heatmap_legend_param = list(legend_height = unit(10, "cm")) )            
       ComplexHeatmap::Heatmap(matrix2,  col = colorRampPalette(c("blue", "white", "red"))(20)        , heatmap_legend_param = list(legend_height = unit(10, "cm")) )  
       ComplexHeatmap::Heatmap(matrix2,  col = colorRampPalette(c("green4", "white", "purple"))(20)   , heatmap_legend_param = list(legend_height = unit(10, "cm")) )  
       ComplexHeatmap::Heatmap(matrix2,  col = colorRampPalette(c("green4", "white", "purple"))(20)   , heatmap_legend_param = list(legend_height = unit(10, "cm")) )  
       ComplexHeatmap::Heatmap(matrix2,  col = colorRampPalette(c("cyan", "white", "red"))(20)        , heatmap_legend_param = list(legend_height = unit(10, "cm")) )  
       ComplexHeatmap::Heatmap(matrix2,  col = colorRampPalette(c("cyan", "white", "red"))(20)        , heatmap_legend_param = list(legend_height = unit(10, "cm")) )  
       ComplexHeatmap::Heatmap(matrix2,  col = colorRampPalette(c("cyan", "white", "purple"))(20)     , heatmap_legend_param = list(legend_height = unit(10, "cm")) )  
       ComplexHeatmap::Heatmap(matrix2,  col = colorRampPalette(c("cyan", "white", "purple"))(20)     , heatmap_legend_param = list(legend_height = unit(10, "cm")) )  
       ComplexHeatmap::Heatmap(matrix2,  col = colorRampPalette(c("blue", "white", "purple"))(20)     , heatmap_legend_param = list(legend_height = unit(10, "cm")) )  
       ComplexHeatmap::Heatmap(matrix2,  col = colorRampPalette(c("blue", "white", "purple"))(20)     , heatmap_legend_param = list(legend_height = unit(10, "cm")) )  
  dev.off()
}  



 

#################################################
rawMatrix_1 <- read.table(knownFactors_g,  header=TRUE, sep="\t",  quote = "", comment.char = "") 
rawMatrix_2 <- read.table(peerFactors_g,   header=TRUE, sep=" ",  quote = "", comment.char = "") 
rawMatrix_3 <- read.table(PCAs_g ,         header=TRUE, sep="\t",  quote = "", comment.char = "") 
rawMatrix_4 <- read.table(genotypes_g ,    header=TRUE, sep="\t",  quote = "", comment.char = "") 

dim(rawMatrix_1)
dim(rawMatrix_2)
dim(rawMatrix_3)
dim(rawMatrix_4)
#  rawMatrix_1[,1:5]
#  rawMatrix_2[,1:5]
#  rawMatrix_3[,1:5]
#  rawMatrix_4[,1:5]

rawMatrix_1a = as.matrix( rawMatrix_1[,-1] )
rawMatrix_2a = as.matrix( rawMatrix_2  )
rawMatrix_3a = as.matrix( rawMatrix_3[,-1] )
rawMatrix_4a = as.matrix( rawMatrix_4[,-1] )
#colnames(rawMatrix_1a) = NULL
colnames(rawMatrix_2a) = NULL
colnames(rawMatrix_3a) = NULL
colnames(rawMatrix_4a) = NULL
dim(rawMatrix_1a)
dim(rawMatrix_2a)
dim(rawMatrix_3a)
dim(rawMatrix_4a)
#  rawMatrix_1a[,1:5]
#  rawMatrix_2a[,1:5]
#  rawMatrix_3a[,1:5]
#  rawMatrix_4a[,1:5]


rawMatrix_1a[1,] = str_replace_all(string=rawMatrix_1a[1,], pattern="Female",  replacement="0" )
rawMatrix_1a[1,] = str_replace_all(string=rawMatrix_1a[1,], pattern="Male",    replacement="1" )
rawMatrix_1a[2,] = str_replace_all(string=rawMatrix_1a[2,], pattern="White",   replacement="0" )
rawMatrix_1a[2,] = str_replace_all(string=rawMatrix_1a[2,], pattern="Black",   replacement="1" )
rawMatrix_1a[2,] = str_replace_all(string=rawMatrix_1a[2,], pattern="Unknown", replacement="2" )
class(rawMatrix_1a) <- "numeric"
#  rawMatrix_1a


dim(rawMatrix_1a)
dim(rawMatrix_2a)
dim(rawMatrix_3a)
dim(rawMatrix_4a)
#  rawMatrix_1a[,1:5]
#  rawMatrix_2a[,1:5]
#  rawMatrix_3a[,1:5]
#  rawMatrix_4a[,1:5]
matrixM = rbind( as.matrix(rawMatrix_1a), as.matrix(rawMatrix_2a), as.matrix(rawMatrix_3a), as.matrix(rawMatrix_4a) )
dim(matrixM)
#  matrixM[,1:5]

outPath = output_g 
if( ! file.exists(outPath)  ) { dir.create(outPath,  recursive = TRUE)  }

sink( file = paste(outPath, "1.dimension.txt", sep="/")  )
   print( dim(rawMatrix_1a) )
   print( dim(rawMatrix_2a) )
   print( dim(rawMatrix_3a) )
   print( dim(rawMatrix_4a) )
sink()

write.table(x=matrixM, file = paste(outPath, "2.matrixM.txt", sep="/"), append = FALSE, 
            quote = FALSE, sep = "\t",  eol = "\n", na = "NA", dec = ".", row.names = FALSE, col.names = TRUE   )
write.table(x=t(matrixM), file = paste(outPath, "3.matrixM.T.txt", sep="/"), append = FALSE, 
            quote = FALSE, sep = "\t",  eol = "\n", na = "NA", dec = ".", row.names = TRUE, col.names = FALSE   )

cor1 = cor(x= t(matrixM),  method = "pearson" )
dim(cor1)
write.table(x=cor1, file = paste(outPath, "4.pearson.cor.txt", sep="/"), append = FALSE, 
            quote = FALSE, sep = "\t", eol = "\n", na = "NA", dec = ".", row.names = FALSE, col.names = FALSE   )

my_col1=colorRampPalette( c(   "green4", "green", "yellow", "purple",  "purple4") )
MyHeatmaps_1_original(matrix2=cor1,  path2=outPath,   fileName2="5.heatmap.pdf",  height2=9,   width2=10, is.corr2=TRUE,   my_col2=my_col1(1000)  )
my_col1=colorRampPalette( c(   "green4", "green", "white", "purple",  "purple4") )
MyHeatmaps_1_original(matrix2=cor1,  path2=outPath,   fileName2="6.heatmap.pdf",  height2=9,   width2=10, is.corr2=TRUE,   my_col2=my_col1(1000)  )
MyHeatmaps_2_f(matrix2=cor1,  path2=outPath,   fileName2="7.heatmap.pdf",   height2=10,   width2=10 ) 


my_col2=colorRampPalette( c(   "green4", "green", "white", "purple",  "purple4") , bias = 1)  
pdf( file=paste(outPath, "8.heatmap.pdf", sep="/"),  height=10,   width=10 )
heatmap.2 (x= cor1 ,
           # dendrogram control
           dendrogram = "none", 
           Rowv = FALSE,
           Colv="Rowv" , 
           symm = FALSE,
           # data scaling
           scale =  "none" ,
           na.rm=TRUE,
           # colors
           col=my_col2(40),
           trace = "none", 
           # cell labeling
           ##cellnote= as.matrix(rawMatrix_2) ,
           notecex=0.2,
           notecol="white",
           na.color=par("bg") 
)
dev.off() 


my_col3=colorRampPalette( c( "cyan4",  "white",   "red4") )
pdf( file = paste(outPath, "9.heatmap.pdf", sep="/"),  width=10, height=10  )
print( corrplot(cor1, method = "square", type = "full",  title = "", is.corr = TRUE,  order = "original",  tl.col = "black", tl.srt = 90, col = my_col3(1000) )  )  
dev.off() 

my_col3=colorRampPalette( c( "cyan",  "white",   "red") )
pdf( file = paste(outPath, "10.heatmap.pdf", sep="/"),  width=10, height=10  )
print( corrplot(cor1, method = "square", type = "full",  title = "", is.corr = TRUE,  order = "original",  tl.col = "black", tl.srt = 90, col = my_col3(1000) )  )  
dev.off() 

my_col3=colorRampPalette( c( "green4",  "white",   "purple4") )
pdf( file = paste(outPath, "11.heatmap.pdf", sep="/"),  width=10, height=10  )
print( corrplot(cor1, method = "square", type = "full",  title = "", is.corr = TRUE,  order = "original",  tl.col = "black", tl.srt = 90, col = my_col3(1000) )  )  
dev.off() 


my_col3=colorRampPalette( c(  "green4", "green", "white", "purple",  "purple4"  ) )
pdf( file = paste(outPath, "12.heatmap.pdf", sep="/"),  width=10, height=10  )
print( corrplot(cor1, method = "square", type = "full",  title = "", is.corr = TRUE,  order = "original",  tl.col = "black", tl.srt = 90, col = my_col3(1000) )  )  
dev.off() 











################# z-score standardization
matrixM2 = matrixM
for(i in c(1:nrow(matrixM))) {  ## z-score standardization for each row
    ## print(i)
    temp = matrixM[i,]
    matrixM2[i,] = (temp-mean(temp))/sd(temp)
}

write.table(x=matrixM2, file = paste(outPath, "22.matrixM2.txt", sep="/"), append = FALSE, 
            quote = FALSE, sep = "\t",  eol = "\n", na = "NA", dec = ".", row.names = FALSE, col.names = TRUE   )
write.table(x=t(matrixM2), file = paste(outPath, "23.matrixM2.T.txt", sep="/"), append = FALSE, 
            quote = FALSE, sep = "\t",  eol = "\n", na = "NA", dec = ".", row.names = TRUE, col.names = FALSE   )

cor2 = cor(x= t(matrixM2),  method = "pearson" )
dim(cor2)
write.table(x=cor2, file = paste(outPath, "24.pearson.cor.txt", sep="/"), append = FALSE, 
            quote = FALSE, sep = "\t", eol = "\n", na = "NA", dec = ".", row.names = FALSE, col.names = FALSE   )




