# Create Virtual Network
resource "azurerm_virtual_network" "uatvnet" {
  name = "${var.Business_Unit}-${var.environment}-${var.resource_group_name}"
  location = azurerm_resource_group.myrg1.location
  resource_group_name = azurerm_resource_group.myrg1.name
  address_space = [ "10.10.0.0/16" ]
}




