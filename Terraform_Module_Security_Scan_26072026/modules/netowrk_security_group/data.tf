data "azurerm_subnet" "snets" {

    for_each = var.net_sec
    name = each.value.nsg_subnet_name
    resource_group_name = each.value.rg_name
    virtual_network_name = each.value.nsg_vir_net_name
  
}