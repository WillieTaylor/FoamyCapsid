set style line  1 lt rgb "black"
set style line  2 lt rgb "red" 
set style line  3 lt rgb "cyan"
set style line  4 lt rgb "magenta"
set style line  5 lt rgb "green"
set style line  6 lt rgb "blue"
plot [20:90][0:15] d = 900, \
'random.dat' ls 6 pt 7 ps 0.75 not, \
'sapall.dat' ls 1 pt 7 ps 1.50 not, \
1.7*sqrt(x)*(1-exp(-x*x/d)) ls 6 lw 3 not, \
0.8*sqrt(x)*(1-exp(-x*x/d)) ls 6 lw 3 not
set terminal postscript color
set output 'sapit.ps'
replot
