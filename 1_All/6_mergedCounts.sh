nohup time  perl 6_mergedCounts.pl   -in 5_TPM_RPKM/finalMergedPeaks/IP/forward       -out 6_mergedCounts/finalMergedPeaks/IP/forward      > 6_mergedCounts.1.runLog.txt  2>&1    &       
nohup time  perl 6_mergedCounts.pl   -in 5_TPM_RPKM/finalMergedPeaks/Input/forward    -out 6_mergedCounts/finalMergedPeaks/Input/forward   > 6_mergedCounts.2.runLog.txt  2>&1    &       

nohup time  perl 6_mergedCounts.pl   -in 5_TPM_RPKM/hg38.gencode.v39.chr1-22/Input/forward           -out 6_mergedCounts/hg38.gencode.v39.chr1-22/Input/forward             > 6_mergedCounts.3.runLog.txt  2>&1    &       

nohup time  perl 6_mergedCounts.pl   -in 5_TPM_RPKM/hg38.gencode.v39.chr1-22.Collapsed/Input/forward    -out 6_mergedCounts/hg38.gencode.v39.chr1-22.Collapsed/Input/forward   > 6_mergedCounts.4.runLog.txt  2>&1    &       


