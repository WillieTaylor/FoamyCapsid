@ n = 0
rm testR.script
rm testR.name
foreach set ( `ls *_[NC]/*/random.dat` )
	echo $set | sed 's/.random.dat//' >> testR.name
	cat $set | awk '{if($1>60){print $2/(sqrt($1)*(1-exp(-$1*$1/900)))}}' > set$n.dat
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
sort -nr -k7 tests.dat > tests.sort
