echo -n > /var/log/xray/access.log
sleep 4
data=( `ls /etc/Anggun/Queue/vmess/ip`);
for user in "${data[@]}"
do
ipQueue=$(cat /etc/Anggun/Queue/vmess/ip/$user)
ehh=$(cat /var/log/xray/vmess.log | grep "$user" | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | sort | uniq);
cekcek=$(echo -e "$ehh" | wc -l);
if [[ $cekcek -gt $ipQueue ]]; then
disable-vmess  $user $cekcek $ipQueue "$ehh"
nais=3
else
echo > /dev/null
fi
sleep 0.1
done
if [[ $nais -gt 1 ]]; then
telegram-send --pre "$(log-vmess)" > /dev/null &
systemctl restart vmess-ws-orbit
systemctl restart vmess-ws-orbit1
systemctl restart vmess-ws
systemctl restart vmess-grpc
else
echo > /dev/null
fi
