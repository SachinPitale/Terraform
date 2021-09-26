---
title: Terraform Output Values Basics
description: Learn about Terraform Output Values - Basics
---

##  Introduction
- Understand about Output Values and implement them
- Query outputs using `terraform output`
- Understand about redacting secure attributes in output values
- Generate machine-readable output
- You can export both `Argument & Attribute References`
- Redact the sensitive outputs using `sensitve = true` in output block









##  c5-outputs.tf
```t
# 1. Output Values - Resource Group
output "resource_group_id" {
  description = "Resource Group ID"
  # Atrribute Reference
  value = azurerm_resource_group.myrg.id 
}
output "resource_group_name" {
  description = "Resource Group name"
  # Argument Reference
  value = azurerm_resource_group.myrg.name  
}

# 2. Output Values - Virtual Network
output "virtual_network_name" {
  description = "Virutal Network Name"
  value = azurerm_virtual_network.myvnet.name 
}
```

## Step-06: Execute Terraform Commands
```t
# Initialize Terraform
terraform init

# Validate Terraform configuration files
terraform validate

# Format Terraform configuration files
terraform fmt

# Review the terraform plan
terraform plan 

# Create Resources
terraform apply -auto-approve

# Observation
1. Review the outputs in CLI Output
```

##  Query Terraform Outputs
- Terraform will load the project state in state file, so that using `terraform output` command we can query the state file. 
```t
# Terraform Output Commands
terraform output
terraform output resource_group_id
terraform output virtual_network_name
```


##  Output Values - Suppressing Sensitive Values in Output
- We can redact the sensitive outputs using `sensitve = true` in output block
- This will only redact the cli output for terraform plan and apply
- When you query using `terraform output`, you will be able to fetch exact values from `terraform.tfstate` files
- Add `sensitve = true` for output `virtual_network_name`
```t
# 2. Output Values - Virtual Network
output "virtual_network_name" {
  description = "Virutal Network Name"
  value = azurerm_virtual_network.myvnet.name 
  sensitive = true
}
```
- Test the flow
```t
# Terraform Apply
terraform apply -auto-approve
Observation: 
1. You should see the value as sensitive

# Query using terraform output
terraform output virtual_network_name
Observation: 
1. You should get non-redacted original value from terraform.tfstate file
```

## Step-09: Generate machine-readable output
```t
# Generate machine-readable output
terraform output -json
```

## Step-10: Destroy Resources
```t
# Destroy Resources
terraform destroy -auto-approve

# Clean-Up
rm -rf .terraform*
rm -rf terraform.tfstate*

# Comment sensitive=true
In c5-outputs.tf, roll back "sensitive=true"
```


## References
- [Terraform Output Values](https://www.terraform.io/docs/language/values/outputs.html)