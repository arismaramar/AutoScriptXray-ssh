#!/bin/bash
data=( `ls /etc/Anggun/Queue/vless/quota`);
for user in "${data[@]}"
do
ipQueue=$(cat /etc/Anggun/Queue/vless/quota/$user)
vasli=$(cat /etc/Anggun/vless/$user)
if [[ $vasli -gt $ipQueue ]]; then
sed -i "/$user/d" /etc/xray/vless*
rm /etc/Anggun/vless/$user
rm /etc/Anggun/cache/*/$user
rm /etc/Anggun/Queue/vless/quota/$user
nais=3
else
echo > /dev/null
fi
sleep 0.1
done
if [[ $nais -gt 1 ]]; then
systemctl restart vless-ws
systemctl restart vless-grpc
else
echo > /dev/null
fi