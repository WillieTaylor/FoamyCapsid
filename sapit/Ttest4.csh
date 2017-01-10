cp -r comb5NN comb4NN
cp -r comb5NC comb4NC
cp -r comb5CN comb4CN
cp -r comb5CC comb4CC

cat RSV_N/RSV_NfoamN/overall.dat    > comb4NN/overall.dat
cat BLV_N/BLV_NfoamN/overall.dat    > comb4NN/overall.dat
cat HIV1_N/HIV1_NfoamN/overall.dat >> comb4NN/overall.dat
cat HML2_N/HML2_NfoamN/overall.dat >> comb4NN/overall.dat

cat RSV_N/RSV_NfoamC/overall.dat    > comb4NC/overall.dat
cat BLV_N/BLV_NfoamC/overall.dat    > comb4NC/overall.dat
cat HIV1_N/HIV1_NfoamC/overall.dat >> comb4NC/overall.dat
cat HML2_N/HML2_NfoamC/overall.dat >> comb4NC/overall.dat

cat RSV_C/RSV_CfoamN/overall.dat    > comb4CN/overall.dat
cat BLV_C/BLV_CfoamN/overall.dat    > comb4CN/overall.dat
cat HIV1_C/HIV1_CfoamN/overall.dat >> comb4CN/overall.dat
cat HML2_C/HML2_CfoamN/overall.dat >> comb4CN/overall.dat

cat RSV_C/RSV_CfoamC/overall.dat    > comb4CC/overall.dat
cat BLV_C/BLV_CfoamC/overall.dat    > comb4CC/overall.dat
cat HIV1_C/HIV1_CfoamC/overall.dat >> comb4CC/overall.dat
cat HML2_C/HML2_CfoamC/overall.dat >> comb4CC/overall.dat

main/stest comb4NN 30 10
main/stest comb4NC 30 10
main/stest comb4CN 30 10
main/stest comb4CC 30 10

