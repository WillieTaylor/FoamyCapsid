cat $argv[1]/$argv[1]foam$argv[2]/random.dat | awk '{if($1>50){print $2/(sqrt($1)*(1-exp(-$1*$1/900)))}}' | tr "\n" ","
