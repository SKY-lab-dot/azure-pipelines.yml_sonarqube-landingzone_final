variable "vm" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    size                = string
    admin_username      = string
    admin_password      = string
    nic_id              = string
  }))
}