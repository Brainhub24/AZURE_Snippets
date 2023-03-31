#!/bin/bash
# Created by Jan Gebser (Brainhub24)
# https://github.com/Brainhub24/AZURE_Snippets/ResourceGroups/RandomTestGroups.sh

count=1

while [ $count -le 100 ]
do
    randomName=$(( $RANDOM % 10000 ))
    echo "Creating resource group RG-$randomName"
    az group create --name RG-$randomName --location eastus
    count=$(( $count + 1 ))
done

echo "All resource groups created."
