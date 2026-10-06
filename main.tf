module "rg" {
  source = "../child_module/rg"
  rg     = var.rg

}
module "vnet" {
  source     = "../child_module/vnet"
  depends_on = [module.rg]
  vnet       = var.vnet

}
module "snet" {
  source     = "../child_module/subnet"
  depends_on = [module.rg, module.vnet]
  subnet     = var.subnet
}
module "nic" {
  source = "../child_module/nic"

  depends_on = [
    module.rg,
    module.vnet,
    module.snet,
    module.public_ip
  ]

  nic = {
    for key, value in var.nic : key => {
      name                  = value.name
      location              = value.location
      resource_group_name   = value.resource_group_name
      ip_configuration_name = value.ip_configuration_name
      subnet_id             = module.snet.subnet_ids[value.subnet_key]
      public_ip_id          = module.public_ip.public_ip_ids[value.public_ip_key]
    }
  }
}
module "nsg" {

  source = "../Child_module/nsg"

  depends_on = [
    module.rg
  ]

  nsg = var.nsg
}
module "association" {

  source = "../Child_module/nic&nsg association"

  depends_on = [module.nic, module.nsg]

  association = {
    sit = {
      nic_id = module.nic.nic_ids["nic1"]
      nsg_id = module.nsg.nsg_ids["nsg1"]
    }

    kit = {
      nic_id = module.nic.nic_ids["nic2"]
      nsg_id = module.nsg.nsg_ids["nsg2"]
    }
  }
}
module "vm" {
  source = "../child_module/vm"

  depends_on = [
    module.rg,
    module.vnet,
    module.snet,
    module.nic
  ]

  vm = {
    for key, value in var.vm : key => {
      name                = value.name
      resource_group_name = value.resource_group_name
      location            = value.location
      size                = value.size
      admin_username      = value.admin_username
      admin_password      = value.admin_password
      nic_id              = module.nic.nic_ids[value.nic_key]
    }
  }
}
module "public_ip" {

  source = "../child_module/public_ip"

  public_ip = var.public_ip

}
output "public_ip_addresses" {
  value = module.public_ip.public_ip_addresses
}

output "public_ip_ids" {
  value = module.public_ip.public_ip_ids
}