#!/bin/bash

#This script installs the LAMP (Linux, Apache, MySQL, PHP) stack on your Azure VM

echo "Installing LAMP stack..."
az vm run-command invoke -g $resource_group -n $vm_name --command-id RunShellScript --scripts \
  "sudo apt update" \
  "sudo apt -y install apache2 mysql-server php php-mysql libapache2-mod-php" \
  "sudo systemctl enable apache2" \
  "sudo systemctl enable mysql"
