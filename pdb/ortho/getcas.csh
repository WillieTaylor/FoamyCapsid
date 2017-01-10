foreach pdb (`cat ortho.list | sed 's/\.pdb//'`)
	echo $pdb
	tcsh ~/util/pdb2cas.csh $pdb A
end
