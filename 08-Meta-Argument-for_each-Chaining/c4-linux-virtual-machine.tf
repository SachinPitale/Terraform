# In azurerm_linux_virtual_machine resource we are using the for_each argument by referring to Network Interface Resource named azurerm_network_interface.myvmnic. This is called for_each chaining.
# for_each chaining
# for_each = azurerm_network_interface.myvmnic 
# Resource: Azure Linux Virtual Machine


resource "azurerm_linux_virtual_machine" "webserver" {
  for_each = azurerm_network_interface.web1-inc #for_each chaining
  # Define Explicit Dependency that if VM Nic exists, then only create VM
  depends_on = [azurerm_network_interface.web1-inc]

  name = "webserver-${each.key}"
  computer_name = "apache-webserver-${each.key}"
  resource_group_name = azurerm_resource_group.myrg1.name
  location = azurerm_resource_group.myrg1.location
  size = "Standard_DS1_v2"
  admin_username = "azureuser"
  network_interface_ids = [ azurerm_network_interface.web1-inc[each.key].id ]
  admin_ssh_key {
    username = "azureuser"
    public_key = file("${path.module}/ssh-keys/terraform-azure.pub")
  }
  os_disk {
    name = "osdisk-${each.key}"
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"

  }
  source_image_reference {
    publisher =  "RedHat"
    offer = "RHEL"
    sku = "83-gen2"
    version = "latest"
  }
  custom_data = filebase64("${path.module}/app-scripts/app1-cloud-init.txt")
}