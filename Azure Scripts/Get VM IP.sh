#!/bin/bash

#This script fetches and displays the IP address of your Azure VM

echo "Fetching the IP address..."
az vm show -d -g $resource_group -n $vm_name --query publicIps -o tsv
