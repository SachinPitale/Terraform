# Generate Terraform Plan and use that using Terraform Apply
# Generate plan file with -var and use that with apply

# Generate Terraform plan file

terraform plan -var="resource_group_name=demorg" -var="resource_group_location=westus" -var="virtual_network_name=demovnet" -var="subnet_name=demosubnet"  -out v1.plan


# Terraform Show
terraform show v1.plan

# Create / Deploy Terraform Resources using Plan file
terraform apply v1.plan 