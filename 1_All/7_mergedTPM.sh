nohup time  perl 7_mergedTPM.pl   -in 5_TPM_RPKM/finalMergedPeaks/IP/forward       -out 7_mergedTPM/finalMergedPeaks/IP/forward      > 7_mergedTPM.1.runLog.txt  2>&1    &       
nohup time  perl 7_mergedTPM.pl   -in 5_TPM_RPKM/finalMergedPeaks/Input/forward    -out 7_mergedTPM/finalMergedPeaks/Input/forward   > 7_mergedTPM.2.runLog.txt  2>&1    &       

nohup time  perl 7_mergedTPM.pl   -in 5_TPM_RPKM/hg38.gencode.v39.chr1-22/Input/forward           -out 7_mergedTPM/hg38.gencode.v39.chr1-22/Input/forward             > 7_mergedTPM.3.runLog.txt  2>&1    &       

nohup time  perl 7_mergedTPM.pl   -in 5_TPM_RPKM/hg38.gencode.v39.chr1-22.Collapsed/Input/forward    -out 7_mergedTPM/hg38.gencode.v39.chr1-22.Collapsed/Input/forward   > 7_mergedTPM.4.runLog.txt  2>&1    &       


