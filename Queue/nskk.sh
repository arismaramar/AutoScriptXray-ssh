#!/bin/bash
now=$(cat /root/.masa)
if [ $now = exp ]; then
#expired stopped
systemctl stop trojan-tcp
systemctl stop ntls
else
echo > /dev/null
fi