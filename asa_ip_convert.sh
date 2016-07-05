#!/bin/bash

while read i ; do 

	if [[ -n $(echo $i | grep '/') ]] ; then 
		
		echo $(echo $i | cut -d / -f -1) $(ipcalc $i | grep Netmask | awk '{ print $2 }') ; 

	else 

		echo $i ; 

	fi

done < $1
