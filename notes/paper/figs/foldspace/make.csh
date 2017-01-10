@ n = `cat full.list | wc -l`
echo $n models
echo $n > dist.dat
awk '{print $1-1,$2-1,$3,1.0/$3}' saprms.dat  >> dist.dat
~/project/proj
paste test.pdb best.list > prots.pdb
rasmol -script ~/project/test.ras test.pdb
#edit chain id into prots.pdb
rasmol -script ~/project/prots.ras prots.pdb &
#make network
sort -n -k3 saprms.dat > saprms.rank
cat saprms.rank | grep -v 'fold...cas frag'  | grep -v 'fold..cas frag' | grep -v 'pred...cas tm'  | grep -v 'pred..cas tm' > saprms.both

