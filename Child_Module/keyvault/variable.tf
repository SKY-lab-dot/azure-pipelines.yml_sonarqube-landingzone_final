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


