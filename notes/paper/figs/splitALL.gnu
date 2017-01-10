set style line  1 lt rgb "red" 
set style line 10 lt rgb "black" 
set style line 19 lt rgb "blue" 
set style line 28 lt rgb "green"
set style line 37 lt rgb "cyan"
plot [5.5:38.5][-3.2:0] \
'momentALL.dat' u 1:(log10($10)) w l ls  1 lw 4 not, \
'uphalfALL.dat' u 1:(log10($10)) w l ls 19 lw 4 not, \
log10(0.005) ls 10 not, \
log10(0.05)  ls 10 not, \
log10(0.5)   ls 10 not, \
'sigALL-4.dat' w l ls 37 lw 8 not, \
'sigALL-3.dat' w l ls 28 lw 8 not
set terminal postscript color
set output 'splitALL.eps'
replot
