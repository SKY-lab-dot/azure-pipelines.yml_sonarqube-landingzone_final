variable "rg" {
  description = "Map of Resource Groups with environment and owner tags"
  type = map(object({
    rg_name    = string
    location   = string
    managed_by = optional(string)
    tags = object({
      environment = string
      owner       = string
    })
  }))
}