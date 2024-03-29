# xQTLs
## Scripts for various molecular `q`uantitative `t`rait `l`ocus (xQTL) analysis.                               
All Perl, Python, R, and Bash Shell scripts were used to eQTLs and RNA-m6A QTLs analysis by integrating [QTLtools](https://github.com/qtltools/qtltools) and [MASH](https://github.com/stephenslab/mashr).
              
# Steps:     
1. Quantify reads density from ChIP-seq or MeRIP-seq data by `1a_QTLtools_quan.peaks.pl`, or quantify gene expression level from RNA-seq data by `1b_QTLtools_quan.gene.pl`.  `QTLtools quan` is invoked in line 125, GTF file may need to be changed based on your file name. More details please see `perl 1a_QTLtools_quan.peaks.pl -help` or `perl 1b_QTLtools_quan.gene.pl -help`.  
                                                                                                
2. Get value log2((FPKM_IP+1)/(FPKM_INPUT+1)) of each peak for each MeRIP-seq sample by `2a_log2ratio.peaks.pl`. And get value log2(TPM_INPUT+1) of each gene for each RNA-seq sample (Input of MeRIP-seq) by `2b_log2TPM.gene.pl`.  More details please see `perl xxx.pl -help`.  
                                           
3. Merge all files from each sample into one file to satisfy the input format of `QTLtools cis` and `QTLtools trans` by `3a_merge.peaks.pl` or `3b_merge.gene.pl`. Please ensure that the colomn orders of the GFT file and the merged file are the same. More details please see `perl xxx.pl -help`.  
      
4. Further filter m6A-epaks or genes by `4a_keptRegions.peaks.R` or `4b_keptRegions.gene.R`. We can remove peaks or genes with low reads desnity or low variance.  More details please see code of `4a_keptRegions.peaks.R` or `4b_keptRegions.gene.R`
     
5. PCA for genotype by `5_QTLtools_pca.SNP.sh`. PCA and PEER factor analysis for phenotype please see the codes under folder `covariates`.

6-8. Identify cis- or trans-QTLs by invoking `QTLtools cis` or `QTLtools trans`.    
