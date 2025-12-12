output "id" {
  description = "ID of the created subnet"
  value       = azurerm_subnet.az_subnet.id
}

output "name" {
  description = "Name of the subnet"
  value       = azurerm_subnet.az_subnet.name
}

output "address_prefix" {
  description = "CIDR for the subnet"
  value       = var.address_prefix
}

output "delegations" {
  description = "List of delegations applied to the subnet"
  value       = azurerm_subnet.az_subnet.delegation
}

