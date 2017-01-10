# /home/wtaylor/util/ca2main/catomain 3etnC.cas > 3etnC.pdb
# /home/wtaylor/util/revcas 3nteN.cas > 3etnC.cas

grep MOLECULE newN.txt | sed 's/:/ /' | egrep '(GAG|CAPSID|P24)' > capTnewN.dat
grep MOLECULE newC.txt | sed 's/:/ /' | egrep '(GAG|CAPSID|P24)' > capTnewC.dat
grep MOLECULE newNC.txt | sed 's/:/ /' | egrep '(GAG|CAPSID|P24)' > capTnewNC.dat

grep MOLECULE newN.txt | sed 's/:/ /' | grep -v GAG | grep -v CAPSID | grep -v P24 > capFnewN.dat
grep MOLECULE newC.txt | sed 's/:/ /' | grep -v GAG | grep -v CAPSID | grep -v P24  > capFnewC.dat
grep MOLECULE newNC.txt | sed 's/:/ /' | grep -v GAG | grep -v CAPSID | grep -v P24  > capFnewNC.dat

sed -i 's/^/T /' capTnewNC.dat
sed -i 's/^/T /' capTnewN.dat
sed -i 's/^/T /' capTnewC.dat

sed -i 's/^/F /' capFnewNC.dat
sed -i 's/^/F /' capFnewN.dat
sed -i 's/^/F /' capFnewC.dat

cat capTnewNC.dat capFnewNC.dat | sort -n -k2 > capTFnewNC.dat
cat capTnewN.dat capFnewN.dat | sort -n -k2 > capTFnewN.dat
cat capTnewC.dat capFnewC.dat | sort -n -k2 > capTFnewC.dat

awk -v last=x '{ if (last=="x"){t=0; f=0;} if($1 != last){print f,t}; last=$1; if($1=="T"){t++}else{f++};}' capTFnewNC.dat > plotNC.dat
awk -v last=x '{ if (last=="x"){t=0; f=0;} if($1 != last){print f,t}; last=$1; if($1=="T"){t++}else{f++};}' capTFnewN.dat > plotN.dat
awk -v last=x '{ if (last=="x"){t=0; f=0;} if($1 != last){print f,t}; last=$1; if($1=="T"){t++}else{f++};}' capTFnewC.dat > plotC.dat
