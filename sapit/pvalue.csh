foreach str ( `cat NCterm.list` )
	set dom = "foamN"
	echo $str/$str$dom
	~/sapit/pvalue $str/$str$dom 30.0 10
	set dom = "foamC"
	echo $str/$str$dom
	~/sapit/pvalue $str/$str$dom 30.0 10
end
foreach str ( `cat NCterm.list` )
	set dom = "foamN"
	echo $str/$str$dom
	~/sapit/pvalue $str/$str$dom 30.0 10
	set dom = "foamC"
	echo $str/$str$dom
	~/sapit/pvalue $str/$str$dom 30.0 10
end
