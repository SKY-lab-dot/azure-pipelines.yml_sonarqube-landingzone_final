# Resource Group
rg = {
  rg1 = {
    rg_name    = "lz-dev-rg-app-westus2"
    location   = "westus2"
    managed_by = "Terraform"
    tags = {
      environment = "devuction"
      owner       = "CloudTeam"
    }
  }
}

# Virtual Network
vnet = {
  vnet1 = {
    name                = "lz-dev-vnet-westus2"
    resource_group_name = "lz-dev-rg-app-westus2"
    location            = "westus2"
    address_space       = ["10.0.0.0/16"]
    tags = {
      environment = "devuction"
      owner       = "sidharth"
    }
  }

}

# Subnets
subnet = {
  frontend = {
    name                 = "lz-dev-subnet-frontend"
    virtual_network_name = "lz-dev-vnet-westus2"
    resource_group_name  = "lz-dev-rg-app-westus2"
    address_prefixes     = ["10.0.1.0/24"]
  }

  backend = {
    name                 = "lz-dev-subnet-backend"
    virtual_network_name = "lz-dev-vnet-westus2"
    resource_group_name  = "lz-dev-rg-app-westus2"
    address_prefixes     = ["10.0.2.0/24"]
  }
}

# NIC + Public IP
nic = {
  frontend = {
    nic_name            = "lz-dev-nic-frontend"
    public_ip_name      = "lz-dev-pip-frontend"
    resource_group_name = "lz-dev-rg-app-westus2"
    location            = "westus2"
    subnet_name         = "lz-dev-subnet-frontend"
    vnet_name           = "lz-dev-vnet-westus2"

    tags = {
      environment = "devuction"
      owner       = "sidharth"
    }
  }

  backend = {
    nic_name            = "lz-dev-nic-backend"
    public_ip_name      = "lz-dev-pip-backend"
    resource_group_name = "lz-dev-rg-app-westus2"
    location            = "westus2"
    subnet_name         = "lz-dev-subnet-backend"
    vnet_name           = "lz-dev-vnet-westus2"
    tags = {
      environment = "devuction"
      owner       = "sidharth"
    }
  }
}

# Virtual Machines
vm = {
  frontend = {
    vm_name = "lz-dev-vm-frontend"
    size    = "Standard_B2s"
    # admin_username = "azureuser"
    # admin_password = "Password123!"
    nic_name = "lz-dev-nic-frontend"
    rg_name  = "lz-dev-rg-app-westus2"
    location = "westus2"
    tags = {
      environment = "devuction"
      owner       = "sidharth"
    }
  }

  backend = {
    vm_name = "lz-dev-vm-backend"
    size    = "Standard_B2s"
    # admin_username = "azureuser"
    # admin_password = "Password123!"
    nic_name = "lz-dev-nic-backend"
    rg_name  = "lz-dev-rg-app-westus2"
    location = "westus2"

    tags = {
      environment = "devuction"
      owner       = "sidharth"
    }
  }
}

# SQL Server
sql = {
  dev_sqlserver1 = {
    server_name                  = "lz-dev-sqlserver"
    rg_name                      = "lz-dev-rg-app-westus2"
    location                     = "westus2"
    version                      = "12.0"
    administrator_login          = "sqladmin"
    administrator_login_password = "Mysql@123"
    minimum_tls_version          = "1.2"
  }
}

# Databases
databases = {
  db1 = {
    db_name        = "lz-dev-db1"
    server_name    = "lz-dev-sqlserver"
    rg_name        = "lz-dev-rg-app-westus2"
    collation      = "SQL_Latin1_General_CP1_CI_AS"
    license_type   = "LicenseIncluded"
    max_size_gb    = 5
    read_scale     = false
    sku_name       = "S0"
    zone_redundant = false
  }
}

# NSG
nsg = {
  frontend = {
    nsg_name            = "lz-dev-nsg-frontend"
    location            = "westus2"
    resource_group_name = "lz-dev-rg-app-westus2"
    tags = {
      environment = "devuction"
      owner       = "sidharth"
    }
  }

  backend = {
    nsg_name            = "lz-dev-nsg-backend"
    location            = "westus2"
    resource_group_name = "lz-dev-rg-app-westus2"
    tags = {
      environment = "devuction"
      owner       = "sidharth"
    }
  }
}

# NSG & NIC assoc
nic_nsg_ids = {
  nic_nsg_1 = {
    nic_name = "lz-dev-nic-frontend"
    nsg_name = "lz-dev-nsg-frontend"
    rg_name  = "lz-dev-rg-app-westus2"
  }
  nic_nsg_2 = {
    nic_name = "lz-dev-nic-backend"
    nsg_name = "lz-dev-nsg-backend"
    rg_name  = "lz-dev-rg-app-westus2"
  }
}

keyvaults = {
  kv1 = {
    name                = "frontendbackend02"
    location            = "westus2"
    resource_group_name = "lz-dev-rg-app-westus2"
    sku_name            = "standard"
  }
}

secrets = {
  secret1 = {
    name         = "app-username"
    value        = "adminuser"
    keyvault_key = "kv1"
  }

  secret2 = {
    name         = "app-password"
    value        = "Admin@123"
    keyvault_key = "kv1"
  }
}





