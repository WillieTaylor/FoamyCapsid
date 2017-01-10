#1 = pdb list
rm saprms.dat
@ m = 0
foreach mod ( `cat $argv[1].list` )
	@ m++
	@ n = 0
	foreach nod ( `cat $argv[1].list` )
		@ n++
		if ( $n <= $m ) continue
		set rms = `~/util/sap121 pdb/$mod pdb/$nod | grep Weighted`
		echo $m $n $rms[5] $mod $nod
		echo $m $n $rms[5] $mod $nod >> saprms.dat
	end
end
sort -n -k 3 saprms.dat > saprms.rank
echo
head saprms.rank

