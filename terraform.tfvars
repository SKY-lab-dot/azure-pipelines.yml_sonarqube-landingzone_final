rg = {
  rg1 = {
    name     = "Kit"
    location = "centralus"
  }
}

vnet = {
  vnet1 = {
    name                = "kit_vnet"
    location            = "centralus"
    resource_group_name = "kit"
    address_space       = ["10.0.0.0/16"]
  }
}

subnet = {
  snet1 = {
    name                 = "kit_snet1"
    resource_group_name  = "kit"
    virtual_network_name = "kit_vnet"
    address_prefixes     = ["10.0.1.0/24"]
  }

  snet2 = {
    name                 = "kit_snet2"
    resource_group_name  = "kit"
    virtual_network_name = "kit_vnet"
    address_prefixes     = ["10.0.2.0/24"]
  }
}

nic = {
  nic1 = {
    name                  = "kit-nic1"
    location              = "centralus"
    resource_group_name   = "kit"
    ip_configuration_name = "internal"
    subnet_key            = "snet1"
    public_ip_key         = "pip1"
  }

  nic2 = {
    name                  = "kit-nic2"
    location              = "centralus"
    resource_group_name   = "kit"
    ip_configuration_name = "internal"
    subnet_key            = "snet2"
    public_ip_key         = "pip2"
  }
}

nsg = {
  nsg1 = {
    name                = "kit-nsg1"
    location            = "centralus"
    resource_group_name = "kit"
  }

  nsg2 = {
    name                = "kit-nsg2"
    location            = "centralus"
    resource_group_name = "kit"
  }
}

vm = {
  vm1 = {
    name                = "kit-vm1"
    resource_group_name = "kit"
    location            = "centralus"
    size                = "Standard_D2ads_v7"
    admin_username      = "azureadmin"
    admin_password      = "Passward@123"
    nic_key             = "nic1"
  }

  vm2 = {
    name                = "kit-vm2"
    resource_group_name = "kit"
    location            = "centralus"
    size                = "Standard_D2ads_v7"
    admin_username      = "azureadmin"
    admin_password      = "Passward@123"
    nic_key             = "nic2"
  }
}

public_ip = {
  pip1 = {
    name                = "kit-pip1"
    resource_group_name = "kit"
    location            = "centralus"
    allocation_method   = "Static"
    sku                 = "Standard"
  }

  pip2 = {
    name                = "kit-pip2"
    resource_group_name = "kit"
    location            = "centralus"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
}
