rm saprms.dat
@ m = 0
foreach mod ( `cat full.list` )
	@ m++
	@ n = 0
	foreach nod ( `cat full.list` )
		@ n++
		if ( $n <= $m ) continue
		set rms = `~/util/sap121 home/pdb/$mod home/pdb/$nod | grep Weighted`
		echo $m $n $rms[5] $mod $nod
		echo $m $n $rms[5] $mod $nod >> saprms.dat
	end
end
sort -n -k 3 saprms.dat > saprms.rank
head -33 saprms.rank

