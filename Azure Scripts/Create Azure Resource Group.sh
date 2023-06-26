#!/bin/bash

#This script creates a new Azure resource group.

read -p "Enter the name of the resource group you want to create: " resource_group

echo "Creating resource group..."
az group create --name $resource_group --location eastus2
