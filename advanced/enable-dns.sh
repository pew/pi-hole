# !/bin/bash
# Download the ad list
/usr/local/bin/gravity.sh

# Enable DNS and start blocking ads
mv /etc/dnsmasq.conf /etc/dnsmasq.conf.orig
mv /etc/dnsmasq.conf.pihole /etc/dnsmasq.conf
service dnsmasq start
