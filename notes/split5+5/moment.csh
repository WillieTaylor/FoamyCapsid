@ n = 20
while ( $n > 5 )
	set dat = `./moment $n | tail -1`
	echo $n $dat
	@ n--
end	
