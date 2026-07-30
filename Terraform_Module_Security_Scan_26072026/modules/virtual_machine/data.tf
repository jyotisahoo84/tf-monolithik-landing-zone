data "azurerm_network_interface" "vm_nic" {

    for_each = var.vms
    name = each.value.vm_nic_name
    resource_group_name = each.value.rg_name
  
}