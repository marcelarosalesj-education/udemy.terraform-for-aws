#!/bin/bash
sudo yum update
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
echo "<h1>Hello from terraform - by marj (challenge 3)</h1>" | sudo tee /var/www/html/index.html