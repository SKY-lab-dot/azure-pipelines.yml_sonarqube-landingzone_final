variable "databases" {
  description = "SQL Databases configuration"
  type = map(object({
    db_name        = string
    server_name    = string
    rg_name        = string
    collation      = string
    license_type   = string
    max_size_gb    = number
    read_scale     = bool
    sku_name       = string
    zone_redundant = bool
  }))
}


