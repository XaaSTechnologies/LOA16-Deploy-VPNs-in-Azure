az group create --name RG-EU-Deployment --location westeurope

az network vnet create \
    --resource-group RG-EU-Deployment \
    --name EU-VNET \
    --address-prefix 10.1.0.0/16 \
    --subnet-name EU-Subnet-01 \
    --subnet-prefix 10.1.0.0/24 \
    --location westeurope

az network vnet subnet create \
    --resource-group RG-EU-Deployment \
    --vnet-name EU-VNET \
    --address-prefix 10.1.255.0/27 \
    --name GatewaySubnet

az network vnet subnet create \
    --resource-group RG-US-Deployment \
    --vnet-name US-Production-vNET \
    --address-prefix 172.16.255.0/27 \
    --name GatewaySubnet

az vm create \
    --resource-group RG-EU-Deployment \
    --name VM-West-EU \
    --location westeurope \
    --vnet-name EU-VNET \
    --subnet EU-Subnet-01 \
    --image UbuntuLTS \
    --size Standard_B1s \
    --private-ip-address 10.1.0.200 \
    --admin-username adminuser \
    --admin-password adminadmin123!
