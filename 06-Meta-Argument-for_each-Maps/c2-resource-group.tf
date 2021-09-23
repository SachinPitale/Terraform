# Create three Resource group on three different location

resource "azurerm_resource_group" "dc" {
    
    for_each = {
        dc1 = "eastus"
        dc2 = "eastus2"
        dc3 = "westus"
    }

    name = "${each.key}-rg"
    location = each.value
  
}