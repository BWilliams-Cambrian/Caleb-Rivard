#!/bin/bash



# Mkdir with "-p" flag will only create the directory if it already has not been created.
# This means it will not overrite data, or any permissions already set.
mkdir -p ~/EmployeeData
mkdir -p ~/EmployeeData/HR
mkdir -p ~/EmployeeData/IT
mkdir -p ~/EmployeeData/Finance
mkdir -p ~/EmployeeData/Executive
mkdir -p ~/EmployeeData/Administrative
mkdir -p ~/EmployeeData/Call\ Centre

echo "7 Directories have been created if not created already."


# Changing permissions
chmod 764 ~/EmployeeData/IT
chmod 764 ~/EmployeeData/Finance
chmod 764 ~/EmployeeData/Administrative
chmod 764 ~/EmployeeData/Call\ Centre

chmod 760 ~/EmployeeData/Executive
chmod 760 ~/EmployeeData/HR

printf "\nPermissions have been set on 7 directories...\n"


# Changing ownership
sudo chown -R root:IT ~/EmployeeData/IT
sudo chown -R root:Finance ~/EmployeeData/Finance
sudo chown -R root:Administrative ~/EmployeeData/Administrative
sudo chown -R root:CallCentre ~/EmployeeData/Call\ Centre
sudo chown -R root:Executive ~/EmployeeData/Executive
sudo chown -R root:HR ~/EmployeeData/HR

printf "\nOwnership changed on 7 directories...\n"

printf "Operation output:\n\n"

ls -ld ~/EmployeeData/IT
ls -ld ~/EmployeeData/Finance
ls -ld ~/EmployeeData/Administrative
ls -ld ~/EmployeeData/Call\ Centre
ls -ld ~/EmployeeData/Executive
ls -ld ~/EmployeeData/HR
