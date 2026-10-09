variable "rg" {
  type = map(object({
    name     = string
    location = string
  }))

}
variable "vnet" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    address_space       = list(string)
  }))

}
variable "snet" {
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))

}
variable "nic" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    subnet_key          = string
    public_ip_key       = string
  }))
}
variable "nsg" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
  }))
}

variable "ssh_source_address" {
  description = "Trusted public IP/CIDR allowed to SSH"
  type        = string
}

variable "sonarqube_source_address" {
  description = "Trusted public IP/CIDR allowed to access SonarQube"
  type        = string
}

variable "vm" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    size                = string
    admin_username      = string
    admin_password      = string
    nic_id              = string
    ssh_source_address       = string
    sonarqube_source_address = string
  }))
}
variable "public_ip" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
  }))
}
variable "nic_nsg_association" {
  type = map(object({
    nic_key = string
    nsg_key = string
  }))
}
variable "database" {
  type = map(object({
    name        = string
    sku_name    = string
    max_size_gb = number
  }))
}
variable "keyvault" {
  type = object({
    name                = string
    location            = string
    resource_group_name = string
  })
}
variable "sql_server" {
  type = object({
    name                         = string
    resource_group_name          = string
    location                     = string
    administrator_login          = string
    administrator_login_password = string
  })

  sensitive = true
}
# variable "sonarqube" {
#   type = object({
#     name                = string
#     location            = string
#     resource_group_name = string
#     size                = string
#     admin_username      = string
#     admin_password      = string
#     subnet_key          = string
#   })

#   sensitive = true
# }