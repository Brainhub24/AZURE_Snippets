#!/bin/bash
# Created by Jan Gebser (Brainhub24)
# https://github.com/Brainhub24/AZURE_Snippets/ResourceGroups/RandomTestGroups.sh

# Prompt user for number of resource groups to create
echo "TEST-SCENARIO | How many resource groups would you like to create for your test?"
read num_groups

# Generate a unique filename for the output log
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
log_filename="Created_ResourceGroups_${timestamp}.log"

# Start creating the resource groups in the background
count=1
while [ $count -le $num_groups ]
do
    randomName=$(( $RANDOM % 10000 ))
    echo "Creating resource group RG-$randomName"
    az group create --name RG-$randomName --location eastus >> $log_filename 2>&1 &
    count=$(( $count + 1 ))
done

echo "Creating resource groups in the background..."
echo "Check $log_filename for the list of created resource groups."
