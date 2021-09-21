resource "azurerm_virtual_network" "uatvnet" {
  name = "Uat-vnet"
  location = azurerm_resource_group.myrg1.location
  resource_group_name = azurerm_resource_group.myrg1.name
  address_space = [ "10.10.0.0/16" ]
}

resource "azurerm_subnet" "websubnet" {
  name = "websunbet"
  resource_group_name =  azurerm_resource_group.myrg1.name
  virtual_network_name = azurerm_virtual_network.uatvnet
  address_prefixes = [ "10.10.1.0/24" ]

}

resource "azurerm_public_ip" "web1" {
  depends_on = [
    azurerm_virtual_network.uatvnet,
    azurerm_subnet.websubnet  
  ]
  name = "web1"
  resource_group_name = azurerm_resource_group.myrg1.name
  location = azurerm_resource_group.myrg1.location
  allocation_method = "static"
  domain_name_label = "web1-vm-${random_string.myrandom.id}"
  tags = {
    environemt = UAT
  }
  
}
