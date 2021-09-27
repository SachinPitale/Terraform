# Local Values Block
Local {
    # Use-case-1: Shorten the names for more readability
    rg_name = "${var.business_unit}-${var.environment}-${var.resoure_group_name}"
    vnet_name = "${var.business_unit}-${var.environment}-${var.virtual_network_name}"

    # Use-case-2: Common tags to be assigned to all resources
    service_name = "Demo Services"
    owner = "Sachin"
    common_tags = {
        Services = local.service_name
        owner = local.owner
    }
}