#!/usr/bin/env bash
#
# This script assumes that we have Sublist3r, subfinder and assetfinder in our PATH, if not - add these before running it!
#

# Cause every bash script needs a banner :D
banner() {
    echo -en "\033[31m"
	
	cat << "EOF"

	 ▄▀▀▀▀▄  ▄▀▀▄ ▄▀▀▄  ▄▀▀█▄▄   ▄▀▀▄ ▄▀▀▄  ▄▀▀█▄▄▄▄  ▄▀▀▄ ▀▄  ▄▀▀▀▀▄   ▄▀▀▄ ▄▀▄ 
	█ █   ▐ █   █    █ ▐ ▄▀   █ █   █    █ ▐  ▄▀   ▐ █  █ █ █ █      █ █  █ ▀  █ 
	   ▀▄   ▐  █    █    █▄▄▄▀  ▐  █    █    █▄▄▄▄▄  ▐  █  ▀█ █      █ ▐  █    █ 
	▀▄   █    █    █     █   █     █   ▄▀    █    ▌    █   █  ▀▄    ▄▀   █    █  
	 █▀▀▀      ▀▄▄▄▄▀   ▄▀▄▄▄▀      ▀▄▀     ▄▀▄▄▄▄   ▄▀   █     ▀▀▀▀   ▄▀   ▄▀   
	 ▐                 █    ▐               █    ▐   █    ▐            █    █    
	                   ▐                    ▐        ▐                 ▐    ▐    

	# By 2RS3C (https://twitter.com/2RS3C)
EOF

	echo -en "\033[0m"
}

enum_subdomains() {
	domain=$1
	
	# Init our domains-tmp.txt file
	echo "" > domains-tmp.txt

	echo $domain | subfinder -silent >> domains-tmp.txt
	echo $domain | assetfinder -subs-only >> domains-tmp.txt
	sublist3r -d $domain -o "sublist3r-domains.txt" >> /dev/null 2>&1
	cat sublist3r-domains.txt >> domains-tmp.txt

	cat domains-tmp.txt | sort -u > ${domain}-domains.txt

	domains_count=`cat ${domain}-domains.txt | wc -l`

	echo "[+] Domains were saved to ${domain}-domains.txt"
	echo "[+] Found ${domains_count} in total."
}

banner

while read line
do
  enum_subdomains $line
done < "${1:-/dev/stdin}"
