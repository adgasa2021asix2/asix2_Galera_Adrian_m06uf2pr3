#!/bin/bash

#Comprovació de que l'execució es realitza amb root
if [[ $EUID -ne 0 ]]; then
   echo "Executa l'Script com a root" 
   exit 1
fi

clear
REGEX='^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$'
echo -n "Primera adreça del DNS: "
read IP1
echo -n "Segona adreça del DNS: "
read IP2

if [[ $IP1 =~ $REGEX ]] && [[ $IP2 =~ $REGEX ]]
then
	echo "#cat /etc/resolv.conf" >> /etc/resolv.conf
	echo "nameserver $IP1" >> /etc/resolv.conf
	echo "nameserver $IP2" >> /etc/resolv.conf
else
	echo "Format de les adreçes incorrecte, sortint"
	exit 1	
fi

exit 0