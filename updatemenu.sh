#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
BG="\E[44;1;39m"
NC="\E[0m"
CYAN='\033[0;96m'
clear
echo -e "$BG[INFO]$NC $CYAN Proses Update File$NC"
sleep 1

# download script
cd /usr/bin
wget -q -O /usr/bin/mbot "https://raw.githubusercontent.com/arismaramar/AutoScriptXray-ssh/main/menu/mbot.sh"
wget -q -O /usr/bin/menu "https://raw.githubusercontent.com/arismaramar/AutoScriptXray-ssh/main/menu/menu.sh"
wget -q -O /usr/bin/menu-vmess "https://raw.githubusercontent.com/arismaramar/AutoScriptXray-ssh/main/menu/menu-vmess.sh"
wget -q -O /usr/bin/menu-vless "https://raw.githubusercontent.com/arismaramar/AutoScriptXray-ssh/main/menu/menu-vless.sh"
wget -q -O /usr/bin/running "https://raw.githubusercontent.com/arismaramar/AutoScriptXray-ssh/main/menu/running.sh"
wget -q -O /usr/bin/clearcache "https://raw.githubusercontent.com/arismaramar/AutoScriptXray-ssh/main/menu/clearcache.sh"
wget -q -O /usr/bin/menu-trgo "https://raw.githubusercontent.com/arismaramar/AutoScriptXray-ssh/main/menu/menu-trgo.sh"
wget -q -O /usr/bin/menu-trojan "https://raw.githubusercontent.com/arismaramar/AutoScriptXray-ssh/main/menu/menu-trojan.sh"
wget -q -O /usr/bin/menu-trial "https://raw.githubusercontent.com/arismaramar/AutoScriptXray-ssh/main/menu/menu-trial.sh"
wget -q -O /usr/bin/menu-ssh "https://raw.githubusercontent.com/arismaramar/AutoScriptXray-ssh/main/menu/menu-ssh.sh"
wget -q -O /usr/bin/usernew "https://raw.githubusercontent.com/arismaramar/AutoScriptXray-ssh/main/ssh/usernew.sh"
wget -q -O /usr/bin/trial "https://raw.githubusercontent.com/arismaramar/AutoScriptXray-ssh/main/ssh/trial.sh"
wget -q -O /usr/bin/renew "https://raw.githubusercontent.com/arismaramar/AutoScriptXray-ssh/main/ssh/renew.sh"
wget -q -O /usr/bin/hapus "https://raw.githubusercontent.com/arismaramar/AutoScriptXray-ssh/main/ssh/hapus.sh"
wget -q -O /usr/bin/cek "https://raw.githubusercontent.com/arismaramar/AutoScriptXray-ssh/main/ssh/cek.sh"
wget -q -O /usr/bin/member "https://raw.githubusercontent.com/arismaramar/AutoScriptXray-ssh/main/ssh/member.sh"
wget -q -O /usr/bin/delete "https://raw.githubusercontent.com/arismaramar/AutoScriptXray-ssh/main/ssh/delete.sh"
wget -q -O /usr/bin/autokill "https://raw.githubusercontent.com/arismaramar/AutoScriptXray-ssh/main/ssh/autokill.sh"
wget -q -O /usr/bin/ceklim "https://raw.githubusercontent.com/arismaramar/AutoScriptXray-ssh/main/ssh/ceklim.sh"
wget -q -O /usr/bin/tendang "https://raw.githubusercontent.com/arismaramar/AutoScriptXray-ssh/main/ssh/tendang.sh"
wget -q -O /usr/bin/user-lock "https://raw.githubusercontent.com/arismaramar/AutoScriptXray-ssh/main/ssh/user-lock.sh"
wget -q -O /usr/bin/user-unlock "https://raw.githubusercontent.com/arismaramar/AutoScriptXray-ssh/main/ssh/user-unlock.sh"
wget -q -O /usr/bin/add-ws "https://raw.githubusercontent.com/arismaramar/AutoScriptXray-ssh/main/xray/add-ws.sh"
wget -q -O /usr/bin/trialvmess "https://raw.githubusercontent.com/arismaramar/AutoScriptXray-ssh/main/xray/trialvmess.sh"
wget -q -O /usr/bin/renew-ws "https://raw.githubusercontent.com/arismaramar/AutoScriptXray-ssh/main/xray/renew-ws.sh"
wget -q -O /usr/bin/del-ws "https://raw.githubusercontent.com/arismaramar/AutoScriptXray-ssh/main/xray/del-ws.sh"
wget -q -O /usr/bin/cek-ws "https://raw.githubusercontent.com/arismaramar/AutoScriptXray-ssh/main/xray/cek-ws.sh"
wget -q -O /usr/bin/add-vless "https://raw.githubusercontent.com/arismaramar/AutoScriptXray-ssh/main/xray/add-vless.sh"
wget -q -O /usr/bin/trialvless "https://raw.githubusercontent.com/arismaramar/AutoScriptXray-ssh/main/xray/trialvless.sh"
wget -q -O /usr/bin/renew-vless "https://raw.githubusercontent.com/arismaramar/AutoScriptXray-ssh/main/xray/renew-vless.sh"
wget -q -O /usr/bin/del-vless "https://raw.githubusercontent.com/arismaramar/AutoScriptXray-ssh/main/xray/del-vless.sh"
wget -q -O /usr/bin/cek-vless "https://raw.githubusercontent.com/arismaramar/AutoScriptXray-ssh/main/xray/cek-vless.sh"
wget -q -O /usr/bin/add-tr "https://raw.githubusercontent.com/arismaramar/AutoScriptXray-ssh/main/xray/add-tr.sh"
wget -q -O /usr/bin/trialtrojan "https://raw.githubusercontent.com/arismaramar/AutoScriptXray-ssh/main/xray/trialtrojan.sh"
wget -q -O /usr/bin/del-tr "https://raw.githubusercontent.com/arismaramar/AutoScriptXray-ssh/main/xray/del-tr.sh"
wget -q -O /usr/bin/renew-tr "https://raw.githubusercontent.com/arismaramar/AutoScriptXray-ssh/main/xray/renew-tr.sh"
wget -q -O /usr/bin/cek-tr "https://raw.githubusercontent.com/arismaramar/AutoScriptXray-ssh/main/xray/cek-tr.sh"
wget -q -O /usr/bin/menu-set "https://raw.githubusercontent.com/arismaramar/AutoScriptXray-ssh/main/menu/menu-set.sh"
wget -q -O /usr/bin/menu-domain "https://raw.githubusercontent.com/arismaramar/AutoScriptXray-ssh/main/menu/menu-domain.sh"
wget -q -O /usr/bin/add-host "https://raw.githubusercontent.com/arismaramar/AutoScriptXray-ssh/main/ssh/add-host.sh"
wget -q -O /usr/bin/port-change "https://raw.githubusercontent.com/arismaramar/AutoScriptXray-ssh/main/port/port-change.sh"
wget -q -O /usr/bin/certv2ray "https://raw.githubusercontent.com/arismaramar/AutoScriptXray-ssh/main/xray/certv2ray.sh"
wget -q -O /usr/bin/menu-webmin "https://raw.githubusercontent.com/arismaramar/AutoScriptXray-ssh/main/menu/menu-webmin.sh"
wget -q -O /usr/bin/speedtest "https://raw.githubusercontent.com/arismaramar/AutoScriptXray-ssh/main/ssh/speedtest_cli.py"
wget -q -O /usr/bin/about "https://raw.githubusercontent.com/arismaramar/AutoScriptXray-ssh/main/menu/about.sh"
wget -q -O /usr/bin/auto-reboot "https://raw.githubusercontent.com/arismaramar/AutoScriptXray-ssh/main/menu/auto-reboot.sh"
wget -q -O /usr/bin/restart "https://raw.githubusercontent.com/arismaramar/AutoScriptXray-ssh/main/menu/restart.sh"
wget -q -O /usr/bin/bw "https://raw.githubusercontent.com/arismaramar/AutoScriptXray-ssh/main/menu/bw.sh"
wget -q -O /usr/bin/genssl "https://raw.githubusercontent.com/arismaramar/AutoScriptXray-ssh/main/ssh/genssl.sh"
wget -q -O /usr/bin/menu-backup "https://raw.githubusercontent.com/arismaramar/AutoScriptXray-ssh/main/backup/menu-backup.sh"
cd
echo -e "$BG[INFO]$NC $CYAN Proses Update Selesai$NC"
echo -e "Kembali ke menu dalam 5 Detik"
sleep 5
menu
