resource "azurerm_public_ip" "sonarqube" {
  name                = "${var.sonarqube.name}-pip"
  location            = var.sonarqube.location
  resource_group_name = var.sonarqube.resource_group_name

  allocation_method = "Static"
  sku               = "Standard"
}

resource "azurerm_network_security_group" "sonarqube" {
  name                = "${var.sonarqube.name}-nsg"
  location            = var.sonarqube.location
  resource_group_name = var.sonarqube.resource_group_name

  security_rule {
    name                       = "Allow-SSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Allow-SonarQube"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "9000"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface" "sonarqube" {
  name                = "${var.sonarqube.name}-nic"
  location            = var.sonarqube.location
  resource_group_name = var.sonarqube.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.sonarqube.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.sonarqube.id
  }
}

resource "azurerm_network_interface_security_group_association" "sonarqube" {
  network_interface_id      = azurerm_network_interface.sonarqube.id
  network_security_group_id = azurerm_network_security_group.sonarqube.id
}

resource "azurerm_linux_virtual_machine" "sonarqube" {
  name                = var.sonarqube.name
  location            = var.sonarqube.location
  resource_group_name = var.sonarqube.resource_group_name

  size           = var.sonarqube.size
  admin_username = var.sonarqube.admin_username
  admin_password = var.sonarqube.admin_password

  network_interface_ids = [
    azurerm_network_interface.sonarqube.id
  ]

  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
  publisher = "Canonical"
  offer     = "0001-com-ubuntu-server-jammy"
  sku       = "22_04-lts-gen2"
  version   = "latest"
}

  custom_data = base64encode(<<-EOF
    #!/bin/bash

    set -e

    apt-get update -y
    apt-get upgrade -y

    # Install Java
    apt-get install -y openjdk-17-jdk wget unzip curl

    # Create SonarQube user
    useradd --system --create-home --home-dir /opt/sonarqube --shell /bin/bash sonarqube || true

    # Download SonarQube
    cd /tmp

    wget -q https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-25.10.0.114319.zip

    # Extract
    unzip -q sonarqube-25.10.0.114319.zip -d /opt

    # Rename
    rm -rf /opt/sonarqube
    mv /opt/sonarqube-25.10.0.114319 /opt/sonarqube

    # Permissions
    chown -R sonarqube:sonarqube /opt/sonarqube

    # Configure service
    cat > /etc/systemd/system/sonarqube.service <<'SERVICE'
    [Unit]
    Description=SonarQube service
    After=network.target

    [Service]
    Type=forking

    User=sonarqube
    Group=sonarqube

    ExecStart=/opt/sonarqube/bin/linux-x86-64/sonar.sh start
    ExecStop=/opt/sonarqube/bin/linux-x86-64/sonar.sh stop

    Restart=always

    [Install]
    WantedBy=multi-user.target
    SERVICE

    # Kernel settings required by Elasticsearch
    sysctl -w vm.max_map_count=524288
    sysctl -w fs.file-max=131072

    echo "vm.max_map_count=524288" >> /etc/sysctl.conf
    echo "fs.file-max=131072" >> /etc/sysctl.conf

    # Limits
    cat >> /etc/security/limits.conf <<'LIMITS'
    sonarqube   -   nofile   131072
    sonarqube   -   nproc    8192
    LIMITS

    systemctl daemon-reload
    systemctl enable sonarqube
    systemctl start sonarqube

  EOF
  )
}