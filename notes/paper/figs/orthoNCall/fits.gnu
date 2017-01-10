set style line  1 lt rgb "red" 
set style line 10 lt rgb "green" 
set style line 19 lt rgb "blue" 
set style line 28 lt rgb "magenta"
plot \
'fits.dat' ls 19 pt 11 ps 3.0 not, \
'native.dat' u ($3/25):($6*5) w l ls 19 lw 4 not, \
'decoys.dat' u ($3/25):6 w l ls 1 lw 4 not, \
m=1.30, s=0.204, 125*exp(-(x-m)*(x-m)/(2.0*s*s)) ls 10 lw 4 not
set terminal postscript color
set output 'fits.ps'
replot
