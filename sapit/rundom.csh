# 1 = domain

mkdir $argv[1]
cd $argv[1]
ln -s ~/util
ln -s ~/sapit main
ln -s .. home
ln -s ../pdb
tcsh main/sapit.csh $argv[1] foamN > $argv[1]N.log
tcsh main/sapit.csh $argv[1] foamC > $argv[1]C.log
