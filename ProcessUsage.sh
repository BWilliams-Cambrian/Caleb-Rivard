#!/bin/bash

mainMenu() {
	clear
	echo "---------------------------------"
	echo "TOP 5 ACTIVE PROCESSES"
	echo "---------------------------------"
	ps -Ao pid,pcpu,user,start --sort=-pcpu | head -n 6


	printf "\nShown above, is the top five processes sorted by CPU usage.\nPlease type the PID to select the process.\nCTRL+C to exit. "
	printf "\n\nPID: "
	pidselect
}

pidselect() {
	read input
	selectedpid=$input
	clear



	printf "\nSelected PID #$selectedpid.\n"
	printf "More Information About PID $selectedpid:\n"
	ps ww $selectedpid

	printf "\nWould you like to terminate the process? (y/n): "

	read input

	if [ $input == "y" ]; then
		
		echo "ps ww $selectedpid --- HAS BEEN TERMINATED [$(date +"%T")]" >> "ProcessUsageReport - $(date).txt"
		
		
		kill $selectedpid
		printf "\nPID $selectedpid has been terminated. Returning to main menu..."
		sleep 3
		mainMenu
	else
		printf "\nOperation canceled. Returning to main menu..."
		sleep 3
		mainMenu
	fi
}


mainMenu
