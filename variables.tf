variable "name" {
  description = "Subnet name"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group where the subnet (and vNet) reside"
  type        = string
}

variable "vnet_name" {
  description = "Name of the virtual Network that contains this subnet"
  type        = string
}

variable "address_prefix" {
  description = "CIDR prefix for the subnet (e.g., 10.0.1.0/24"
  type        = string
}

variable "service_endpoints" {
  description = "Optional list of service endpoints for the subnet (e.g., [\"Microsoft.Storage\"]"
  type        = list(string)
  default     = []
}

variable "delegations" {
  description = <<EOF
  Optional list of delegations. Each delegation object must have:
  - name (string) - delegation name
  - service (string) - service name (e.g., Microsoft.web/serviceFarms)
  - actions (optional list(string) - allowed actions
EOF
  type = list(object({
    name    = string
    service = string
    actions = optional(list(string), null)
  }))
  default = []
}