resource "azurerm_resource_group" "myrg1" {
  name = "${var.Business_Unit}-${var.environment}-${var.resource_group_name}"
  location = var.resource_group_location
  tags =  var.common_tags
} 