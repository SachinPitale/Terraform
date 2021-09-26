# 1. Output Values for Resource Group Resource
output "resource_group_id" {
  description = "Resource Group ID"
  # Attribute Reference
  value = azurerm_resource_group.myrg.id 
}
output "resource_group_name" {
  description = "Resource Group Name"
  # Argument Reference
  value = azurerm_resource_group.myrg.name
}

# 2. Output Values for Virtual Network Resource
/*
output "virtual_network_name" {
  description = "Virtal Network Name"
  value = azurerm_virtual_network.myvnet[*].name  
  #sensitive = true  
}
*/


# Output - For Loop One Input and List Output with VNET Name 
output "virtual_network_name_list_one_input" {
  description = "Virtual Network - For Loop One Input and List Output with VNET Name"
  value = [for vnet in azurerm_virtual_network.myvnet: vnet]
  
}

# Output - For Loop Two Inputs, List Output which is Iterator i (var.environment)
output "virtual_network_name_list_two_inputs" {
  description = "Virtual Network - For Loop Two Inputs, List Output which is Iterator i (var.environment)"
  #value = [for i, vnet in azurerm_virtual_network.myvnet: i ]
  value = [for env, vnet in azurerm_virtual_network.myvnet: env]
  
}