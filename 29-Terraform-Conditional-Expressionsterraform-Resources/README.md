---
title: Terraform Conditional Expressions
description: Learn about Terraform Conditional Expressions
---



##  c5-virtual-network.tf
- Understand and implement `Terraform Conditional Expressions` in Resources
```t
# Create Virtual Network - Conditional Expressions in a Resource Demo
resource "azurerm_virtual_network" "myvnet2" {
  #count = 2
  count = var.environment == "dev" ? 1 : 0
  name                = "${var.business_unit}-${var.environment}-${var.virtual_network_name}-${count.index}"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name
  tags = local.common_tags
}

# Terraform Plan: When Variable values, environment = dev 
terraform plan
Observation: 
1) Plan will generate with 1 Virtual Network for  azurerm_virtual_network.myvnet2 Resource

# Terraform Plan: When Variable values, environment = qa 
terraform plan
Observation: 
1) Plan will generate without any virtual network
```

## Step-07: Clean-Up
```t
# Terraform Destroy
terraform destroy -auto-approve

# Clean-Up
rm -rf .terraform*
rm -rf terraform.tfstate*

# Uncomment and Comment right values in c2-variables.tf (Roll back to put ready for student demo)
- For "environment" Variable, enable default = "dev"
```

