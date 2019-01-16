#!/bin/bash
# fix Docker dns issue for spark driver
myip=`ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'`
sp=' '
rs=$myip$sp$DNS_LABEL
cp /etc/hosts ~/hosts.new
sed -i -e '1 s/^/'"$rs"'\n/' ~/hosts.new
cp -f ~/hosts.new /etc/hosts
# continue with spark
chmod +x /master.sh
/master.sh
