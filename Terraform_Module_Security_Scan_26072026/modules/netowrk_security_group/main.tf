resource "azurerm_network_security_group" "net_sec_grp" {

    for_each = var.net_sec

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  security_rule {
    name                       = "Allow-SSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Allow-HTTP"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  
}


resource "azurerm_subnet_network_security_group_association" "snet_nsg_assoc" {

    for_each = var.net_sec
    subnet_id = data.azurerm_subnet.snets[each.key].id
    network_security_group_id = azurerm_network_security_group.net_sec_grp[each.key].id
  
}