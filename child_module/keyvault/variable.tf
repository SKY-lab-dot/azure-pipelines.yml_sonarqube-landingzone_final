variable "keyvault" {
  type = object({
    name                = string
    location            = string
    resource_group_name = string
  })
}

variable "tenant_id" {
  type = string
}
