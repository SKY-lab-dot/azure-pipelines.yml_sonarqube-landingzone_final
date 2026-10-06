variable "rg" {
  type = map(object({
    name     = string
    location = string
  }))

}
variable "vnet" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
  }))

}
variable "subnet" {
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))

}
variable "nic" {
  type = map(object({
    name                  = string
    location              = string
    resource_group_name   = string
    ip_configuration_name = string
    subnet_key            = string
    public_ip_key         = string
  }))
}
variable "nsg" {

  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
  }))
}
variable "vm" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    size                = string
    admin_username      = string
    admin_password      = string
    nic_key             = string
    nic_id              = optional(string)
  }))
}
variable "public_ip" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    allocation_method   = string
    sku                 = string
  }))
}