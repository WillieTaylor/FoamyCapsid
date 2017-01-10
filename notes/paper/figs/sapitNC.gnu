set style line  1 lt rgb "black"
set style line  2 lt rgb "red" 
set style line  3 lt rgb "cyan"
set style line  4 lt rgb "magenta"
set style line  5 lt rgb "green"
set style line  6 lt rgb "blue"
plot [20:90][0:15] d = 900, \
'HIV1_N/foamyC/best.dat' ls 1 pt 7 ps 2.0  not, \
'HIV1_N/foamyC/pdb1pdb2.dat' ls 1 lw 6 w l not, \
'HIV1_N/foamyC/nat1rev2.rat' ls 6 pt 1 ps 1.0  not, \
'HIV1_N/foamyC/nat1rve2.rat' ls 6 pt 2 ps 1.0  not, \
'HIV1_N/foamyC/nta1rev2.rat' ls 6 pt 3 ps 1.0  not, \
'HIV1_N/foamyC/nta1rve2.rat' ls 6 pt 4 ps 1.0  not, \
'HIV1_N/foamyC/rev1nat2.rat' ls 6 pt 5 ps 1.0  not, \
'HIV1_N/foamyC/rev1nta2.rat' ls 6 pt 6 ps 1.0  not, \
'HIV1_N/foamyC/rve1nat2.rat' ls 6 pt 7 ps 1.0  not, \
'HIV1_N/foamyC/rve1nta2.rat' ls 6 pt 8 ps 1.0  not, \
1.7*sqrt(x)*(1-exp(-x*x/d)) ls 6 lw 3 not, \
0.8*sqrt(x)*(1-exp(-x*x/d)) ls 6 lw 3 not, \
0.335*sqrt(x)*(1-exp(-x*x/d)) ls 1 lw 3 not
set terminal postscript color
set output 'sapitNC.ps'
replot
