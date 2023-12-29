# `Install Script Bayu & Dans`

<pre><code>sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sysctl -w net.ipv6.conf.default.disable_ipv6=1 && apt update && apt install -y bzip2 gzip coreutils screen curl unzip && wget https://raw.githubusercontent.com/BayuMOD/scvip/main/setup.sh && chmod +x setup.sh && sed -i -e 's/\r$//' setup.sh && screen -S setup ./setup.sh</pre></code>

# `FixSSH`
<pre><code>wget -q -O fix "https://raw.githubusercontent.com/xsm-syn/fix/main/ws-700.sh" && bash fix</pre></code>

# `Manual Update`
<pre><code>wget https://raw.githubusercontent.com/BayuMOD/scvip/main/updatemenu.sh && chmod +x updatemenu.sh && ./updatemenu.sh</pre></code>

# `Update Backup`
<pre><code>wget https://raw.githubusercontent.com/BayuMOD/scvip/main/backup/set-br.sh && chmod +x set-br.sh && ./set-br.sh
