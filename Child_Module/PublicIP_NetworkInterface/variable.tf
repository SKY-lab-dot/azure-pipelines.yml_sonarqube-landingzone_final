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


