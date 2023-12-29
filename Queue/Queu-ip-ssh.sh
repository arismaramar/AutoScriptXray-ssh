#!/bin/bash
mulog=$(mesinssh)
date=$(date)
data=( `ls /etc/Anggun/Queue/ssh/ip`);
for user in "${data[@]}"
do
ipQueue=$(cat /etc/Anggun/Queue/ssh/ip/$user)
cekcek=$(echo -e "$mulog" | grep $user | wc -l);
if [[ $cekcek -gt $ipQueue ]]; then
userdel -f -r $user
nais=3
echo -e "$waktu\nRemoved User: $user Login: $cekcek IP Max: $ip IP \n" >> /etc/Anggun/log/ssh/ssh.log
else
echo > /dev/null
fi
sleep 0.1
done
if [[ $nais -gt 1 ]]; then
telegram-send --pre "$(log-ssh)" > /dev/null & 
else
echo > /dev/null
fi