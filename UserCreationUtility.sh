#!/bin/bash

INPUT=EmployeeNames.csv
OLDIFS=$IFS
IFS=','
[ ! -f $INPUT ] && { echo "$INPUT ERROR: File is not found."; exit 99; }
while read FirstName LastName Department
do	
	# Will ensure first row of csv is not added.
	if [ $Department != "Department" ]; then
	
		# Check if group exists...
		if [ $(getent group $Department) ]; then
			echo "Group Exists... Skipping $Department..."
		else
			groupadd -f '$Department'
		fi
	fi
	
	firstNameInitial=${FirstName:0:1}
	lastNameChars=${LastName:0:8}
	uName=$firstNameInitial$lastNameChars

	# Will ensure first row of csv is not added.
	if [ uName != "FLastName" ]; then
		
		# Check if user already exists...
		if [ id "$uName" >/dev/null 2>&1 ]; then
			echo "User exists... Skipping $uName..."
		else
		
			useradd "$uName"
			usermod -a -G '$uName' '$Department'
			echo "Added $uName to $Department"
		fi	
	fi
	
done < $INPUT
IFS=$OLDIFS
