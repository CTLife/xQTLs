nohup time  perl 3_rawReadsNum.pl   -in 1_BAM/IP       -gtf 2_Regions/finalMergedPeaks.sorted.gtf.gz    -out 3_rawReadsNum/finalMergedPeaks/IP        > 3_rawReadsNum.1.runLog.txt  2>&1    &    
nohup time  perl 3_rawReadsNum.pl   -in 1_BAM/Input    -gtf 2_Regions/finalMergedPeaks.sorted.gtf.gz    -out 3_rawReadsNum/finalMergedPeaks/Input     > 3_rawReadsNum.2.runLog.txt  2>&1    &

nohup time  perl 3_rawReadsNum.pl   -in 1_BAM/IP       -gtf 2_Regions/hg38.gencode.v39.chr1-22.Collapsed.gtf.gz    -out 3_rawReadsNum/hg38.gencode.v39.chr1-22.Collapsed/IP     > 3_rawReadsNum.3.runLog.txt  2>&1    &
nohup time  perl 3_rawReadsNum.pl   -in 1_BAM/Input    -gtf 2_Regions/hg38.gencode.v39.chr1-22.Collapsed.gtf.gz    -out 3_rawReadsNum/hg38.gencode.v39.chr1-22.Collapsed/Input  > 3_rawReadsNum.4.runLog.txt  2>&1    &

nohup time  perl 3_rawReadsNum.pl   -in 1_BAM/IP       -gtf 2_Regions/hg38.gencode.v39.chr1-22.gtf.gz              -out 3_rawReadsNum/hg38.gencode.v39.chr1-22/IP               > 3_rawReadsNum.5.runLog.txt  2>&1    &
nohup time  perl 3_rawReadsNum.pl   -in 1_BAM/Input    -gtf 2_Regions/hg38.gencode.v39.chr1-22.gtf.gz              -out 3_rawReadsNum/hg38.gencode.v39.chr1-22/Input            > 3_rawReadsNum.6.runLog.txt  2>&1    &                                


