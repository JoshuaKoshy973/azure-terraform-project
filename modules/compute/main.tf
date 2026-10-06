resource "azurerm_linux_virtual_machine_scale_set" "app" {
  name                = "vmss-${var.name_prefix}"
  resource_group_name = var.resource_group_name
  location            = var.location

  sku       = var.vm_sku
  instances = var.instance_count

  admin_username                  = var.admin_username
  disable_password_authentication = true

  admin_ssh_key {
    username   = var.admin_username
    public_key = file(pathexpand("~/.ssh/id_ed25519.pub"))
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  network_interface {
    name    = "nic"
    primary = true

    ip_configuration {
      name      = "internal"
      primary   = true
      subnet_id = var.subnet_id

      load_balancer_backend_address_pool_ids = [
        var.backend_pool_id
      ]
    }
  }

  custom_data = base64encode(<<-EOF
    #!/bin/bash
    apt-get update
    apt-get install -y nginx
    echo "<h1>Azure Terraform Project</h1><p>Served by VMSS</p>" > /var/www/html/index.html
    systemctl enable nginx
    systemctl restart nginx
  EOF
  )

  tags = var.tags
}