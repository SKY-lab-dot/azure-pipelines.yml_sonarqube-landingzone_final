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


variable "keyvaults" {}
variable "secrets" {}