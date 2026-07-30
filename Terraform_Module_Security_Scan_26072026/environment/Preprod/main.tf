module "resource_grp" {

  source  = "../../modules/respurce_group"
  res_grp = var.res_grp

}

module "vnets" {
  depends_on = [module.resource_grp]
  source     = "../../modules/virtual_network"
  vir_net    = var.vir_net

}

module "snets" {

  depends_on = [module.vnets]
  source     = "../../modules/subnet"
  snet       = var.snet

}

module "public_ip" {

  depends_on = [module.resource_grp]
  source     = "../../modules/public_ip"
  pub_ip     = var.pub_ip

}

module "network_interface" {

  depends_on = [module.resource_grp]
  source     = "../../modules/network_interface"
  net_int    = var.net_int

}

module "net_sec_grp" {
  depends_on = [module.resource_grp]
  source     = "../../modules/netowrk_security_group"
  net_sec    = var.net_sec

}

module "bastion" {
  depends_on = [module.public_ip]
  source     = "../../modules/bastion"
  bastion    = var.bastion

}

module "ngw" {
  depends_on = [module.resource_grp]
  source     = "../../modules/nat_gw"
  natgw      = var.natgw

}

module "vir_machine" {
  depends_on = [module.network_interface]
  source     = "../../modules/virtual_machine"
  vms        = var.vms
}

module "appgw" {
  depends_on = [module.public_ip]
  source     = "../../modules/app_gw"
  appgw      = var.appgw
}