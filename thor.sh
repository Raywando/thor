i=10
while true
do
	echo "new IP: $(torsocks curl icanhazip.com --silent)"
	sleep $i
	service tor reload

	while ! [ $(cat /var/log/syslog | grep 'Anonymizing\|Tor' | tail -1 | grep 'Reloaded Anonymizing overlay network for TCP' | wc -l) == "1" ]
	do
		sleep 0.1
	done
done
