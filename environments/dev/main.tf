module "rg" {
  source   = "../../modules/rg"

  name     = "demo-rg-test"
  location = "canadacentral"
}
  
module "storage" {
  source              = "../../modules/storage"

  name                = "demobackendtristore"
  resource_group_name = module.rg.name
  location            = module.rg.location
}
module "vnet" {
  source = "../../modules/vnet"

  name                = "demo-vnet"
  location            = module.rg.location
  resource_group_name = module.rg.name

  address_space = ["10.0.0.0/16"]
}
module "AKS" {
  source = "../../modules/AKS"

  name                = "demo-aks"
  location            = module.rg.location
  resource_group_name = module.rg.name

  dns_prefix = "demoaks"
  node_count = 2
  subnet_id  = module.vnet.subnet_id
}
