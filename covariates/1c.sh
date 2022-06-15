python3  1a_peer_wrapper.py  >   1a_peer_wrapper.runLog  2>&1 
Rscript  1b_analysis.R       >   1b_analysis.runLog      2>&1 



sed   -i '1d'  peer/factors.T.txt
known="../BA9.knownFactors.all.txt"
head   -n 1   $known  > peer/head.txt
known2="../BA9.knownFactors.all.nohead"


for n in $(seq 1 20); do
    head   -n $n   peer/factors.T.txt        > peer/$n.txt
    cat   peer/head.txt  peer/$n.txt         > peer/factors.$n.txt
    cat   peer/factors.$n.txt  $known2       > peer/factors.withKnown.$n.txt
done  




