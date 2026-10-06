variable "vm" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    size                = string
    admin_username      = string
    admin_password      = string
    nic_key             = optional(string)
    nic_id              = optional(string)
  }))
}