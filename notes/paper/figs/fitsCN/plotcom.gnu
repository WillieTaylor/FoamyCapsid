set style line  1 lt rgb "red" 
set style line 10 lt rgb "green" 
set style line 19 lt rgb "blue" 
set style line 28 lt rgb "magenta"
plot [][0:10] \
'natall.dat' ls 19 pt 11 ps 3.0 not, \
'plotcom.dat' u ($3/50):6 w l ls 1 lw 4 not, \
m=1.29, s=0.21, 500*exp(-(x-m)*(x-m)/(2.0*s*s)) ls 10 lw 4 not
pause -1
