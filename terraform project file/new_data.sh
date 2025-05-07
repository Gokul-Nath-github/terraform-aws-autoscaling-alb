#!/bin/bash
sudo apt-get update -y
sudo apt-get install -y apache2
sudo systemctl enable --now apache2
echo "<h1>Host: $(hostname)</h1>" | sudo tee /var/www/html/index.html > /dev/null
