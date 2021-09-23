# Create Virtual Network
resource "azurerm_virtual_network" "uatvnet" {
  name = "Uat-vnet"
  location = azurerm_resource_group.myrg1.location
  resource_group_name = azurerm_resource_group.myrg1.name
  address_space = [ "10.10.0.0/16" ]
}

# Create Subnet
resource "azurerm_subnet" "websubnet" {
  name = "websunbet"
  resource_group_name =  azurerm_resource_group.myrg1.name
  virtual_network_name = azurerm_virtual_network.uatvnet.name
  address_prefixes = [ "10.10.1.0/24" ]

}

# Create Public IP Address
resource "azurerm_public_ip" "web1" {
  depends_on = [
    azurerm_virtual_network.uatvnet,
    azurerm_subnet.websubnet  
  ]
  for_each = toset(["vm1","vm2"]) 
  name = "webserver-${each.key}"
  resource_group_name = azurerm_resource_group.myrg1.name
  location = azurerm_resource_group.myrg1.location
  allocation_method = "Static"
  domain_name_label = "webserver-${each.key}"
  tags = {
    environemt = "UAT"
  }
  
}

# Create Network Interface

resource "azurerm_network_interface" "web1-inc" {
  for_each = toset(["vm1","vm2"])
  name = "webserver-${each.key}"
  location = azurerm_resource_group.myrg1.location
  resource_group_name = azurerm_resource_group.myrg1.name
  ip_configuration  {
    name = "internal"
    subnet_id = azurerm_subnet.websubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.web1[each.key].id 

  }  
}

