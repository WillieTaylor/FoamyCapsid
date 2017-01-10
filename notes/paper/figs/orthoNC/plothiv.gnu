set style line  1 lt rgb "red" 
set style line 10 lt rgb "green" 
set style line 19 lt rgb "blue" 
set style line 28 lt rgb "magenta"
plot \
'nathiv.dat' ls 19 pt 11 ps 3.0 not, \
'plothiv.dat' u ($3/50):6 w l ls 1 lw 4 not, \
m=1.23, s=0.17, 15*exp(-(x-m)*(x-m)/(s*s)) ls 10 lw 4 not
set terminal postscript color
set output 'plothiv.ps'
replot
