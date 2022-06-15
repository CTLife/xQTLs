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
      print( corrplot(matrix2, method = "circle", type = "full",  title = "", is.corr = is.corr2,  order = "hclust",  hclust.method = "ward.D2",   tl.col = "black", col = my_col2 )  )   
      print( corrplot(matrix2, method = "square", type = "full",  title = "", is.corr = is.corr2,  order = "hclust",  hclust.method = "ward.D2",   tl.col = "black", col = my_col2 )  )                                       
      print( corrplot(matrix2, method = "square", type = "full",  title = "", is.corr = is.corr2,  order = "hclust",  hclust.method = "complete",  tl.col = "black", col = my_col2 )  )   
      print( corrplot(matrix2, method = "number", type = "full",  title = "", is.corr = is.corr2,  order = "hclust",  hclust.method = "ward.D2",   tl.col = "black", col = my_col2 )  )   
      print( corrplot(matrix2, method = "color",  type = "full",  title = "", is.corr = is.corr2,  order = "hclust",  hclust.method = "ward.D2",   tl.col = "black", col = my_col2 )  )   
      print( corrplot(matrix2, method = "color",  type = "full",  title = "", is.corr = is.corr2,  order = "hclust",  hclust.method = "complete",  tl.col = "black", col = my_col2 )  )   
  dev.off()
}  


MyHeatmaps_1_original <- function(matrix2,  path2,   fileName2,   height2=30,   width2=30, is.corr2=TRUE,  my_col2 ) { ## original order                                                            
  ## matrix2 = myScaleMatrix2( matrix2 )  
  pdf( file = paste(path2, fileName2, sep="/"),  width=width2, height=height2  )
      print( corrplot(matrix2, method = "circle", type = "full",   title = "", is.corr = is.corr2,  order = "original",  tl.col = "black", col = my_col2 )  )   
      print( corrplot(matrix2, method = "square", type = "full",   title = "", is.corr = is.corr2,  order = "original",  tl.col = "black", col = my_col2 )  )                                       
      print( corrplot(matrix2, method = "square", type = "lower",  title = "", is.corr = is.corr2,  order = "original",  tl.col = "black", col = my_col2 )  )   
      print( corrplot(matrix2, method = "number", type = "full",   title = "", is.corr = is.corr2,  order = "original",  tl.col = "black", col = my_col2 )  )   
      print( corrplot(matrix2, method = "color",  type = "full",   title = "", is.corr = is.corr2,  order = "original",  tl.col = "black", col = my_col2 )  )   
      print( corrplot(matrix2, method = "color",  type = "lower",  title = "", is.corr = is.corr2,  order = "original",  tl.col = "black", col = my_col2 )  )   
  dev.off()
}  


MyHeatmaps_2_f <- function(matrix2,  path2,   fileName2,   height2=30,   width2=30 ) { 
  matrix2 = myScaleMatrix2( matrix2 )  
  pdf( file = paste(path2, fileName2, sep="/"),  width=width2, height=height2  )
      print( heatmap(x = matrix2,  col = colorRampPalette(c("blue", "white", "red"))(20),       symm = FALSE,  scale =  "none"     )  )
      print( heatmap(x = matrix2,  col = colorRampPalette(c("green4", "white", "purple"))(20),  symm = FALSE,  scale =  "none"     )  )
      print( heatmap(x = matrix2,  col = colorRampPalette(c("cyan", "white", "red"))(20),       symm = FALSE,  scale =  "none"     )  )
      print( heatmap(x = matrix2,  col = colorRampPalette(c("cyan", "white", "purple"))(20),    symm = FALSE,  scale =  "none"     )  )
      print( heatmap(x = matrix2,  col = colorRampPalette(c("blue", "white", "purple"))(20),    symm = FALSE,  scale =  "none"     )  )
  dev.off()
}  


MyHeatmaps_3_f <- function(matrix2,  path2,   fileName2,   height2=30,   width2=30 ) { 
  matrix2 = myScaleMatrix2( matrix2 )  
  pdf( file = paste(path2, fileName2, sep="/"),  width=width2, height=height2  )
      print( ComplexHeatmap::Heatmap(matrix2,  col = colorRampPalette(c("blue", "white", "red"))(20)        , heatmap_legend_param = list(legend_height = unit(10, "cm")) )  )          
      print( ComplexHeatmap::Heatmap(matrix2,  col = colorRampPalette(c("blue", "white", "red"))(20)        , heatmap_legend_param = list(legend_height = unit(10, "cm")) )  )
      print( ComplexHeatmap::Heatmap(matrix2,  col = colorRampPalette(c("green4", "white", "purple"))(20)   , heatmap_legend_param = list(legend_height = unit(10, "cm")) )  )
      print( ComplexHeatmap::Heatmap(matrix2,  col = colorRampPalette(c("green4", "white", "purple"))(20)   , heatmap_legend_param = list(legend_height = unit(10, "cm")) )  )
      print( ComplexHeatmap::Heatmap(matrix2,  col = colorRampPalette(c("cyan", "white", "red"))(20)        , heatmap_legend_param = list(legend_height = unit(10, "cm")) )  )
      print( ComplexHeatmap::Heatmap(matrix2,  col = colorRampPalette(c("cyan", "white", "red"))(20)        , heatmap_legend_param = list(legend_height = unit(10, "cm")) )  )
      print( ComplexHeatmap::Heatmap(matrix2,  col = colorRampPalette(c("cyan", "white", "purple"))(20)     , heatmap_legend_param = list(legend_height = unit(10, "cm")) )  )
      print( ComplexHeatmap::Heatmap(matrix2,  col = colorRampPalette(c("cyan", "white", "purple"))(20)     , heatmap_legend_param = list(legend_height = unit(10, "cm")) )  )
      print( ComplexHeatmap::Heatmap(matrix2,  col = colorRampPalette(c("blue", "white", "purple"))(20)     , heatmap_legend_param = list(legend_height = unit(10, "cm")) )  )
      print( ComplexHeatmap::Heatmap(matrix2,  col = colorRampPalette(c("blue", "white", "purple"))(20)     , heatmap_legend_param = list(legend_height = unit(10, "cm")) )  )
  dev.off()
}  


insertOneRow <- function(matrix1, newrow1, r) {
  matrix1[seq(r+1,nrow(matrix1)+1),] <- matrix1[seq(r,nrow(matrix1)), ]
  matrix1[r,] <- newrow1
  return(matrix1)
}


insertOneColumn <- function(matrix1, newcol1, r) {
  matrix1[ , seq(r+1,ncol(matrix1)+1)] <- matrix1[, seq(r,ncol(matrix1)) ]
  matrix1[, r] <- newcol1
  return(matrix1)
}




#################################################
rawMatrix_1a <- read.table("4a_keptRegions.peaks/Correlation_Results/4.pearson.cor.txt",    header=FALSE, sep="\t",  quote = "", comment.char = "") 
rawMatrix_1b <- read.table("4b_keptRegions.gene/Correlation_Results/4.pearson.cor.txt",     header=FALSE, sep="\t",  quote = "", comment.char = "") 

dim(rawMatrix_1a)
dim(rawMatrix_1b)

rawMatrix_1a_add = insertOneRow(rawMatrix_1a,     newrow1=rep(NA, times=ncol(rawMatrix_1a)), r=0+3+1)
rawMatrix_1a_add = insertOneRow(rawMatrix_1a_add, newrow1=rep(NA, times=ncol(rawMatrix_1a)), r=4+19+1)
rawMatrix_1a_add = insertOneRow(rawMatrix_1a_add, newrow1=rep(NA, times=ncol(rawMatrix_1a)), r=24+20+1)
rawMatrix_1a_add = insertOneColumn(rawMatrix_1a_add, newcol1=rep(NA, times=nrow(rawMatrix_1a_add)), r=0+3+1)
rawMatrix_1a_add = insertOneColumn(rawMatrix_1a_add, newcol1=rep(NA, times=nrow(rawMatrix_1a_add)), r=4+19+1)
rawMatrix_1a_add = insertOneColumn(rawMatrix_1a_add, newcol1=rep(NA, times=nrow(rawMatrix_1a_add)), r=24+20+1)

rawMatrix_1b_add = insertOneRow(rawMatrix_1b,     newrow1=rep(NA, times=ncol(rawMatrix_1b)), r=0+3+1)
rawMatrix_1b_add = insertOneRow(rawMatrix_1b_add, newrow1=rep(NA, times=ncol(rawMatrix_1b)), r=4+19+1)
rawMatrix_1b_add = insertOneRow(rawMatrix_1b_add, newrow1=rep(NA, times=ncol(rawMatrix_1b)), r=24+20+1)
rawMatrix_1b_add = insertOneColumn(rawMatrix_1b_add, newcol1=rep(NA, times=nrow(rawMatrix_1b_add)), r=0+3+1)
rawMatrix_1b_add = insertOneColumn(rawMatrix_1b_add, newcol1=rep(NA, times=nrow(rawMatrix_1b_add)), r=4+19+1)
rawMatrix_1b_add = insertOneColumn(rawMatrix_1b_add, newcol1=rep(NA, times=nrow(rawMatrix_1b_add)), r=24+20+1)

dim(rawMatrix_1a)
dim(rawMatrix_1b)

dim(rawMatrix_1a_add)
dim(rawMatrix_1b_add)

rawMatrix_1a_add = as.matrix(rawMatrix_1a_add)
rawMatrix_1b_add = as.matrix(rawMatrix_1b_add)



my_col3=colorRampPalette( c(  "green4", "green", "white", "purple",  "purple4"  ) )

pdf( file = "BA24.pdf",  width=10, height=10  )

print( corrplot(rawMatrix_1a_add, method = "square", type = "full",  title = "For m6A-QTLs",    is.corr = TRUE,  order = "original",  tl.col = "black", tl.srt = 90, col = my_col3(1000), na.label = "square", na.label.col = "grey" , tl.pos="l", mar = c(1, 1, 5, 1), tl.cex=0.7,  cl.align.text="l" , cex.main=3)  )                      
print( corrplot(rawMatrix_1b_add, method = "square", type = "full",  title = "For eQTLs", is.corr = TRUE,  order = "original",  tl.col = "black", tl.srt = 90, col = my_col3(1000), na.label = "square", na.label.col = "grey" , tl.pos="l", mar = c(1, 1, 5, 1), tl.cex=0.7,  cl.align.text="l" , cex.main=3 )   )  

dev.off() 



 




