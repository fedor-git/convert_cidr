#!/bin/bash

# Add addresses here:
IN_ADDRESS="
192.168.1.0/24
192.168.33.0/22
8.8.8.8/32
"

cidr2mask() {
	local i mask=""
	local full_octets=$(($1/8))
	local partial_octet=$(($1%8))

	for ((i=0;i<4;i+=1)); do
		if [ $i -lt $full_octets ]; then
			mask+=255
		elif [ $i -eq $full_octets ]; then
			mask+=$((256 - 2**(8-$partial_octet)))
		else
			mask+=0
		fi  
		test $i -lt 3 && mask+=.
	done

	echo $mask
}

for i in $IN_ADDRESS
do
	ipmask=$(echo $i | tr "/" "\n")
	vars=( $ipmask )
	echo 'push "route '${vars[0]}' '$(cidr2mask ${vars[1]})' 192.168.207.254"'
done