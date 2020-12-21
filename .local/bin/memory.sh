#!/bin/bash

#TODO: Work on that with "free" -h not "free" it might be a lighter code (Luke might
# be helpful on that)

total=$(free | grep Mem | awk '{print $2}')
used=$(free | grep Mem | awk '{print $3}')
buffCache=$(free | grep Mem | awk '{print $5}')
totUsed=$((used + buffCache))

# -- Just for test
#percent=$(echo "($totUsed / $total) * 100" | bc -l | awk -F "." '{print $1}')
#
#echo "$(echo "$totUsed / 1024" | bc)MiB/$(echo "$total / 1024" | bc)MiB"
#echo $percent
# --

echo "Total: $total
Used:  $totUsed" | awk '
/^Total:/ {
  mem_total=$2
}
/^Used:/ {
	mem_used=$2
}
END {
total_m=mem_total/1024/1024
used_m=mem_used/1024
pct=0
if (total_m > 0) {
			pct=used_m/total_m*100
		}
if (used_m > 1200) {
		used_m=used_m/1024
		# full text
		# printf("%.2fGiB/%.0fGiB (%.f%%)\n", used_m, total_m, pct)
		printf("%.2fGiB/%.2fGiB\n", used_m, total_m)
		# short text
		# printf("%.f%%\n", pct)
}
else {	
		# full text
		# printf("%.0fMiB/%.0fGiB (%.f%%)\n", used_m, total_m, pct)
		printf("%.0fMiB/%.2fGiB\n", used_m, total_m)
		# short text
		# printf("%.f%%\n", pct)
}
# color
# if (pct > 90) {
# 	print("#FF0000")
# 	} 
# else if (pct > 80) {
# 	print("#FFAE00")
# 	}
# else if (pct > 70) {
# 	print("#FFF600")
# 	}
}
	'
