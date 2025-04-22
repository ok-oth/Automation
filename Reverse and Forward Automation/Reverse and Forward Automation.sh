#!/bin/bash

# Install packages 
apt update 
apt install bind9 bind9utils -y

#Configure forwarders. These are upstream local DNS servers where this server will send requests for domains it is not authoritative for. 
#cd /etc/bind 
#nano /etc/bind/named.conf.options
# Copy template file
cp templates/etc/bind/named.conf.options /etc/bind/named.conf.options

# Add a zone for your domain  
# nano /etc/bind/named.conf.default-zones
cp templates/etc/bind/named.conf.default-zones /etc/bind/named.conf.default-zones

# Create a zone file for the domain
# cp /etc/bind/db.local /etc/bind/db.ball.cns 
# nano /etc/bind/db.ball.cns 
cp templates/etc/bind/db.ball.cns /etc/bind/db.ball.cns

# Verify Setup
named-checkconf
named-checkzone ball.cns /etc/bind/db.ball.cns

# Reload DNS server configuration 
systemctl reload bind9