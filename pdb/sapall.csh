rm super.pdb
rm rmsd.dat
rm plot.dat
@ n = 0
foreach pdb1 ( `ls *.pdb` )
	@ n++
	@ m = 0
	foreach pdb2 ( `ls *.pdb` )
		@ m++
		if ( $m <= $n ) continue
		set rms = `~/util/sap $pdb1 $pdb2 | grep 'over all'`
		echo $n $m $rms
		echo $pdb1 $pdb2 $rms >> rmsd.dat
		cat plot.rms >> plot.dat
		echo >> plot.dat
		rm super.pdb
	end
end
