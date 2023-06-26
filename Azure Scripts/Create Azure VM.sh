#!/bin/bash

#This script creates a new Azure VM with your specified configurations

read -p "Enter the name of the VM you want to create: " vm_name
read -p "Enter the image of the VM (default: Canonical:UbuntuServer:18.04-LTS:latest): " vm_image
vm_image=${vm_image:-Canonical:UbuntuServer:18.04-LTS:latest}
read -p "Enter the size of the VM (default: Standard_B2s): " vm_size
vm_size=${vm_size:-Standard_B2s}

echo "Creating VM..."
az vm create --resource-group $resource_group --name $vm_name --image $vm_image --size $vm_size --generate-ssh-keys
