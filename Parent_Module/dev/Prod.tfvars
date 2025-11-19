# Resource Group
rg = {
  rg1 = {
    rg_name    = "lz-prod-rg-app-eastus"
    location   = "eastus"
    managed_by = "Terraform"
    tags = {
      environment = "production"
      owner       = "CloudTeam"
    }
  }
}

# Virtual Network
vnet = {
  vnet1 = {
    name                = "lz-prod-vnet-eastus"
    resource_group_name = "lz-prod-rg-app-eastus"
    location            = "eastus"
    address_space       = ["10.0.0.0/16"]
    tags = {
      environment = "production"
      owner       = "sidharth"
    }
  }

}

# Subnets
subnet = {
  frontend = {
    name                 = "lz-prod-subnet-frontend"
    virtual_network_name = "lz-prod-vnet-eastus"
    resource_group_name  = "lz-prod-rg-app-eastus"
    address_prefixes     = ["10.0.1.0/24"]
  }

  backend = {
    name                 = "lz-prod-subnet-backend"
    virtual_network_name = "lz-prod-vnet-eastus"
    resource_group_name  = "lz-prod-rg-app-eastus"
    address_prefixes     = ["10.0.2.0/24"]
  }
}

# NIC + Public IP
nic = {
  frontend = {
    nic_name            = "lz-prod-nic-frontend"
    public_ip_name      = "lz-prod-pip-frontend"
    resource_group_name = "lz-prod-rg-app-eastus"
    location            = "eastus"
    subnet_name         = "lz-prod-subnet-frontend"
    vnet_name           = "lz-prod-vnet-eastus"
  
    tags = {
      environment = "production"
      owner       = "sidharth"
    }
  }

  backend = {
    nic_name            = "lz-prod-nic-backend"
    public_ip_name      = "lz-prod-pip-backend"
    resource_group_name = "lz-prod-rg-app-eastus"
    location            = "eastus"
    subnet_name         = "lz-prod-subnet-backend"
    vnet_name           = "lz-prod-vnet-eastus"
    tags = {
      environment = "production"
      owner       = "sidharth"
    }
  }
}

# Virtual Machines
vm = {
  frontend = {
    vm_name        = "lz-prod-vm-frontend"
    size           = "Standard_B2s"
    # admin_username = "azureuser"
    # admin_password = "Password123!"
    nic_name       = "lz-prod-nic-frontend"
    rg_name        = "lz-prod-rg-app-eastus"
    location       = "eastus"
    tags = {
      environment = "production"
      owner       = "sidharth"
    }
  }

  backend = {
    vm_name        = "lz-prod-vm-backend"
    size           = "Standard_B2s"
    # admin_username = "azureuser"
    # admin_password = "Password123!"
    nic_name       = "lz-prod-nic-backend"
    rg_name        = "lz-prod-rg-app-eastus"
    location       = "eastus"

    tags = {
      environment = "production"
      owner       = "sidharth"
    }
  }
}

# SQL Server
sql = {
  prod_sqlserver1 = {
    server_name                  = "lz-prod-sqlserver"
    rg_name                      = "lz-prod-rg-app-eastus"
    location                     = "eastus"
    version                      = "12.0"
    administrator_login          = "sqladmin"
    administrator_login_password = "Mysql@123"
    minimum_tls_version          = "1.2"
  }
}

# Databases
databases = {
  db1 = {
    db_name        = "lz-prod-db1"
    server_name    = "lz-prod-sqlserver"
    rg_name        = "lz-prod-rg-app-eastus"
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
    nsg_name            = "lz-prod-nsg-frontend"
    location            = "eastus"
    resource_group_name = "lz-prod-rg-app-eastus"
    tags = {
      environment = "production"
      owner       = "sidharth"
    }
  }

  backend = {
    nsg_name            = "lz-prod-nsg-backend"
    location            = "eastus"
    resource_group_name = "lz-prod-rg-app-eastus"
    tags = {
      environment = "production"
      owner       = "sidharth"
    }
  }
}

# NSG & NIC assoc
nic_nsg_ids = {
  nic_nsg_1 = {
    nic_name = "lz-prod-nic-frontend"
    nsg_name = "lz-prod-nsg-frontend"
    rg_name  = "lz-prod-rg-app-eastus"
  }
  nic_nsg_2 = {
    nic_name = "lz-prod-nic-backend"
    nsg_name = "lz-prod-nsg-backend"
    rg_name  = "lz-prod-rg-app-eastus"
  }
}

keyvaults = {
  kv1 = {
    name                = "frontendbackend02"
    location            = "eastus"
    resource_group_name = "lz-prod-rg-app-eastus"
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





