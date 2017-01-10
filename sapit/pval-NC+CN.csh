# 1 = mode

foreach str ( `cat NCterm.list` )
	set dom1 = "_N"
	set dom2 = "foamC"
	set dir =  $str$dom1/$str$dom1$dom2
	echo $dir
	~/sapit/pvalue$argv[1] $dir 30.0 10
	set dom1 = "_C"
	set dom2 = "foamN"
	set dir =  $str$dom1/$str$dom1$dom2
	echo $dir
	~/sapit/pvalue$argv[1] $dir 30.0 10
end
