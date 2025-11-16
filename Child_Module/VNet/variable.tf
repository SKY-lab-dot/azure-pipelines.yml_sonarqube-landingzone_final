variable "vnet" {
  description = "Virtual Network configuration"
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    address_space       = list(string)
    tags = object({
      environment = string
      owner       = string
    })
  }))
}
