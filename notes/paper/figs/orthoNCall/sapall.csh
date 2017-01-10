rm sapall.dat
foreach Ndom ( `cat home/Nterm.list` )
	foreach Cdom ( `cat home/Cterm.list` )
		set sap = `~/util/sap home/pdb/$Ndom home/pdb/$Cdom | grep 'over all'`
		echo $sap[8] $sap[5] $Ndom $Cdom >> sapall.dat
		echo $sap[8] $sap[5] $Ndom $Cdom
	end
end
