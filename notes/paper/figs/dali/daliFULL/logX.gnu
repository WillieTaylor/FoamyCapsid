set style line  1 lt rgb "black"
set style line  2 lt rgb "red" 
set style line  3 lt rgb "cyan"
set style line  4 lt rgb "magenta"
set style line  5 lt rgb "green"
set style line  6 lt rgb "blue"
plot [-0.1:][1.9:5.1]\
'3etnN.dat' u (log10($1)):(($3-0.04))    ls 6  pt 7 ps 0.7 not, \
'3etnC.dat' u (log10($1)):(($3-0.04))    ls 6  pt 5 ps 0.7 not, \
'wenN.dat' u (log10($1)):(($3-0.02))     ls 1  pt 7 ps 0.7 not, \
'wenC.dat' u (log10($1)):(($3-0.02))     ls 1  pt 5 ps 0.7 not, \
'capFnewN.dat' u (log10($2)):(($4))      ls 3  pt 7 ps 0.7 not, \
'capTnewN.dat' u (log10($2)):(($4+0.02)) ls 2  pt 7 ps 0.7 not, \
'capFnewC.dat' u (log10($2)):(($4))      ls 5  pt 7 ps 0.7 not, \
'capTnewC.dat' u (log10($2)):(($4+0.02)) ls 4  pt 7 ps 0.7 not
set terminal postscript color
set output 'rawDALIdom.ps'
replot
