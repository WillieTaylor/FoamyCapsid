cp sapit.gnu sapitNN.gnu
sed 's/N/C/' sapitNN.gnu > sapitCN.gnu 
sed 's/N/C/' sapitCN.gnu > sapitCC.gnu 
sed 's/C/N/' sapitCC.gnu > sapitNC.gnu 

sed -i 's/XXX/575/' sapitNN.gnu
sed -i 's/XXX/595/' sapitCN.gnu
sed -i 's/XXX/666/' sapitCC.gnu
sed -i 's/XXX/335/' sapitNC.gnu

gnuplot sapitNN.gnu
gnuplot sapitNC.gnu
gnuplot sapitCC.gnu
gnuplot sapitCN.gnu

evince sapitNN.ps &
evince sapitCN.ps &
evince sapitCC.ps &
evince sapitNC.ps &

# CC = 0.666 end-4
# CN = 0.595 end
# NN = 0.575 end
# NC = 0.340 end-10
