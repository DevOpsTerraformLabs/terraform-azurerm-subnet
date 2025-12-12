
resource "azurerm_subnet" "az_subnet" {
  name                 = var.name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = [var.address_prefix]
  service_endpoints    = var.service_endpoints

 dynamic "delegation" {
    for_each = var.delegations
    content {
      name = delegation.value.name

      service_delegation {
        name    = delegation.value.service
        actions = lookup(delegation.value, "actions", null)
      }
    }
  }
}

