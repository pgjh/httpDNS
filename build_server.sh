#!/bin/bash
while true
do
    read -p "please input httpdns server port number: " server_port
    [[ $server_port -le 65535 && $server_port -gt 0 ]] && break
    echo "please input port number 1-65535"
done
read -p "please input upper ip(default is 114.114.114.114): " upperip

cd
yum -y update && PM=yum || apt-get -y update && PM=apt-get
$PM -y install gcc curl psmisc
curl -O -k https://raw.githubusercontent.com/mmmdbybyd/httpDNS/master/http-dns-server.c || \
exec echo -e "\033[41;37mdownload source code failed.\033[0m"
gcc -o httpdns -O3 http-dns-server.c || exec echo "\033[41;37mcompiled failed.\033[0m"
strip httpdns
rm -f http-dns-server.c
./httpdns -l $server_port -u ${upperip:=114.114.114.114} &>/dev/null || \
exec echo "\033[41;37mhttpdns is stoped\033[0m"
echo -e "\033[34mhttpdns is running.\033[0m\n"
