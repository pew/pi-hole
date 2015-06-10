#!/bin/bash
# Pi-hole automated install
# Raspberry Pi Ad-blocker
#
# Install with this command (from the Pi):
#
# curl -s "https://raw.githubusercontent.com/jacobsalmela/pi-hole/master/automated%20install/basic-install.sh" | bash
#
# Or run the commands below in order

clear
echo "  _____ _        _           _      "
echo " |  __ (_)      | |         | |     "
echo " | |__) |   __  | |__   ___ | | ___ "
echo " |  ___/ | |__| | '_ \ / _ \| |/ _ \ "
echo " | |   | |      | | | | (_) | |  __/ "
echo " |_|   |_|      |_| |_|\___/|_|\___| "
echo "                                    "
echo "      Raspberry Pi Ad-blocker       "
echo "									  "
echo "         Automated install          "
echo "			 --Advanced-- 			  "
echo "									  "
echo "									  "
sleep 2

echo "Updating the Pi..."
sudo apt-get update
sudo apt-get -y upgrade

echo "Installing DNS..."
sudo apt-get -y install dnsutils dnsmasq

echo "Stopping services to modify them..."
sudo service dnsmasq stop

echo "Backing up original config files and downloading Pi-hole ones..."
sudo mv /etc/dnsmasq.conf /etc/dnsmasq.conf.orig
sudo curl -o /etc/dnsmasq.conf "https://raw.githubusercontent.com/jacobsalmela/pi-hole/master/advanced/dnsmasq.conf"
sudo mkdir /var/www/pihole
sudo curl -o /var/www/pihole/index.html "https://raw.githubusercontent.com/jacobsalmela/pi-hole/master/index.html"

echo "Turning services back on..."
sudo service dnsmasq start

echo "Locating the Pi-hole..."
sudo curl -o /usr/local/bin/gravity.sh "https://raw.githubusercontent.com/jacobsalmela/pi-hole/master/gravity-adv.sh"
sudo chmod 755 /usr/local/bin/gravity.sh
echo "Entering the event horizon..."
sudo /usr/local/bin/gravity.sh

echo "Restarting services..."
sudo service dnsmasq restart
