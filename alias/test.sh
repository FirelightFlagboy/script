cmnd="ps aux | grep -i notif | grep -v grep | awk '{print \$2}'"

while true
do
	eval res=\`$cmnd\`
	for p in $res
	do
		ps aux | grep $p | grep -v grep | awk {'printf ("%-10s:%s\n", $2, $11)'}
		kill -11 $p
	done
	sleep 0.5
done
