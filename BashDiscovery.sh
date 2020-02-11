#!/bin/bash

#For colorizing or organizing output
RED='\033[0;31m'
NC='\033[0m'
Line="***********************************************************************"
#Find subdomains with Sublist3r
while read domain; do
        echo -e "${NC} $Line"
        echo "Domain whois lookup information:"
        echo "$Line"
        whois -H $domain
        echo "$Line"
        echo "$Line"
        echo "Passively scraping search engines for subdomains of $domain ..."
        echo "$Line"
        subdomSearch=$(./Sublist3r/sublist3r.py -o $2 -d $domain | grep -i $domain)
echo "$Line"
echo "Now actively pinging discovered subdomains to grab their IP..."
echo "$Line"
        while read outFile; do
                IP=$(ping -c 1 -n $outFile 2> /dev/null | grep -i from | awk '{print $4}')
                if [[ $IP =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\:$ ]]; then
                        cleanIP=${IP%\:};
                        echo -e "${RED}[+] $outFile = $cleanIP"
                else
                        echo -e "${NC}[-] $outFile did not respond to ping"
                fi
        done <$2
done <$1
