cp overall.$argv[1] overall.dat
cp random.$argv[1] random.dat
./fits1 x 30.0 10 > fits.log
grep ' [3-9]. plot' fits.log > plot$argv[1].dat
tail -1 fits.log > fits$argv[1].dat
cat fits$argv[1].dat
gnuplot plot$argv[1].gnu
evince plot$argv[1].ps &
