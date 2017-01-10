@ n = 38
while ( $n > 5 )
	set dat = `./uphalf $n | tail -1`
	echo $n $dat
	@ n--
end	
