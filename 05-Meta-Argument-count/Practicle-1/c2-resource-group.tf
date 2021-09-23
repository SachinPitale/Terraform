
## Resource-1: Azure Resource Group
resource "azurerm_resource_group" "devrg" {
  count = 3
  name = "devrg-${count.index}" 
  location =  "East US"
}