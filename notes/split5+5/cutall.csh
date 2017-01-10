@ n = 20
while ( $n > 5 )
	set dat = `./cutall $n | tail -1`
	echo $n $dat
	@ n--
end	
