#!/bin/bash
clear
domain=$(cat /etc/xray/domain)
IP=$(curl -sS ifconfig.me);
Login=Trial-`</dev/urandom tr -dc X-Z0-9 | head -c3`
hari="1"
Pass=1
echo Ping Host
echo Create Akun: $Login
sleep 0.5
echo Setting Password: $Pass
sleep 0.5
clear
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
clear
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e "\E[0;41;36m     🇮🇩 TRIAL SSH 🇮🇩     \E[0m"
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e "Username     : $Login"
echo -e "Password     : $Pass"
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e "IP           : $IP"
echo -e "Host         : ${domain}"
echo -e "Port OpenSSH : 22"
echo -e "Port WS NTLS : 80, 8080, 8880, 2082"
echo -e "Port WS TLS  : 443"
echo -e "Port SSL/TLS : 443, 777"
echo -e "Port Ssh Udp : 1-65535"
echo -e "Port UDPGW   : 7100-7900"
echo -e "SSH-80       : ${domain}:80@$Login:$Pass"
echo -e "SSH-443      : ${domain}:443@$Login:$Pass"
echo -e "SSH-UDP      : ${domain}:1-65535@$Login:$Pass"
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e "Payload Websocket NTLS :" | tee -a /etc/log-create-user.log
echo -e "GET / HTTP/1.1[crlf]Host: [host][crlf]Connection: Upgrade[crlf]User-Agent: [ua][crlf]Upgrade: websocket[crlf][crlf]" | tee -a /etc/log-create-user.log
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e "" | tee -a /etc/log-create-user.log
echo -e "Payload Websocket TLS  :" | tee -a /etc/log-create-user.log
echo -e "GET https://[host]/ HTTP/1.1[crlf]Host: [host][crlf]Connection: Upgrade[crlf]User-Agent: [ua][crlf]Upgrade: websocket[crlf][crlf]" | tee -a /etc/log-create-user.log
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo ""
read -n 1 -s -r -p "SCRIPT PREMIUM ANGGUN"
menu
