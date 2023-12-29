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
wget -q -O /usr/bin/mbot "https://github.com/arismaramar/AutoScriptXray-ssh/main/menu/mbot.sh"
wget -q -O /usr/bin/menu "https://github.com/arismaramar/AutoScriptXray-ssh/main/menu/menu.sh"
wget -q -O /usr/bin/menu-vmess "https://github.com/arismaramar/AutoScriptXray-ssh/main/menu/menu-vmess.sh"
wget -q -O /usr/bin/menu-vless "https://github.com/arismaramar/AutoScriptXray-ssh/main/menu/menu-vless.sh"
wget -q -O /usr/bin/running "https://github.com/arismaramar/AutoScriptXray-ssh/main/menu/running.sh"
wget -q -O /usr/bin/clearcache "https://github.com/arismaramar/AutoScriptXray-ssh/main/menu/clearcache.sh"
wget -q -O /usr/bin/menu-trgo "https://github.com/arismaramar/AutoScriptXray-ssh/main/menu/menu-trgo.sh"
wget -q -O /usr/bin/menu-trojan "https://github.com/arismaramar/AutoScriptXray-ssh/main/menu/menu-trojan.sh"
wget -q -O /usr/bin/menu-trial "https://github.com/arismaramar/AutoScriptXray-ssh/main/menu/menu-trial.sh"
wget -q -O /usr/bin/menu-ssh "https://github.com/arismaramar/AutoScriptXray-ssh/main/menu/menu-ssh.sh"
wget -q -O /usr/bin/usernew "https://github.com/arismaramar/AutoScriptXray-ssh/main/ssh/usernew.sh"
wget -q -O /usr/bin/trial "https://github.com/arismaramar/AutoScriptXray-ssh/main/ssh/trial.sh"
wget -q -O /usr/bin/renew "https://github.com/arismaramar/AutoScriptXray-ssh/main/ssh/renew.sh"
wget -q -O /usr/bin/hapus "https://github.com/arismaramar/AutoScriptXray-ssh/main/ssh/hapus.sh"
wget -q -O /usr/bin/cek "https://github.com/arismaramar/AutoScriptXray-ssh/main/ssh/cek.sh"
wget -q -O /usr/bin/member "https://github.com/arismaramar/AutoScriptXray-ssh/main/ssh/member.sh"
wget -q -O /usr/bin/delete "https://github.com/arismaramar/AutoScriptXray-ssh/main/ssh/delete.sh"
wget -q -O /usr/bin/autokill "https://github.com/arismaramar/AutoScriptXray-ssh/main/ssh/autokill.sh"
wget -q -O /usr/bin/ceklim "https://github.com/arismaramar/AutoScriptXray-ssh/main/ssh/ceklim.sh"
wget -q -O /usr/bin/tendang "https://github.com/arismaramar/AutoScriptXray-ssh/main/ssh/tendang.sh"
wget -q -O /usr/bin/user-lock "https://github.com/arismaramar/AutoScriptXray-ssh/main/ssh/user-lock.sh"
wget -q -O /usr/bin/user-unlock "https://github.com/arismaramar/AutoScriptXray-ssh/main/ssh/user-unlock.sh"
wget -q -O /usr/bin/add-ws "https://github.com/arismaramar/AutoScriptXray-ssh/main/xray/add-ws.sh"
wget -q -O /usr/bin/trialvmess "https://github.com/arismaramar/AutoScriptXray-ssh/main/xray/trialvmess.sh"
wget -q -O /usr/bin/renew-ws "https://github.com/arismaramar/AutoScriptXray-ssh/main/xray/renew-ws.sh"
wget -q -O /usr/bin/del-ws "https://github.com/arismaramar/AutoScriptXray-ssh/main/xray/del-ws.sh"
wget -q -O /usr/bin/cek-ws "https://github.com/arismaramar/AutoScriptXray-ssh/main/xray/cek-ws.sh"
wget -q -O /usr/bin/add-vless "https://github.com/arismaramar/AutoScriptXray-ssh/main/xray/add-vless.sh"
wget -q -O /usr/bin/trialvless "https://github.com/arismaramar/AutoScriptXray-ssh/main/xray/trialvless.sh"
wget -q -O /usr/bin/renew-vless "https://github.com/arismaramar/AutoScriptXray-ssh/main/xray/renew-vless.sh"
wget -q -O /usr/bin/del-vless "https://github.com/arismaramar/AutoScriptXray-ssh/main/xray/del-vless.sh"
wget -q -O /usr/bin/cek-vless "https://github.com/arismaramar/AutoScriptXray-ssh/main/xray/cek-vless.sh"
wget -q -O /usr/bin/add-tr "https://github.com/arismaramar/AutoScriptXray-ssh/main/xray/add-tr.sh"
wget -q -O /usr/bin/trialtrojan "https://github.com/arismaramar/AutoScriptXray-ssh/main/xray/trialtrojan.sh"
wget -q -O /usr/bin/del-tr "https://github.com/arismaramar/AutoScriptXray-ssh/main/xray/del-tr.sh"
wget -q -O /usr/bin/renew-tr "https://github.com/arismaramar/AutoScriptXray-ssh/main/xray/renew-tr.sh"
wget -q -O /usr/bin/cek-tr "https://github.com/arismaramar/AutoScriptXray-ssh/main/xray/cek-tr.sh"
wget -q -O /usr/bin/menu-set "https://github.com/arismaramar/AutoScriptXray-ssh/main/menu/menu-set.sh"
wget -q -O /usr/bin/menu-domain "https://github.com/arismaramar/AutoScriptXray-ssh/main/menu/menu-domain.sh"
wget -q -O /usr/bin/add-host "https://github.com/arismaramar/AutoScriptXray-ssh/main/ssh/add-host.sh"
wget -q -O /usr/bin/port-change "https://github.com/arismaramar/AutoScriptXray-ssh/main/port/port-change.sh"
wget -q -O /usr/bin/certv2ray "https://github.com/arismaramar/AutoScriptXray-ssh/main/xray/certv2ray.sh"
wget -q -O /usr/bin/menu-webmin "https://github.com/arismaramar/AutoScriptXray-ssh/main/menu/menu-webmin.sh"
wget -q -O /usr/bin/speedtest "https://github.com/arismaramar/AutoScriptXray-ssh/main/ssh/speedtest_cli.py"
wget -q -O /usr/bin/about "https://github.com/arismaramar/AutoScriptXray-ssh/main/menu/about.sh"
wget -q -O /usr/bin/auto-reboot "https://github.com/arismaramar/AutoScriptXray-ssh/main/menu/auto-reboot.sh"
wget -q -O /usr/bin/restart "https://github.com/arismaramar/AutoScriptXray-ssh/main/menu/restart.sh"
wget -q -O /usr/bin/bw "https://github.com/arismaramar/AutoScriptXray-ssh/main/menu/bw.sh"
wget -q -O /usr/bin/genssl "https://github.com/arismaramar/AutoScriptXray-ssh/main/ssh/genssl.sh"
wget -q -O /usr/bin/menu-backup "https://github.com/arismaramar/AutoScriptXray-ssh/main/backup/menu-backup.sh"
cd
echo -e "$BG[INFO]$NC $CYAN Proses Update Selesai$NC"
echo -e "Kembali ke menu dalam 5 Detik"
sleep 5
menu
