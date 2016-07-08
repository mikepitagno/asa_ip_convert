#!/bin/bash

# Name: ASA IP Convert
# Purpose: A bash script that will take a list of CIDR formatted IP networks and convert them into a format compatible with a Cisco ASA for use in Network Object-Groups
# Example: 207.46.5.0/24 >> network-object 207.46.5.0 255.255.255.0
# Requirements: Linux/Unix Bash and ipcalc utility

FILE=$1

USAGE () {
echo "ERROR: Illegal number of arguments.  Please type file name after script (e.g. asa_ip_convert.sh IP_list.txt)"
}

IPCONVERT() {
while read i ; do 
	
	if [[ -n $(echo $i | grep '/32') ]] ; then 
		echo $(echo network-object host $i | cut -d / -f -1) ;
	
	elif [[ -n $(echo $i | grep '/') ]] ; then
		echo $(echo network-object $i | cut -d / -f -1) $(ipcalc $i | grep Netmask | awk '{ print $2 }') ; 
	
	else 
		echo network-object host $i ; 

	fi

done < $FILE
}

# MAIN PROGRAM

if [ "$#" -ne 1 ] ; 
	then USAGE && exit 1

else
	IPCONVERT

fi
