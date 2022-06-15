zcat   BA9.recode.vcf.gz   | head -n 10000 |  grep -P "#CHROM\tPOS\tID"  >  BA9.sample_names.txt


