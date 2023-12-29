#!/bin/bash
data=( `ls /etc/Anggun/Queue/vmess/quota`);
for user in "${data[@]}"
do
ipQueue=$(cat /etc/Anggun/Queue/vmess/quota/$user)
vasli=$(cat /etc/Anggun/vmess/$user)
if [[ $vasli -gt $ipQueue ]]; then
sed -i "/$user/d" /etc/xray/vmess*
rm /etc/Anggun/vmess/$user
rm /etc/Anggun/cache/*/$user
rm /etc/Anggun/Queue/vmess/quota/$user
nais=3
else
echo > /dev/null
fi
sleep 0.1
done
if [[ $nais -gt 1 ]]; then
systemctl restart vmess-ws
systemctl restart vmess-grpc
else
echo > /dev/null
fi