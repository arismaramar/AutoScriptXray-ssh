#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################
clear
cekray=`cat /root/log-install.txt | grep -ow "XRAY" | sort | uniq`
if [ "$cekray" = "XRAY" ]; then
domen=`cat /etc/xray/domain`
else
domen=`cat /etc/v2ray/domain`
fi
portsshws=`cat ~/log-install.txt | grep -w "SSH Websocket" | cut -d: -f2 | awk '{print $1}'`
wsssl=`cat /root/log-install.txt | grep -w "SSH SSL Websocket" | cut -d: -f2 | awk '{print $1}'`

echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[0;41;36m            SSH Account            \E[0m"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
read -p "Username : " Login
read -p "Password : " Pass
read -p "Max Login : " ipQueue
read -p "Expired (Days): " masaaktif

IP=$(curl -sS ifconfig.me);
ossl=`cat /root/log-install.txt | grep -w "OpenVPN" | cut -f2 -d: | awk '{print $6}'`
opensh=`cat /root/log-install.txt | grep -w "OpenSSH" | cut -f2 -d: | awk '{print $1}'`
db=`cat /root/log-install.txt | grep -w "Dropbear" | cut -f2 -d: | awk '{print $1,$2}'`
ssl="$(cat ~/log-install.txt | grep -w "Stunnel4" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"

OhpSSH=`cat /root/log-install.txt | grep -w "OHP SSH" | cut -d: -f2 | awk '{print $1}'`
OhpDB=`cat /root/log-install.txt | grep -w "OHP DBear" | cut -d: -f2 | awk '{print $1}'`
OhpOVPN=`cat /root/log-install.txt | grep -w "OHP OpenVPN" | cut -d: -f2 | awk '{print $1}'`

sldomain=$(cat /etc/xray/dns)
cdndomain=$(cat /root/awscdndomain)
slkey=$(cat /etc/slowdns/server.pub)
sleep 1
clear
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
PID=`ps -ef |grep -v grep | grep sshws |awk '{print $2}'`

if [[ ! -z "${PID}" ]]; then
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m" | tee -a /etc/log-create-user.log
echo -e "\E[0;41;36m   SSH OVPN Account  \E[0m" | tee -a /etc/log-create-user.log
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m" | tee -a /etc/log-create-user.log
echo -e "Username    : $Login" | tee -a /etc/log-create-user.log
echo -e "Password    : $Pass" | tee -a /etc/log-create-user.log
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m" | tee -a /etc/log-create-user.log
echo -e "IP          : $IP" | tee -a /etc/log-create-user.log
echo -e "Host        : $domen" | tee -a /etc/log-create-user.log
echo -e "Host Dns    : $sldomain" | tee -a /etc/log-create-user.log
echo -e "Pubkey      : $slkey" | tee -a /etc/log-create-user.log
echo -e "OpenSSH     : $opensh" | tee -a /etc/log-create-user.log
echo -e "SSH-WS      : $portsshws" | tee -a /etc/log-create-user.log
echo -e "SSH-SSL-WS  : $wsssl" | tee -a /etc/log-create-user.log
echo -e "SSL/TLS     :$ssl" | tee -a /etc/log-create-user.log
echo -e "Port Udp    : 1-65535" | tee -a /etc/log-create-user.log
echo -e "UDPGW       : 7100-7300" | tee -a /etc/log-create-user.log
echo -e "SSH-80      : $domen:80@$Login:$Pass" | tee -a /etc/log-create-user.log
echo -e "SSH-443     : $domen:443@$Login:$Pass" | tee -a /etc/log-create-user.log
echo -e "SSH-UDP     : $domen:1-65535@$Login:$Pass" | tee -a /etc/log-create-user.log
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m" | tee -a /etc/log-create-user.log
echo -e "Expired On  : $exp" | tee -a /etc/log-create-user.log
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m" | tee -a /etc/log-create-user.log
echo -e "Payload WSS" | tee -a /etc/log-create-user.log
echo -e "
GET wss://isi_bug_disini [protocol][crlf]Host: ${domen}[crlf]Upgrade: websocket[crlf][crlf]
" | tee -a /etc/log-create-user.log
echo -e "Payload WS" | tee -a /etc/log-create-user.log
echo -e "
GET / HTTP/1.1[crlf]Host: $domen[crlf]Upgrade: websocket[crlf][crlf]
" | tee -a /etc/log-create-user.log
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m" | tee -a /etc/log-create-user.log

else

#limitip/Queue
if [[ $ipQueue -gt 0 ]]; then
echo -e "$ipQueue" > /etc/Anggun/Queue/ssh/ip/$Login
else
echo > /dev/null
fi
clear
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m" | tee -a /etc/log-create-user.log
echo -e "\E[0;41;36m   SSH OVPN Account  \E[0m" | tee -a /etc/log-create-user.log
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m" | tee -a /etc/log-create-user.log
echo -e "Username    : $Login" | tee -a /etc/log-create-user.log
echo -e "Password    : $Pass" | tee -a /etc/log-create-user.log
echo -e "Max Login   : $ipQueue" | tee -a /etc/log-create-user.log
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m" | tee -a /etc/log-create-user.log
echo -e "Host        : $domen" | tee -a /etc/log-create-user.log
echo -e "Host Dns   : $sldomain" | tee -a /etc/log-create-user.log
echo -e "Pubkey      : $slkey" | tee -a /etc/log-create-user.log
echo -e "OpenSSH     : $opensh" | tee -a /etc/log-create-user.log
echo -e "SSH-WS      : $portsshws" | tee -a /etc/log-create-user.log
echo -e "SSH-SSL-WS  : $wsssl" | tee -a /etc/log-create-user.log
echo -e "SSL/TLS     :$ssl" | tee -a /etc/log-create-user.log
echo -e "Port Udp    : 1-65535" | tee -a /etc/log-create-user.log
echo -e "UDPGW       : 7100-7300" | tee -a /etc/log-create-user.log
echo -e "SSH-80      : $domen:80@$Login:$Pass" | tee -a /etc/log-create-user.log
echo -e "SSH-443     : $domen:443@$Login:$Pass" | tee -a /etc/log-create-user.log
echo -e "SSH-UDP     : $domen:1-65535@$Login:$Pass" | tee -a /etc/log-create-user.log
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m" | tee -a /etc/log-create-user.log
echo -e "Expired On  : $exp" | tee -a /etc/log-create-user.log
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m" | tee -a /etc/log-create-user.log
echo -e "Payload WSS" | tee -a /etc/log-create-user.log
echo -e "
GET wss://isi_bug_disini [protocol][crlf]Host: ${domen}[crlf]Upgrade: websocket[crlf][crlf]
" | tee -a /etc/log-create-user.log
echo -e "Payload WS" | tee -a /etc/log-create-user.log
echo -e "
GET / HTTP/1.1[crlf]Host: $domen[crlf]Upgrade: websocket[crlf][crlf]
" | tee -a /etc/log-create-user.log
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m" | tee -a /etc/log-create-user.log
fi
echo "" | tee -a /etc/log-create-user.log
read -n 1 -s -r -p "PRESS [ ENTER ] KELUAR MENU"
menu
