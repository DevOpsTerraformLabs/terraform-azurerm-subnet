module "subnet_local" {
  source              = "../../"
  name                = "app"
  resource_group_name = "rg-example-local"
  vnet_name           = "example-vnet-local"
  address_prefix      = "10.30.1.0/24"
  service_endpoints   = ["Microsoft.Storage"]
  delegations = [
    {
      name   = "aks-agentpool-delegation"
      service = "Microsoft.ContainerService/managedClusters"
    }
  ]
}

#Remote
#module "subnet_remote" {
#  source = "git@github.com:DevOpsTerraformLabs/terraform-azurerm-subnet.git"
#  name = "app"
#  resource_group_name = "rg-example-remote"
#  vnet_name = "example-vnet-remote"
#  address_prefix = "10.100.1.0/24"
#  service_endpoints = ["Microsoft.Storage"]
#  delegations = [
#    {
#      name = "aks-agentpool-delegation"
#      service = "Microsoft.ContainerService/managedClusters"
#    }
#  ]
#}