#!/bin/bash
sudo apt-get update
sudo apt-get install -y apache2
sudo chown -R ubuntu:ubtunu /var/www/html/
sudo touch /var/www/html/healthcheck.html
sudo echo "<h1 align=center> Hostname : $(uname -n) $date </h1>" >/var/www/html/index.html