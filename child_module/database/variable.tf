variable "database" {
  type = map(object({
    name        = string
    server_id   = string
    sku_name    = string
    max_size_gb = number
  }))
}