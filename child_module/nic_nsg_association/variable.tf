variable "nic_nsg_association" {
  type = map(object({
    nic_id = string
    nsg_id = string
  }))
}