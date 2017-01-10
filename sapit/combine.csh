@ n = 0
rm combR.script
rm combR.name
foreach set ( `ls combine[NC][NC]/randoms.dat` )
	set dir = `echo $set | sed 's/.randoms.dat//'`
	@ len = `head -1 $dir/overall.dat | awk '{print $1}'`
	echo $dir = $len
	echo $dir $len >> combR.name
	cat $set | awk -v n=$len '{if($1>n-10 && $1<n+10){print $2/(sqrt($1)*(1-exp(-$1*$1/900)))}}' > set$n.dat
	@ got = `cat set$n.dat | wc -l`
	if ( $got == 0 ) then
		echo $set
		wc set$n.dat
		exit
	endif
	echo "t <- scan('set$n.dat')" >> combR.script
	echo "shapiro.test(t)" >> combR.script
	echo "ks.test(t, "pnorm", mean = mean(t), sd = sqrt(var(t)))"  >> combR.script
	@ n++
end
R --vanilla < combR.script > combR.log
grep 'W =' combR.log > combRsw.dat
grep 'D =' combR.log > combRks.dat
paste combR.name combRks.dat > combKS.dat
paste combR.name combRsw.dat > combSW.dat
paste combR.name combRks.dat combRsw.dat > combs.dat
sort -nr -k8 combs.dat > combs.sort
sort -nr -k8 combKS.dat > combKS.sort
cat combKS.sort
