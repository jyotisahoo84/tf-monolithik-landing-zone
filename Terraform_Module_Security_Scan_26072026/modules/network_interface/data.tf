data "azurerm_subnet" "snets" {

    for_each = var.net_int
    name = each.value.nic_subnet_name
    resource_group_name = each.value.rg_name
    virtual_network_name = each.value.nic_vir_net_name
  
}