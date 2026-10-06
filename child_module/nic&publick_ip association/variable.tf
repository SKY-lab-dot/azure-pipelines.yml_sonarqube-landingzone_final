variable "nic" {

  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    subnet_id            = string
    public_ip_id        = string
  }))
}