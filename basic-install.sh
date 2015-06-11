#!/bin/bash
# Pi-hole automated install
# (Raspberry Pi) Ad-blocker
#
# curl -s "https://raw.githubusercontent.com/pew/pi-hole/master/automated%20install/basic-install.sh" | bash
#
# Or run the commands below in order

echo "Installing DNS..."
apt-get -y install dnsutils dnsmasq

echo "Stopping services to modify them..."
service dnsmasq stop

echo "Backing up original config files and downloading Pi-hole ones..."
mv /etc/dnsmasq.conf{,.orig}
curl -so /etc/dnsmasq.conf "https://raw.githubusercontent.com/pew/pi-hole/master/dnsmasq.conf"

echo "Turning services back on..."
service dnsmasq start

echo "Locating the Pi-hole..."
curl -so /usr/local/bin/gravity.sh "https://raw.githubusercontent.com/pew/pi-hole/master/gravity-adv.sh"
chmod 755 /usr/local/bin/gravity.sh
echo "Entering the event horizon..."
/usr/local/bin/gravity.sh

echo "Restarting services..."
service dnsmasq restart
