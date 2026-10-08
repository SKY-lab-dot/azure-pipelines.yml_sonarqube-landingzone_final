rg = {
  rg1 = {
    name     = "riya"
    location = "Centralus"
  }
}

vnet = {
  vnet1 = {
    name                = "riya_vnet"
    resource_group_name = "riya"
    location            = "Centralus"
    address_space       = ["10.0.0.0/16"]
  }
}
snet = {
  snet1 = {
    name                 = "riya_snet1"
    resource_group_name  = "riya"
    virtual_network_name = "riya_vnet"
    address_prefixes     = ["10.0.1.0/24"]
  }

  snet2 = {
    name                 = "riya_snet2"
    resource_group_name  = "riya"
    virtual_network_name = "riya_vnet"
    address_prefixes     = ["10.0.2.0/24"]
  }
}

nic = {
  nic1 = {
    name                = "riya_nic1"
    location            = "Centralus"
    resource_group_name = "riya"

    subnet_key    = "snet1"
    public_ip_key = "pip1"
  }

  nic2 = {
    name                = "riya_nic2"
    location            = "Centralus"
    resource_group_name = "riya"

    subnet_key    = "snet2"
    public_ip_key = "pip2"
  }
}

nsg = {
  nsg1 = {
    name                = "riya_nsg1"
    location            = "Centralus"
    resource_group_name = "riya"
  }

  nsg2 = {
    name                = "riya_nsg2"
    location            = "Centralus"
    resource_group_name = "riya"
  }
}

vm = {
  vm1 = {
    name                = "riya-vm1"
    location            = "Centralus"
    resource_group_name = "riya"
    size                = "Standard_F1ads_v7"
    admin_username      = "azureadmin"
    admin_password      = "YourStrongPassword123!"
    nic_id              = "nic1"
  }
  vm2 = {
    name                = "riya-vm2"
    location            = "Centralus"
    resource_group_name = "riya"
    size                = "Standard_F1ads_v7"
    admin_username      = "azureadmin"
    admin_password      = "YourStrongPassword123!"
    nic_id              = "nic2"
  }
}

public_ip = {
  pip1 = {
    name                = "riya-pip1"
    location            = "Centralus"
    resource_group_name = "riya"
  }

  pip2 = {
    name                = "riya-pip2"
    location            = "Centralus"
    resource_group_name = "riya"
  }
}
nic_nsg_association = {
  association1 = {
    nic_key = "nic1"
    nsg_key = "nsg1"
  }
  association2 = {
    nic_key = "nic2"
    nsg_key = "nsg2"
  }
}
database = {
  db1 = {
    name        = "riya_database1"
    sku_name    = "S0"
    max_size_gb = 10
  }
}
keyvault = {
  name                = "riyakeyvault01"
  location            = "Centralus"
  resource_group_name = "riya"
}
sql_server = {
  name                         = "riya-sql-server-01"
  resource_group_name          = "riya"
  location                     = "Centralus"
  administrator_login          = "sqladmin"
  administrator_login_password = "YourStrongPassword123!"
}
sonarqube = {
  name                = "riya-sonarqube"
  location            = "Centralus"
  resource_group_name = "riya"
  size                = "Standard_F1ads_v7"
  admin_username      = "azureadmin"
  admin_password      = "YourStrongPassword123!"
  subnet_key          = "snet1"
}
