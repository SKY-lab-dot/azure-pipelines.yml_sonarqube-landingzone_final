# =========================================================
# RESOURCE GROUP
# =========================================================

module "rg" {
  source = "../child_module/rg"

  rg = var.rg
}


# =========================================================
# VNET
# =========================================================

module "vnet" {
  source     = "../child_module/vnet"
  depends_on = [module.rg]

  vnet = var.vnet
}


# =========================================================
# SUBNET
# =========================================================

module "snet" {
  source     = "../child_module/subnet"
  depends_on = [module.rg, module.vnet]

  snet = var.snet
}


# =========================================================
# PUBLIC IP
# =========================================================

module "public_ip" {
  source     = "../child_module/public_ip"
  depends_on = [module.rg]

  public_ip = var.public_ip
}


# =========================================================
# NIC
# =========================================================

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
      name                = value.name
      location            = value.location
      resource_group_name = value.resource_group_name

      subnet_id = module.snet.id[value.subnet_key]

      public_ip_id = module.public_ip.id[value.public_ip_key]
    }
  }
}

# =========================================================
# NSG
# =========================================================

module "nsg" {
  source = "../child_module/nsg"

  depends_on = [
    module.rg
  ]

  nsg = var.nsg

  ssh_source_address       = var.ssh_source_address
  sonarqube_source_address = var.sonarqube_source_address
}


# =========================================================
# NIC + NSG ASSOCIATION
# =========================================================

module "nic_nsg_association" {
  source = "../child_module/nic_nsg_association"

  depends_on = [
    module.nic,
    module.nsg
  ]

  nic_nsg_association = {
    for key, value in var.nic_nsg_association : key => {
      nic_id = module.nic.nic_id[value.nic_key]
      nsg_id = module.nsg.id[value.nsg_key]
    }
  }
}


# =========================================================
# VM
# =========================================================

module "vm" {
  source = "../child_module/vm"

  depends_on = [
    module.rg,
    module.nic,
    module.nic_nsg_association
  ]

  vm = {
    for key, value in var.vm : key => {
      name                = value.name
      location            = value.location
      resource_group_name = value.resource_group_name
      size                = value.size
      admin_username      = value.admin_username
      admin_password      = value.admin_password

      nic_id = module.nic.nic_id[value.nic_id]
    }
  }
}

# =========================================================
# SQL SERVER
# =========================================================

module "sql_server" {
  source = "../child_module/sql_server"

  depends_on = [
    module.rg
  ]

  sql_server = var.sql_server
}


# =========================================================
# DATABASE
# =========================================================

module "database" {
  source = "../child_module/database"

  depends_on = [
    module.sql_server
  ]

  database = {
    for key, value in var.database : key => {
      name        = value.name
      server_id   = module.sql_server.id
      sku_name    = value.sku_name
      max_size_gb = value.max_size_gb
    }
  }
}

# =========================================================
# KEY VAULT
# =========================================================

data "azurerm_client_config" "current" {}

module "keyvault" {
  source = "../child_module/keyvault"

  depends_on = [
    module.rg
  ]

  keyvault  = var.keyvault
  tenant_id = data.azurerm_client_config.current.tenant_id
}
# =========================================================
# sonarqube
# =========================================================
# module "sonarqube" {
#   source = "../child_module/sonarqube"

#   depends_on = [
#     module.rg,
#     module.vnet,
#     module.snet
#   ]

#   sonarqube = {
#     name                = var.sonarqube.name
#     location            = var.sonarqube.location
#     resource_group_name = var.sonarqube.resource_group_name
#     size                = var.sonarqube.size
#     admin_username      = var.sonarqube.admin_username
#     admin_password      = var.sonarqube.admin_password
#     subnet_id           = module.snet.id[var.sonarqube.subnet_key]
#   }
# }