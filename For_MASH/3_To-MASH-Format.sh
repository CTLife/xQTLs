


sos  run   gtexresults-2.0/workflows/fastqtl_to_mash.ipynb    \
  --cwd  3_To-MASH-Format      \
  --cols 15 16 13          \
  --data_list   FastQTLSumStats.list.txt   \
  -j 8
  
  
