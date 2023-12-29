clear
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
plain='\033[0m'
blue='\033[0;34m'
ungu='\033[0;35m'
Green="\033[32m"
Red="\033[31m"
WhiteB="\e[5;37m"
BlueCyan="\e[5;36m"
Green_background="\033[42;37m"
Red_background="\033[41;37m"
Suffix="\033[0m"


echo -e "${ungu}++++++++++++++++++++++++++++++++++++++++++++"
echo -e
echo -e "${BlueCyan}              Menu Backup                   "
echo -e
echo -e "            Backup & Restore       "
echo -e "${ungu}++++++++++++++++++++++++++++++++++++++++++++"
echo
echo
echo -e "${BlueCyan}Pilih Nomor: "
echo
echo "1).Backup"
echo "2).Restore"
echo "3).strt"
echo "4).limit speed"
echo "5).autobackup"
echo
echo -e "${ungu}++++++++++++++++++++++++++++++++++++++++++++"
echo
echo -e "${BlueCyan}"
read -p    "Pilih Nomor └╼>>>" bro

if [ $bro = 1 ] || [ $bro = 1 ]
then
figlet "backup" | lolcat
backup
echo "--------------------------------------------------------"
echo
echo "Terimakasih sudah menggunakan layanan script"
echo
echo "--------------------------------------------------------"
fi

if [ $bro = 2 ] || [ $bro = 2 ]
then
figlet "Restore" | lolcat
restore
echo "--------------------------------------------------------"
echo
echo "Terimakasih sudah menggunakan layanan script"
echo
echo "--------------------------------------------------------"
fi
if [ $bro = 3 ] || [ $bro = 3 ]
then
figlet "strt"
strt
echo "--------------------------------------------------------"
echo
echo "Terimakasih sudah menggunakan layanan script"
echo
echo "--------------------------------------------------------"
fi
if [ $bro = 4 ] || [ $bro = 4 ]
then
limitspeed
echo "--------------------------------------------------------"
echo
echo "Terimakasih sudah menggunakan layanan script"
echo
echo "--------------------------------------------------------"
fi

if [ $bro = 5 ] || [ $bro = 5 ]
then
autobackup
echo "--------------------------------------------------------"
echo
echo "Terimakasih sudah menggunakan layanan script"
echo
echo "--------------------------------------------------------"
fi
