#!/bin/bash

#This Bash script is an interactive tool designed to set up a virtual machine (VM) in Microsoft Azure. It provides a menu to the user to perform 
#various operations like installing Azure CLI, logging into Azure, creating a resource group, creating a VM, opening port 80 for web traffic, grabing your public IP and installing the LAMP stack. 

# Initialize the variables
resource_group=""
vm_name=""
vm_image=""
vm_size=""

function install_azure_cli() {
  # Install azure cli
  echo "Installing Azure CLI..."
  curl -sL https://aka.ms/InstallAzureCli | sudo bash
}

function login_azure() {
  # Login 
  echo "Logging in to Azure..."
  az login
}

function create_resource_group() {
  # Ask for the resource group name
  read -p "Enter the name of the resource group you want to create: " resource_group
  # Create Resource Group 
  echo "Creating resource group..."
  az group create --name $resource_group --location eastus2
}

function create_vm() {
  # Ask for the VM name
  read -p "Enter the name of the VM you want to create: " vm_name
  # Ask for the VM image
  read -p "Enter the image of the VM (default: Canonical:UbuntuServer:18.04-LTS:latest): " vm_image
  vm_image=${vm_image:-Canonical:UbuntuServer:18.04-LTS:latest}
  # Ask for the VM size
  read -p "Enter the size of the VM (default: Standard_B2s): " vm_size
  vm_size=${vm_size:-Standard_B2s}
  # Create VM with specified configurations  
  echo "Creating VM..."
  az vm create --resource-group $resource_group --name $vm_name --image $vm_image --size $vm_size --generate-ssh-keys
}

function open_port() {
  # Open port 80 for web traffic
  echo "Opening port 80..."
  az vm open-port --port 80 --resource-group $resource_group --name $vm_name
}

function get_ip() {
  # Get the IP address of the VM 
  echo "Fetching the IP address..."
  az vm show -d -g $resource_group -n $vm_name --query publicIps -o tsv
}

function install_lamp() {
  # Install Apache, MySQL, PHP (LAMP stack) on the VM from CLI
  echo "Installing LAMP stack..."
  az vm run-command invoke -g $resource_group -n $vm_name --command-id RunShellScript --scripts \
    "sudo apt update" \
    "sudo apt -y install apache2 mysql-server php php-mysql libapache2-mod-php" \
    "sudo systemctl enable apache2" \
    "sudo systemctl enable mysql"
}

# Main function with a menu
function main() {
  echo "Select an option:"
  echo "1) Install Azure CLI"
  echo "2) Login to Azure"
  echo "3) Create resource group"
  echo "4) Create VM"
  echo "5) Open port 80"
  echo "6) Get VM IP"
  echo "7) Install LAMP stack"
  echo "8) Quit"
  
  read -p "Enter your choice: " choice
  
  case $choice in
    1) install_azure_cli;;
    2) login_azure;;
    3) create_resource_group;;
    4) create_vm;;
    5) open_port;;
    6) get_ip;;
    7) install_lamp;;
    8) exit 0;;
    *) echo "Invalid choice. Please try again.";;
  esac
}

# Run the main function in a loop
while true; do
  main
done
