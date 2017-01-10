cat BLV_N/BLV_NfoamN/overall.dat    > comb5NN/overall.dat
cat HIV1_N/HIV1_NfoamN/overall.dat >> comb5NN/overall.dat
cat HML2_N/HML2_NfoamN/overall.dat >> comb5NN/overall.dat
cat HTLV_N/HTLV_NfoamN/overall.dat >> comb5NN/overall.dat
cat RSV_N/RSV_NfoamN/overall.dat   >> comb5NN/overall.dat

cat BLV_C/BLV_CfoamN/overall.dat    > comb5CN/overall.dat
cat HIV1_C/HIV1_CfoamN/overall.dat >> comb5CN/overall.dat
cat HML2_C/HML2_CfoamN/overall.dat >> comb5CN/overall.dat
cat HTLV_C/HTLV_CfoamN/overall.dat >> comb5CN/overall.dat
cat RSV_C/RSV_CfoamN/overall.dat   >> comb5CN/overall.dat

cat BLV_N/BLV_NfoamC/overall.dat    > comb5NC/overall.dat
cat HIV1_N/HIV1_NfoamC/overall.dat >> comb5NC/overall.dat
cat HML2_N/HML2_NfoamC/overall.dat >> comb5NC/overall.dat
cat HTLV_N/HTLV_NfoamC/overall.dat >> comb5NC/overall.dat
cat RSV_N/RSV_NfoamC/overall.dat   >> comb5NC/overall.dat

cat BLV_C/BLV_CfoamC/overall.dat    > comb5CC/overall.dat
cat HIV1_C/HIV1_CfoamC/overall.dat >> comb5CC/overall.dat
cat HML2_C/HML2_CfoamC/overall.dat >> comb5CC/overall.dat
cat HTLV_C/HTLV_CfoamC/overall.dat >> comb5CC/overall.dat
cat RSV_C/RSV_CfoamC/overall.dat   >> comb5CC/overall.dat

main/stest comb5NN 30 10
main/stest comb5NC 30 10
main/stest comb5CN 30 10
main/stest comb5CC 30 10
