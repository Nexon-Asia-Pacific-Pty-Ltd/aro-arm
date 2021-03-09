az group create --name aro-rg --location australiaeast

az network vnet create --resource-group aro-rg --name aro-vnet --address-prefixes 10.0.0.0/22
az network vnet subnet create --resource-group aro-rg --vnet-name aro-vnet --name master-subnet --address-prefixes 10.0.0.0/23  --service-endpoints Microsoft.ContainerRegistry
az network vnet subnet create --resource-group aro-rg --vnet-name aro-vnet --name worker-subnet --address-prefixes 10.0.2.0/23  --service-endpoints Microsoft.ContainerRegistry

az network vnet subnet update --name master-subnet --resource-group aro-rg --vnet-name aro-vnet --disable-private-link-service-network-policies true

az aro create --resource-group aro-rg --name aro-cluser --vnet aro-vnet --master-subnet master-subnet --worker-subnet worker-subnet --worker-count 3 --pull-secret @pull-secret.txt