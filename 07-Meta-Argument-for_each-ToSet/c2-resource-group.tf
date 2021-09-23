# Terraform toset() function
# toset converts its argument to a set value. In short, it does a explicit type conversion to normalize the types.
# Important Note-1: Terraform's concept of a set requires all of the elements to be of the same type, mixed-typed elements will be converted to the most general type
# Important Note-2: Set collections are unordered and cannot contain duplicate values, so the ordering of the argument elements is lost and any duplicate values are coalesced


resource "azurerm_resource_group" "dc" {
    for_each = toset([ "eastus","eastus2","westus" ])
    name = "${each.value}-rg"
    location = each.key
  
}