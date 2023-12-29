#!/bin/bash
clear
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "     =[ SSH User Login ]=         "
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
mulog=$(mesinssh)
data=( `cat /etc/passwd | grep home | cut -d ' ' -f 1 | cut -d : -f 1`);
for user in "${data[@]}"
do
cekcek=$(echo -e "$mulog" | grep $user | wc -l)
if [[ $cekcek -gt 0 ]]; then
echo -e "\e[33;1mUser\e[32;1m  : $user"
echo -e "\e[33;1mLogin\e[32;1m : $cekcek IP Login "
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo "slot" >> /root/system
else
echo > /dev/null
fi
sleep 0.1
done
aktif=$(cat /root/system | wc -l)
echo -e "$aktif User Online"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sed -i "d" /root/system