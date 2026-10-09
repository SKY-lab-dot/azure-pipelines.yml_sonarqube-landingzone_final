variable "nsg" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
  }))
}

variable "ssh_source_address" {
  description = "Trusted public IP/CIDR allowed to SSH"
  type        = string
}

variable "sonarqube_source_address" {
  description = "Trusted public IP/CIDR allowed to access SonarQube"
  type        = string
}

