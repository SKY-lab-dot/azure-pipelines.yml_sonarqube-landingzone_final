module "resource_group" {
  source = "../../Child_Module/Resource_group"
  rg     = var.rg
}

module "vnet" {
  depends_on = [module.resource_group]
  source     = "../../Child_Module/VNet"
  vnet       = var.vnet
}

module "subnet" {
  depends_on = [module.vnet]
  source     = "../../Child_Module/Subnet"
  subnet     = var.subnet
}

module "nic" {
  depends_on = [module.subnet]
  source     = "../../Child_Module/PublicIP_NetworkInterface"
  nic        = var.nic
 
}

module "virtual_machine" {
  depends_on = [module.nic,module.keyvault]
  source     = "../../Child_Module/Virtual_Machine"
  vm = var.vm
  keyvaults = var.keyvaults
  secrets = var.secrets
}

module "sql_server" {
  depends_on = [module.resource_group]
  source     = "../../Child_Module/SQL_Server"
  sql        = var.sql
}

module "databases" {
  depends_on = [module.sql_server]
  source     = "../../Child_Module/Database"
  databases  = var.databases
}

module "nsg" {
  depends_on = [ module.resource_group ]
  source = "../../Child_Module/NSG"
  nsg = var.nsg
  
}

module "nic_nsg_assoc" {

depends_on = [ module.nic, module.nsg ]
  source = "../../Child_Module/azurerm_nic_nsg_assoc"

  nic_nsg_ids           = var.nic_nsg_ids
  
}

module "keyvault" {
  depends_on = [ module.resource_group ]

  source = "../../Child_Module/keyvault"
  keyvaults = var.keyvaults
  secrets = var.secrets
  
}