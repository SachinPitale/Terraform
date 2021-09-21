# Create a resource group in EastUS region - Uses Default Provider
resource "azurerm_resource_group " "devrg1" {
    name = "rg-1"
    location = "East US"
}

#Create a resource group in WestUS region - Uses "provider2-westus" provider

resource "azurerm_resource_group" "devrg2" {
    name = "rg-2"
    location = "West Us"
    provider = azurerm.provider2-westus #  This is a Meta-Argument from Resources Section nothing but a Special Argument
}