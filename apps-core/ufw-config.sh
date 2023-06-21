#!/bin/bash

sudo ufw allow 1716
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow http
sudo ufw allow https
sudo ufw allow from 192.168.0.1 to any port 80
sudo ufw limit proto tcp from 192.168.0.1 to any port 443

sudo ufw status verbose
