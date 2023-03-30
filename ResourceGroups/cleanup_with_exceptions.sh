#!/bin/bash
# Created by Jan Gebser (Brainhub24)
# https://github.com/Brainhub24/AZURE_Snippets/RecourceGroups/cleanup.sh

# Set the name of the output file with the current date and time
output_file="cleanup_$(date +'%Y-%m-%d-%H-%M-%S').txt"

# Find all existing resource groups and store them in a variable, writing the output to both the console and the output file
rgs=$(az group list --query "[?name!='cloud-shell-storage-westeurope'].name" -o tsv | tee $output_file)

# Loop through each resource group and delete it, writing the output to both the console and the output file
for rg in $rgs
do
    az group delete --name $rg --yes | tee -a $output_file
done
