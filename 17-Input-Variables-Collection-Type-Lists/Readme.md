## Introduction
- Implement complex type constructors like `list` 

## Implement complex type cosntructors like `list` 
- [Type Constraints](https://www.terraform.io/docs/language/expressions/types.html)
- **list (or tuple):** a sequence of values, like ["10.0.0.0/16", "10.1.0.0/16", 10.2.0.0/16]. 
- Elements in a list or tuple are identified by consecutive whole numbers, starting with zero.
- Implement List function for variable `virtual_network_address_space`

## Execute Terraform Commands
```t
# Initialize Terraform
terraform init

# Validate Terraform configuration files
terraform validate

# Format Terraform configuration files
terraform fmt

# Review the terraform plan
terraform plan 

# Terraform Apply
terraform apply -auto-approve

# Observation
1. Verify Virtual Network using Azure Management Console
2. You should see 3 address spaces for Vnet
```

## Reference List values individually
```t
# Reference List values individually
var.virtual_network_address_space[0]
var.virtual_network_address_space[1]
var.virtual_network_address_space[2]

# Access 
address_space       = [var.virtual_network_address_space[0]]
```

## Update c4-virtual-network.tf
```t
# Create Virtual Network
resource "azurerm_virtual_network" "myvnet" {
  name                = "${var.business_unit}-${var.environment}-${var.virtual_network_name}"
  #address_space      = ["10.0.0.0/16"]
  #address_space       = var.virtual_network_address_space
  address_space       = [var.virtual_network_address_space[0]]
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name
}
```

##  Execute Terraform Commands
```t
# Terraform Plan
terraform plan 

# Terraform Apply
terraform apply -auto-approve

# Observation
1. Verify the Virtual Network using Azure Management Console
2. You should see only one address space for vnet
```

## Clean-Up
```t
# Destroy Resources
terraform destroy -auto-approve

# Delete Files
rm -rf .terraform* 
rm -rf terraform.tfstate*

# Rollback c4-virtual-network.tf (Below line should be enabled)
address_space       = var.virtual_network_address_space
```

## References
- [Terraform Input Variables](https://www.terraform.io/docs/language/values/variables.html)