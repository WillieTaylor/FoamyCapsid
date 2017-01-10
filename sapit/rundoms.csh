foreach dom (`cat [NC]term.list`)
	echo $dom
	tcsh rundom.csh $dom
end
