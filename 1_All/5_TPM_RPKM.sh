nohup time  perl 5_TPM_RPKM.pl   -in 1_BAM/IP       -gtf 2_Regions/finalMergedPeaks.sorted.gtf    -out 5_TPM_RPKM/finalMergedPeaks/IP        > 5_TPM_RPKM.1.runLog.txt  2>&1    &    
nohup time  perl 5_TPM_RPKM.pl   -in 1_BAM/Input    -gtf 2_Regions/finalMergedPeaks.sorted.gtf    -out 5_TPM_RPKM/finalMergedPeaks/Input     > 5_TPM_RPKM.2.runLog.txt  2>&1    &


nohup time  perl 5_TPM_RPKM.pl   -in 1_BAM/Input    -gtf 2_Regions/hg38.gencode.v39.chr1-22.Collapsed.gtf    -out 5_TPM_RPKM/hg38.gencode.v39.chr1-22.Collapsed/Input     > 5_TPM_RPKM.3.runLog.txt  2>&1    &
nohup time  perl 5_TPM_RPKM.pl   -in 1_BAM/Input    -gtf 2_Regions/hg38.gencode.v39.chr1-22.gtf              -out 5_TPM_RPKM/hg38.gencode.v39.chr1-22/Input               > 5_TPM_RPKM.4.runLog.txt  2>&1    &


