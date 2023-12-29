#!/bin/bash
run_data() {
data=$(xray api statsquery --server=127.0.0.1:10003 | grep -C 2 $user | sed /"}"/d | sed /"{"/d | grep value | awk '{print $2}' | sed 's/,//g; s/"//g' | sort)
inb=$(echo "$data" | sed -n 1p)
outb=$(echo "$data" | sed -n 2p) 
vbaru=$(echo -e "$[ $inb + $outb ]")
}

run_file() {
cekfile=$(cat /etc/Anggun/vless/$user | wc -l)    
if [[ $cekfile -gt 0 ]]; then
echo > /dev/null
else
echo -e "0" > /etc/Anggun/vless/$user            
fi
cekfile1=$(cat /etc/Anggun/cache/vless-ws/$user | wc -l)
if [[ $cekfile1 -gt 0 ]]; then
echo > /dev/null
else
echo "0" > /etc/Anggun/cache/vless-ws/$user
fi
}    
    
run_sesi1() {
vbaru=$(echo -e "$[ $inb + $outb ]")        
vlama=$(cat /etc/Anggun/cache/vless-ws/$user)
vtotal=$(cat /etc/Anggun/vless/$user)        
if [[ $vbaru -gt $vlama ]]; then
vvar=$(echo -e "$[ $vbaru - $vlama ]" | sed "s/-//g")
echo -e "$[ $vvar + $vtotal ]" > /etc/Anggun/vless/$user
else
echo -e "$[ $vbaru + $vtotal ]" > /etc/Anggun/vless/$user
fi
}

run_inti() {
run_data
run_file   
vbaru=$(echo -e "$[ $inb + $outb ]")        
vlama=$(cat /etc/Anggun/cache/vless-ws/$user)          
if [ $vlama = $vbaru ]; then        
echo > /dev/null 
else
run_sesi1
fi                
echo "$vbaru" > /etc/Anggun/cache/vless-ws/$user
}

dataku=( `xray api statsquery --server=127.0.0.1:10003 | grep user | cut -d ">" -f 4 | sort | uniq`)
for user in "${dataku[@]}"
do
data1=$(echo "$data" | wc -c)
if [[ $data1 -gt 0 ]]; then
run_inti
else
echo > /dev/null
fi
sleep 0.1
done