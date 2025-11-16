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


