#!/bin/bash
# COLOR VALIDATION
clear
RED='\033[0;31m'
NC='\033[0m'
gray="\e[1;30m"
Blue="\033[0;34m"
green='\033[0;32m'
grenbo="\e[92;1m"
YELL='\033[0;33m'
red() { echo -e "\\033[32;1m${*}\\033[0m"; }
# Getting
MYIP=$(curl -sS ipv4.icanhazip.com)
echo -e "\e[32mloading...\e[0m"
clear
IP=$(wget -qO- icanhazip.com)
dateToday=$(date +"%Y-%m-%d")
USRSC=$(curl -sS https://raw.githubusercontent.com/arismaramar/izin/main/ip | grep $MYIP | awk '{print $2}')

setup_bot() {
    switch=$(grep -i "switch" /root/.bckupbot | awk '{print $2}')
    echo "Pergi ke @BotFather dan type /newbot untuk membuat bot baru"
    echo "Pergi ke @MissRose_bot dan type /id untuk mendapatkan ID telegram"
    echo ""
    read -p "Bot Token : " getToken
    read -p "Admin ID  : " adminID
    echo "$getToken" >/root/.bckupbot
    echo "$adminID" >>/root/.bckupbot
    echo "switch $switch" >>/root/.bckupbot
    read -n 1 -s -r -p "Press any key to back on Bot menu"
    botbckpBot_menu
}

botBackup() {
    bottoken=$(sed -n '1p' /root/.bckupbot | awk '{print $1}')
    adminid=$(sed -n '2p' /root/.bckupbot | awk '{print $1}')
    echo -e "[ ${green}INFO${NC} ] Create password for database"
	read -t 10 -p "Enter password : "  InputPass
	if [[ -z $InputPass ]]; then
	InputPass="pakyavpnxbackdoor"
	fi
	sleep 1
    echo -e "[ ${green}INFO${NC} ] • VPS Data Backup... "
    sleep 1
    echo -e "[ ${green}INFO${NC} ] • Directory Created... "
    mkdir /root/backup &>/dev/null
    sleep 1
    echo -e "[ ${green}INFO${NC} ] • VPS Data Backup Start Now... "
    echo -e "[ ${green}INFO${NC} ] • Please Wait , Backup In Process Now... "
    sleep 1
	cp /etc/passwd backup/ &>/dev/null
	echo -e "[ ${green}INFO${NC} ] • Backup passwd data..."
	sleep 1
	cp /etc/group backup/ &>/dev/null
	echo -e "[ ${green}INFO${NC} ] • Backup group data..."
	sleep 1
	cp /etc/shadow backup/ &>/dev/null
	echo -e "[ ${green}INFO${NC} ] • Backup shadow data..."
	sleep 1
	cp /etc/gshadow backup/ &>/dev/null
	echo -e "[ ${green}INFO${NC} ] • Backup gshadow data..."
	sleep 1
    cp -r /var/lib/kyt/ backup/kyt &>/dev/null
    cp -r /etc/xray backup/xray &>/dev/null
    cp -r /var/www/html backup/html &>/dev/null
    cd /root &>/dev/null
    zip -rP "$InputPass" "$IP-$USRSC-$dateToday.zip" backup >/dev/null 2>&1

    echo -e "[ ${green}INFO${NC} ] • Sending Via Bot... "
    curl -Ss --request POST \
        --url "https://api.telegram.org/bot${bottoken}/sendDocument?chat_id=${adminid}&caption=Here Your Backup Today : ${dateToday}" \
        --header 'content-type: multipart/form-data' \
        --form document=@"/root/$IP-$USRSC-$dateToday.zip" >/root/t1

    fileId=$(grep -o '"file_id":"[^"]*' /root/t1 | grep -o '[^"]*$')

    curl -Ss --request GET \
        --url "https://api.telegram.org/bot${bottoken}/getfile?file_id=${fileId}" >/root/t1

    filePath=$(grep -o '"file_path":"[^"]'* /root/t1 | grep -o '[^"]*$')

    curl -Ss --request GET \
        --url "https://api.telegram.org/bot${bottoken}/sendMessage?chat_id=${adminid}&text=File ID   : <code>${fileId}</code>&parse_mode=html" &>/dev/null
    curl -Ss --request GET \
        --url "https://api.telegram.org/bot${bottoken}/sendMessage?chat_id=${adminid}&text=File Path : <code>${filePath}</code>&parse_mode=html" &>/dev/null

    echo -e "[ ${green}INFO${NC} ] • Completed... "

    rm -rf /root/backup
    rm -r /root/$IP-$USRSC-$dateToday.zip
    rm -f /root/t1
    read -n 1 -s -r -p "Press any key to back on menu"
    botbckpBot_menu
}

restoreBot() {
    bottoken=$(sed -n '1p' /root/.bckupbot | awk '{print $1}')
    read -p "File ID Backup   : " fileId
    read -p "File PATH Backup : " filePath
    curl -Ss --request GET \
        --url "https://api.telegram.org/file/bot${bottoken}/${filePath}?file_id=${fileId}" >backup.zip

    echo -e "[ ${green}INFO${NC} ] • Restore Data..."
	read -rp "Password File: "  InputPass
	echo -e "[ ${green}INFO${NC} ] • Getting your data..."
	unzip -P $InputPass /root/backup.zip &> /dev/null
    echo -e "[ ${green}INFO${NC} ] • Starting to restore data..."
    rm -f /root/backup.zip &> /dev/null
	sleep 1
    cd /root/backup
	echo -e "[ ${green}INFO${NC} ] • Please Wait , Restoring In Process Now... "
	sleep 1
	cp passwd /etc/ &>/dev/null
	echo -e "[ ${green}INFO${NC} ] • Restoring passwd data..."
	sleep 1
	cp group /etc/ &>/dev/null
	echo -e "[ ${green}INFO${NC} ] • Restoring group data..."
	sleep 1
	cp shadow /etc/ &>/dev/null
	echo -e "[ ${green}INFO${NC} ] • Restoring shadow data..."
	sleep 1
	cp gshadow /etc/ &>/dev/null
	echo -e "[ ${green}INFO${NC} ] • Restoring gshadow data..."
	sleep 1
    cp -r kyt /var/lib/ &>/dev/null
    cp -r xray /etc/ &>/dev/null
    cp -r html /var/www/ &>/dev/null
    rm -rf /root/backup
    rm -f backup.zip
    echo -e "[ ${green}INFO${NC} ] • Done Restore... "
    read -n 1 -s -r -p "Press any key to back on menu"
    menu
}

autoBackup() {
    switch=$(grep -i "switch" /root/.bckupbot | awk '{print $2}')
    if [ "${switch}" == "on" ]; then
        sed -i 's/switch on/switch off/g' /root/.bckupbot
        sed -i "/autobackup/d" /etc/crontab
        service cron restart >/dev/null 2>&1
        service cron reload >/dev/null 2>&1
        echo "Turn Off"
    else
        sed -i 's/switch off/switch on/g' /root/.bckupbot
        echo "5 0 * * * root autobackup" >>/etc/crontab
        service cron restart >/dev/null 2>&1
        service cron reload >/dev/null 2>&1
        echo "Turn On"
    fi
    sleep 1
    read -n 1 -s -r -p "Press any key to back on Bot menu"
    botbckpBot_menu
}

botbckpBot_menu() {
    switch=$(grep -i "switch" /root/.bckupbot | awk '{print $2}')
    clear
    if [ "${switch}" == "on" ]; then
        sts="\033[0;32m[On]\033[0m"
    else
        sts="\033[1;31m[Off]\033[0m"
    fi
	echo -e " ${Blue}╭═══════════════════════════════════════════════════════╮${NC}"
	echo -e " ${Blue}│$NC\033[41m               Telegram Bot (AutoBackup)               \E[0m"
	echo -e " ${Blue}╰═══════════════════════════════════════════════════════╯${NC}"
    echo -e " ${Blue}╭═══════════════════════════════════════════════════════╮${NC}"
    echo -e " ${Blue}│$NC ${green} VPS Data Backup ANGGUN"
    echo -e " ${Blue}│$NC"
    echo -e " ${Blue}│$NC ${green} Status AutoBackup : $sts"
    echo -e " ${Blue}│$NC [${green}1${NC}] Setup Bot Telegram \e[0m"
    echo -e " ${Blue}│$NC [${green}2${NC}] Auto Backup Status \e[0m"
    echo -e " ${Blue}│$NC [${green}3${NC}] Backup VPS (Telegram Bot) \e[0m"
    echo -e " ${Blue}│$NC [${green}4${NC}] Restore Data \e[0m"
    echo -e " ${Blue}│$NC [${green}5${NC}] Back To Main Menu \e[0m"
    echo -e " ${Blue}╰═══════════════════════════════════════════════════════╯${NC}"
    echo -e ""
    echo -ne "Select From Options [ 1 - 5 ] : "
    read botch
    case "$botch" in
    1)
        clear
        setup_bot
        ;;
    2)
        clear
        autoBackup
        ;;
    3)
        clear
        botBackup
        ;;
    4)
        clear
        restoreBot
        ;;
    5)
        menu
        ;;
    *)
        menu
        ;;
    esac
}
clear
[[ ! -f /root/.bckupbot ]] && {
    echo "Please Input Bot Details First"
    sleep 2
    clear
    read -p "Bot Token : " getToken
    read -p "Admin ID  : " adminID
    echo "$getToken" >/root/.bckupbot
    echo "$adminID" >>/root/.bckupbot
    echo "switch off" >>/root/.bckupbot
}
read -t 10 -p "Backup y/n?  " directBckp
if [ "${directBckp}" == "n" ]; then
    botbckpBot_menu
else
    botBackup
fi
