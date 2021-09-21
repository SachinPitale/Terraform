resource "azurerm_virtaul_network" "uatvnet" {
  name = "Uat-vnet"
  location = azurerm_resource_group.myrg1.location
  resource_group_name = azurerm_resource_group.myrg1.name
}