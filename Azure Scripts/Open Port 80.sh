#!/bin/bash

#This script opens port 80 for web traffic

echo "Opening port 80..."
az vm open-port --port 80 --resource-group $resource_group --name $vm_name
