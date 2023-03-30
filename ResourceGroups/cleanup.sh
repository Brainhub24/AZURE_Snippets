#!/bin/bash
# Created by Jan Gebser (Brainhub24)
# https://github.com/Brainhub24/AZURE_Snippets/ResourceGroups/cleanup.sh

# Find all existing resource groups and store them in a variable
rgs=$(az group list --query "[].name" -o tsv)

# Loop through each resource group and delete it
for rg in $rgs
do
    az group delete --name $rg --yes
done
