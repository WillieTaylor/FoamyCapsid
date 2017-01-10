tcsh pval-NC+CN.csh $argv[1] | grep better | awk '{n+=$3; b+=$21; print "NC+CN",n,b,b/n}' | tail -1
tcsh pval-NN+CC.csh $argv[1] | grep better | awk '{n+=$3; b+=$21; print "NN+CC",n,b,b/n}' | tail -1

