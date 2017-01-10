set style line  1 lt rgb "red"    lw 4
set style line 10 lt rgb "green"  lw 4
set style line 19 lt rgb "blue"   lw 4
set style line 28 lt rgb "black"  lw 4
plot \
'plotNC.dat' ls  1 w l not, \
'plotN.dat'  ls 10 w l not, \
'plotC.dat'  ls 19 w l not
set terminal postscript color
set output 'DALIhitROC.ps'
replot
