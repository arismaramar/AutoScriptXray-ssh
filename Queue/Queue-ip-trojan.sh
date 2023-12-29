#!/bin/bash
echo -n > /var/log/xray/access.log
sleep 4
data=( `ls /etc/Anggun/Queue/trojan/ip`);
for user in "${data[@]}"
do
ipQueue=$(cat /etc/Anggun/Queue/trojan/ip/$user)
ehh=$(cat /var/log/xray/trojan.log | grep "$user" | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | sort | uniq);
cekcek=$(echo -e "$ehh" | wc -l);
if [[ $cekcek -gt $ipQueue ]]; then
disable-trojan  $user $cekcek $ipQueue "$ehh"
nais=3
else
echo > /dev/null
fi
sleep 0.1
done
if [[ $nais -gt 1 ]]; then
telegram-send --pre "$(log-trojan)" > /dev/null &
systemctl restart trojan-ws
systemctl restart trojan-grpc
else
echo > /dev/null
fi
