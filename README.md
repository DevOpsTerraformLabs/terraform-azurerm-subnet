# terraform-azurerm-subnet
A single-purpose Terraform module that creates **one Azure subnet** (no NSG/route-table associations). Use this module per-subnet; create multiple subnets by calling the module with `for_each` or `count` in your root/composition module

## Repo Layout
example<br/>
└───simple<br/>
main.tf<br/>
variable.tf<br/>
output.tf<br/>
README.md<br/>
LICENSE<br/>

## Quick usage (call module from Github repo root)
```hcl
module "subnet_remote" {
  source = "git@github.com:DevOpsTerraformLabs/terraform-azurerm-subnet.git"
  name = "app"
  resource_group_name = "rg-example-remote"
  vnet_name = "example-vnet-remote"
  address_prefix = "10.100.1.0/24"
  service_endpoints = ["Microsoft.Storage"]
  delegations = [
    {
      name = "aks-agentpool-delegation"
      service = "Microsoft.ContainerService/managedClusters"
    }
  ]
}
```
## Input

## Output
* id -- Subnet resource id
* name -- Subnet name
* address_prefix -- Provided CIDR
* delegations -- Delegation applied

## Note
* This module does not manage NSG or route-table associations. Create NSG or RT in separate modules and attach them using association modules that accespt ``subnet`` and `nsg_id` / `route_table_id`. This pattern helps separate ownership and lifecycle
* To create multiple subnets, use `for_each` on this module (see README composition examples in other repos).
* Consumers should pin the module with ``?ref=vX.Y.Z`` to a Git tag.








