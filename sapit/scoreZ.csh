# 1 = Gaussian damping factor for short alignments (30), 2 = margin (range = naln+/-margin) (10)

rm combine*/*

rm score*.dat
set foamN = `echo foamN`
set foamC = `echo foamC`
foreach dom (`cat Nterm.list`)
	echo $dom
	set score = `main/fits1 $dom/$dom$foamN $argv[1] $argv[2]` 
	cat $dom/$dom$foamN/overall.dat >> combineNN/overall.dat
	cat $dom/$dom$foamN/random.dat  >> combineNN/randoms.dat
	echo $dom+N $score >> scoreNN.dat
	set score = `main/fits1 $dom/$dom$foamC $argv[1] $argv[2]` 
	cat $dom/$dom$foamC/overall.dat >> combineNC/overall.dat
	cat $dom/$dom$foamC/random.dat  >> combineNC/randoms.dat
	echo $dom+C $score >> scoreNC.dat
end
foreach dom (`cat Cterm.list`)
	echo $dom
	set score = `main/fits1 $dom/$dom$foamN $argv[1] $argv[2]` 
	cat $dom/$dom$foamN/overall.dat >> combineCN/overall.dat
	cat $dom/$dom$foamN/random.dat  >> combineCN/randoms.dat
	echo $dom+N $score >> scoreCN.dat
	set score = `main/fits1 $dom/$dom$foamC $argv[1] $argv[2]` 
	cat $dom/$dom$foamC/overall.dat >> combineCC/overall.dat
	cat $dom/$dom$foamC/random.dat  >> combineCC/randoms.dat
	echo $dom+C $score >> scoreCC.dat
end
echo
cat score*.dat | awk '{n++; s+=$16; print "stdev.=", s/n}' | tail -1
cat score*.dat | awk '{n++; s+=$19; print "Zscore=", s/n}' | tail -1
# T-tests
rm Ttests.dat
echo T-tests >> Ttests.dat
echo >> Ttests.dat
echo N+foamN >> Ttests.dat
main/stest combineNN $argv[1] $argv[2] >> Ttests.dat
echo N+foamC >> Ttests.dat
main/stest combineNC $argv[1] $argv[2] >> Ttests.dat
echo C+foamN >> Ttests.dat
main/stest combineCN $argv[1] $argv[2] >> Ttests.dat
echo C+foamC >> Ttests.dat
main/stest combineCC $argv[1] $argv[2] >> Ttests.dat
cat Ttests.dat
