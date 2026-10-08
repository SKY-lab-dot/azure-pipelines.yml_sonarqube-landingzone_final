variable "sonarqube" {
  type = object({
    name                = string
    location            = string
    resource_group_name = string
    size                = string
    admin_username      = string
    admin_password      = string
    subnet_id           = string
  })

  sensitive = true
}