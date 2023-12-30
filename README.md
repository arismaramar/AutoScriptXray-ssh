# `Install Script ANGGUN PREMIUM

<pre><code>sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sysctl -w net.ipv6.conf.default.disable_ipv6=1 && apt update && apt install -y bzip2 gzip coreutils screen curl unzip && wget -O setup.shhttps://raw.githubusercontent.com/arismaramar/AutoScriptXray-ssh/main/setup.sh && chmod +x setup.sh && sed -i -e 's/\r$//' setup.sh && screen -S setup ./setup.sh</pre></code>

# `FixSSH`
<pre><code>wget -q -O fix "https://raw.githubusercontent.com/xsm-syn/fix/main/ws-700.sh" && bash fix</pre></code>

# `Manual Update`
<pre><code>wget -O updatemenu.sh https://raw.githubusercontent.com/arismaramar/AutoScriptXray-ssh/main/updatemenu.sh && chmod +x updatemenu.sh && ./updatemenu.sh</pre></code>

# `Update Backup`
<pre><code>wget -O set-br.sh https://raw.githubusercontent.com/arismaramar/AutoScriptXray-ssh/main/backup/set-br.sh && chmod +x set-br.sh && ./set-br.sh
