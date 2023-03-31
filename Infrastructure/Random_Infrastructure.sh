#!/bin/bash
# Created by Jan Gebser (Brainhub24)
# https://github.com/Brainhub24/AZURE_Snippets/Infrastructure/Random_Infrastructure.sh

# Get a list of random resource group names
resource_groups=$(az group list --query "[].name" --output tsv | sort -R | head -n 20)

# Create 2 VMs in random resource groups
for rg in $resource_groups; do
    vm_name=$(cat /dev/urandom | tr -dc 'a-z' | fold -w 8 | head -n 1)
    az vm create --name $vm_name --resource-group $rg --image UbuntuLTS --generate-ssh-keys --no-wait
done

# Create 18 other Azure resources
for i in {1..18}; do
    rg=$(az group list --query "[].name" --output tsv | sort -R | head -n 1)
    case $((RANDOM % 3)) in
        0)
            # Create a storage account
            storage_name=$(cat /dev/urandom | tr -dc 'a-z' | fold -w 8 | head -n 1)
            az storage account create --name $storage_name --resource-group $rg --sku Standard_LRS
            ;;
        1)
            # Create a Cosmos DB account
            cosmosdb_name=$(cat /dev/urandom | tr -dc 'a-z' | fold -w 8 | head -n 1)
            az cosmosdb create --name $cosmosdb_name --resource-group $rg --kind MongoDB
            ;;
        2)
            # Create a Function App
            function_name=$(cat /dev/urandom | tr -dc 'a-z' | fold -w 8 | head -n 1)
            az functionapp create --name $function_name --resource-group $rg --storage-account $rg --runtime dotnet --consumption-plan-location westus2
            ;;
    esac
done
