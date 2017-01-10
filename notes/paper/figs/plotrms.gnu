set style line  1 lt rgb "red" 
set style line 10 lt rgb "green" 
set style line 19 lt rgb "blue" 
set style line 28 lt rgb "magenta"
plot [1:150][0:20] \
'plotrms.dat' w l ls 19 lw 4 not
set terminal postscript color
set output 'plotrms.eps'
replot
