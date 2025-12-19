# Resource Group
rg = {
  rg1 = {
    rg_name    = "lz-qa-rg-app-centralindia"
    location   = "centralindia"
    managed_by = "Terraform"
    tags = {
      environment = "qauction"
      owner       = "CloudTeam"
    }
  }
}

# Virtual Network
vnet = {
  vnet1 = {
    name                = "lz-qa-vnet-centralindia"
    resource_group_name = "lz-qa-rg-app-centralindia"
    location            = "centralindia"
    address_space       = ["10.0.0.0/16"]
    tags = {
      environment = "qauction"
      owner       = "sidharth"
    }
  }

}

# Subnets
subnet = {
  frontend = {
    name                 = "lz-qa-subnet-frontend"
    virtual_network_name = "lz-qa-vnet-centralindia"
    resource_group_name  = "lz-qa-rg-app-centralindia"
    address_prefixes     = ["10.0.1.0/24"]
  }

  backend = {
    name                 = "lz-qa-subnet-backend"
    virtual_network_name = "lz-qa-vnet-centralindia"
    resource_group_name  = "lz-qa-rg-app-centralindia"
    address_prefixes     = ["10.0.2.0/24"]
  }
}

# NIC + Public IP
nic = {
  frontend = {
    nic_name            = "lz-qa-nic-frontend"
    public_ip_name      = "lz-qa-pip-frontend"
    resource_group_name = "lz-qa-rg-app-centralindia"
    location            = "centralindia"
    subnet_name         = "lz-qa-subnet-frontend"
    vnet_name           = "lz-qa-vnet-centralindia"
  
    tags = {
      environment = "qauction"
      owner       = "sidharth"
    }
  }

  backend = {
    nic_name            = "lz-qa-nic-backend"
    public_ip_name      = "lz-qa-pip-backend"
    resource_group_name = "lz-qa-rg-app-centralindia"
    location            = "centralindia"
    subnet_name         = "lz-qa-subnet-backend"
    vnet_name           = "lz-qa-vnet-centralindia"
    tags = {
      environment = "qauction"
      owner       = "sidharth"
    }
  }
}

# Virtual Machines
vm = {
  frontend = {
    vm_name        = "lz-qa-vm-frontend"
    size           = "Standard_B2s"
    # admin_username = "azureuser"
    # admin_password = "Password123!"
    nic_name       = "lz-qa-nic-frontend"
    rg_name        = "lz-qa-rg-app-centralindia"
    location       = "centralindia"
    tags = {
      environment = "qauction"
      owner       = "sidharth"
    }
  }

  backend = {
    vm_name        = "lz-qa-vm-backend"
    size           = "Standard_B2s"
    # admin_username = "azureuser"
    # admin_password = "Password123!"
    nic_name       = "lz-qa-nic-backend"
    rg_name        = "lz-qa-rg-app-centralindia"
    location       = "centralindia"

    tags = {
      environment = "qauction"
      owner       = "sidharth"
    }
  }
}

# SQL Server
sql = {
  qa_sqlserver1 = {
    server_name                  = "lz-qa-sqlserver"
    rg_name                      = "lz-qa-rg-app-centralindia"
    location                     = "centralindia"
    version                      = "12.0"
    administrator_login          = "sqladmin"
    administrator_login_password = "Mysql@123"
    minimum_tls_version          = "1.2"
  }
}

# Databases
databases = {
  db1 = {
    db_name        = "lz-qa-db1"
    server_name    = "lz-qa-sqlserver"
    rg_name        = "lz-qa-rg-app-centralindia"
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
    nsg_name            = "lz-qa-nsg-frontend"
    location            = "centralindia"
    resource_group_name = "lz-qa-rg-app-centralindia"
    tags = {
      environment = "qauction"
      owner       = "sidharth"
    }
  }

  backend = {
    nsg_name            = "lz-qa-nsg-backend"
    location            = "centralindia"
    resource_group_name = "lz-qa-rg-app-centralindia"
    tags = {
      environment = "qauction"
      owner       = "sidharth"
    }
  }
}

# NSG & NIC assoc
nic_nsg_ids = {
  nic_nsg_1 = {
    nic_name = "lz-qa-nic-frontend"
    nsg_name = "lz-qa-nsg-frontend"
    rg_name  = "lz-qa-rg-app-centralindia"
  }
  nic_nsg_2 = {
    nic_name = "lz-qa-nic-backend"
    nsg_name = "lz-qa-nsg-backend"
    rg_name  = "lz-qa-rg-app-centralindia"
  }
}

keyvaults = {
  kv1 = {
    name                = "frontendbackend02"
    location            = "centralindia"
    resource_group_name = "lz-qa-rg-app-centralindia"
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





