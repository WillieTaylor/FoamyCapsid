set style line  1 lt rgb "black"
set style line  2 lt rgb "red" 
set style line  3 lt rgb "cyan"
set style line  4 lt rgb "orange"
set style line  5 lt rgb "green"
set style line  6 lt rgb "blue"
plot [-10:] \
'3etnN.dat' u 1:(log($3-0.04)) ls 6  pt 7 ps 0.5 not, \
'3etnC.dat' u 1:(log($3-0.04)) ls 6  pt 7 ps 0.5 not, \
'wenN.dat' u 1:(log($3-0.02)) ls 1  pt 7 ps 0.5 not, \
'wenC.dat' u 1:(log($3-0.02)) ls 1  pt 7 ps 0.5 not, \
'capFnewN.dat' u 2:(log($4)) ls 3  pt 7 ps 0.5 not, \
'capTnewN.dat' u 2:(log($4+0.02)) ls 2  pt 7 ps 0.5 not, \
'capFnewC.dat' u 2:(log($4)) ls 5  pt 7 ps 0.5 not, \
'capTnewC.dat' u 2:(log($4+0.02)) ls 4  pt 7 ps 0.5 not
set terminal postscript color
set output 'rawDALIdom.ps'
replot
