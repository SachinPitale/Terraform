# Create Virtual Network
resource "azurerm_virtual_network" "uatvnet" {
  name = "${var.Business_Unit}-${var.environment}-${var.resource_group_name}"
  location = azurerm_resource_group.myrg1.location
  resource_group_name = azurerm_resource_group.myrg1.name
  # address_space = var.virtual_network_address_space
    address_space = [var.virtual_network_address_space[0]]
}




