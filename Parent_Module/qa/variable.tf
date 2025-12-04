variable "rg" {
  type = map(object({
    rg_name    = string
    location   = string
    managed_by = string
    tags = object({
      environment = string
      owner       = string
    })
  }))
}

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

variable "subnet" {
  description = "Subnet configuration"
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))
}


variable "nic" {
  description = "Network interface and public IP configuration"
  type = map(object({
    nic_name              = string
    public_ip_name        = string
    resource_group_name   = string
    location              = string
    subnet_name           = string
    vnet_name             = string
       tags = object({
      environment = string
      owner       = string
    })
  }))
}



variable "vm" {
  description = "Virtual Machine configuration"
  type = map(object({
    vm_name              = string
    size                 = string
    nic_name             = string
    rg_name              = string
    location             = string
    admin_username   = optional(string)
    admin_password   = optional(string)
    kv_name          = optional(string)
    username_secret  = optional(string)
    password_secret  = optional(string)
    tags = object({
      environment = string
      owner       = string
    })
  }))
}


variable "sql" {
  type = map(object({
    server_name                  = string
    rg_name                      = string
    location                     = string
    version                      = string
    administrator_login          = string
    administrator_login_password = string
    minimum_tls_version          = string
    
  }))
}




variable "databases" {
  description = "SQL Databases configuration"
  type = map(object({
    db_name        = string
    server_name    = string
    rg_name        = string
    collation      = string
    license_type   = string
    max_size_gb    = number
    read_scale     = bool
    sku_name       = string
    zone_redundant = bool
  }))
}

variable "nsg" {
  description = "Network Security Group configuration"
  type = map(object({
    nsg_name             = string
    location             = string
    resource_group_name  = string
    tags = object({
      environment = string
      owner       = string
    })
  }))
}

variable nic_nsg_ids {
  description = "A map of objects containing NIC and NSG names along with their resource group names."
  type = map(object({
    nic_name = string
    nsg_name = string
    rg_name  = string
  }))
}


variable "keyvaults" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    sku_name            = string
  }))
}

variable "secrets" {
  type = map(object({
    name         = string
    value        = string
    keyvault_key = string
  }))
}

