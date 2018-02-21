#!/bin/bash 

if [ "$EUID" -ne 0 ]
then
	echo "please root needed"
	exit 1
fi
echo "Begin update of system"
echo "first apt-get update"
apt-get update -y > /var/log/apt/maj-update.log
echo "apt-get update done"
echo "begin apt-get upgrade"
apt-get upgrade -y > /var/log/apt/maj-upgrade.log
echo "apt-get upgrade done"
echo -e "you can see log at\n/var/log/apt/maj-update.log for update one"
echo -e "or at\n/var/log/maj-upgrade.log for upgrade one"
echo -e "\n\tupdate of system done"
