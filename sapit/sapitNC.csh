foreach dom (`cat NCterm.list`)
	echo pdb/$dom\_N with pdb/$dom\_C
	tcsh main/sapit.csh $dom\_N $dom\_C > $dom.log
	mv $dom\_N$dom\_C $dom\_N+$dom\_C
end
