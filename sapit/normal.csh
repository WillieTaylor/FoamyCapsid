@ n = 0
rm testR.script
rm testR.name
foreach set ( `ls *_[NC]/*/random.dat` )
	set dir = `echo $set | sed 's/.random.dat//'`
	@ len = `cat $dir/overall.dat | awk '{print $1}'`
	echo $dir = $len
	echo $dir $len >> testR.name
	cat $set | awk -v n=$len '{if($1>n-10 && $1<n+10){print $2/(sqrt($1)*(1-exp(-$1*$1/900)))}}' > set$n.dat
	@ got = `cat set$n.dat | wc -l`
	if ( $got == 0 ) then
		echo $set
		wc set$n.dat
		exit
	endif
	echo "t <- scan('set$n.dat')" >> testR.script
	echo "shapiro.test(t)" >> testR.script
	echo "ks.test(t, "pnorm", mean = mean(t), sd = sqrt(var(t)))"  >> testR.script
	@ n++
end
R --vanilla < testR.script > testR.log
grep 'W =' testR.log > testRsw.dat
grep 'D =' testR.log > testRks.dat
paste testR.name testRks.dat > testKS.dat
paste testR.name testRsw.dat > testSW.dat
paste testR.name testRks.dat testRsw.dat > tests.dat
sort -nr -k8 tests.dat > tests.sort
sort -nr -k8 testKS.dat > testKS.sort
cat testKS.sort
