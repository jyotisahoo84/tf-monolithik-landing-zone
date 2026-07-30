res_grp = {
  rg1 = {
    name     = "rg-prod"
    location = "centralindia"
  }

  rg2 = {
    name     = "rg-dev"
    location = "centralindia"
  }

  rg3 = {
    name     = "rg-humana-dev"
    location = "centralindia"
  }
}

vir_net = {
  vnet1 = {
    name          = "vnet-prod"
    rg_name       = "rg-prod"
    location      = "centralindia"
    address_space = ["10.0.0./16"]
  }
}

snet = {
  snet1 = {
    name             = "snet-frontend"
    rg_name          = "rg-prod"
    vnet_name     = "vnet-prod"
    address_prefix = ["10.0.1.0/24"]
  }

  snet2 = {
    name             = "snet-backend"
    rg_name          = "rg-prod"
    vnet_name     = "vnet-prod"
    address_prefix = ["10.0.3.0/24"]
  }

  snet3 = {
    name             = "AzureBastionSubnet"
    rg_name          = "rg-prod"
    vnet_name     = "vnet-prod"
    address_prefix = ["10.0.6.0/26"]
  }

  snet4 = {
    name           = "snet-appgateway"
    rg_name        = "rg-prod"
    vnet_name      = "vnet-prod"
    address_prefix = ["10.0.5.0/24"]
  }
}

pub_ip = {

  pip1 = {
    name              = "pip-natgw"
    rg_name           = "rg-prod"
    location          = "centralindia"
    allocation_method = "Static"
    sku               = "Standard"
  }


  pip2 = {
    name              = "pip-bastion"
    rg_name           = "rg-prod"
    location          = "centralindia"
    allocation_method = "Static"
    sku               = "Standard"
  }

  pip3 = {
    name              = "pip-appgateway"
    rg_name           = "rg-prod"
    location          = "centralindia"
    allocation_method = "Static"
    sku               = "Standard"
  }
}

net_int = {
  nic1 = {
    name             = "nic-linux1"
    location         = "centralindia"
    rg_name          = "rg-prod"
    nic_vir_net_name = "vnet-prod"
    nic_subnet_name  = "snet-frontend"
  }

  nic2 = {
    name             = "nic-linux2"
    location         = "centralindia"
    rg_name          = "rg-prod"
    nic_vir_net_name = "vnet-prod"
    nic_subnet_name  = "snet-frontend"
  }

}

net_sec = {
  nsg1 = {
    name             = "nsg-frontend"
    location         = "centralindia"
    rg_name          = "rg-prod"
    nsg_subnet_name  = "snet-frontend"
    nsg_vir_net_name = "vnet-prod"
  }
}

natgw = {
  nat1 = {
    name         = "nat-frontend"
    location     = "centralindia"
    rg_name      = "rg-prod"
    nat_pip_name = "pip-natgw"
    snet_name    = "snet-frontend"
    vnet_name    = "vnet-prod"
    sku          = "Standard"

  }
}

vms = {
  vm1 = {
    name        = "vm-linux1"
    rg_name     = "rg-prod"
    location    = "centralindia"
    size        = "Standard_D2s_v3"
    hostname    = "vm1-linux"
    user        = "testadmin"
    password    = "Password1234!"
    vm_nic_name = "nic-linux1"
    os_disk     = "frontend-linux1-osdisk"
  }

  vm2 = {
    name        = "vm-linux2"
    rg_name     = "rg-prod"
    location    = "centralindia"
    size        = "Standard_D2s_v3"
    hostname    = "vm2-linux"
    user        = "testadmin"
    password    = "Password1234!"
    vm_nic_name = "nic-linux2"
    os_disk     = "frontend-linux2-osdisk"
  }
}

bastion = {
  bast1 = {
    name                = "prod-bastion"
    location            = "centralindia"
    rg_name             = "rg-prod"
    bastion_subnet_name = "AzureBastionSubnet"
    bastion_pip_name    = "pip-bastion"
    vnet_name           = "vnet-prod"
  }
}

appgw = {

  app1 = {

    name               = "appgw-test"
    location           = "centralindia"
    rg_name            = "rg-prod"
    subnet_name        = "snet-appgateway"
    vnet_name          = "vnet-prod"
    public_ip_name     = "pip-appgateway"
    vm_linux1_nic_name = "nic-linux1"
    vm_linux2_nic_name = "nic-linux2"

  }

}