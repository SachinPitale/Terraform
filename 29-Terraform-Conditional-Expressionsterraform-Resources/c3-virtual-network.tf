# Create Virtual Network
resource "azurerm_virtual_network" "myvnet" {
  count = var.environment == "dev" ? 1 : 0
  name                = "${var.business_unit}-${var.environment}-${var.virtual_network_name}-${count.index}"
  #address_space       = ["10.0.0.0/16"]
  address_space       =  local.vnet_address_space
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name
  tags = local.common_tags
}



