module "vnet" {
  source = "git::git@ssh.dev.azure.com:v3/kdop/SRE/modules-terraform//modules/cloud-azure/network/vnet"

  vnet_name        = lower("aks-administrativo-${terraform.workspace}")
  vnet_rg_location = var.location[terraform.workspace]
  vnet_rg_name     = data.azurerm_resource_group.rg_administrativo.name
  vnet_address     = var.v_address[terraform.workspace]
  vnet_dns_servers = [
    "172.26.244.11", // DNS-VPN
    "172.26.244.12", // DNS-VPN
    "168.63.129.16"  // DNS-AZURE
    ]

  tags = local.tags
}

module "subnet" {
  source = "git::git@ssh.dev.azure.com:v3/kdop/SRE/modules-terraform//modules/cloud-azure/network/subnet"

  subnet_name        = lower("aks-administrativo-${terraform.workspace}")
  subnet_rg_name     = data.azurerm_resource_group.rg_administrativo.name
  subnet_rg_location = var.location[terraform.workspace]
  subnet_intg_vnet   = module.vnet.vnet_name
  subnet_adress      = [var.s_address[terraform.workspace]]
}

resource "azurerm_virtual_network_peering" "peering-adm" {
  count = length(var.peering[terraform.workspace])

  name                          = element([for i in var.peering[terraform.workspace] : i.name], count.index)
  resource_group_name           = data.azurerm_resource_group.rg_administrativo.name
  virtual_network_name          = module.vnet.vnet_name
  remote_virtual_network_id     = element([for i in var.peering[terraform.workspace] : i.virtual_network_id], count.index)
  allow_forwarded_traffic       = element([for i in var.peering[terraform.workspace] : i.forwarded_traffic], count.index)
  allow_gateway_transit         = element([for i in var.peering[terraform.workspace] : i.gateway_transit], count.index)
  allow_virtual_network_access  = element([for i in var.peering[terraform.workspace] : i.virtual_network_access], count.index)
  use_remote_gateways           = element([for i in var.peering[terraform.workspace] : i.remote_gateways], count.index)

  depends_on = [ module.vnet ]
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                              = lower("aks-administrativo-${terraform.workspace}")
  location                          = var.location[terraform.workspace]
  resource_group_name               = data.azurerm_resource_group.rg_administrativo.name
  dns_prefix                        = lower("aks-administrativo-${terraform.workspace}")
  kubernetes_version                = var.aks_version
  automatic_channel_upgrade         = "patch"
  private_cluster_enabled           = true
  role_based_access_control_enabled = true

  network_profile {
    network_plugin = "kubenet"
  }

  default_node_pool {
    name           = "system"
    node_count     = terraform.workspace == "HML" ? 1 : 2
    vm_size        = var.nodes[terraform.workspace].nodepool1.vm_size
    vnet_subnet_id = module.subnet.subnet_id
    zones          = terraform.workspace == "HML" ? null : ["1", "2", "3"]
  }

  identity {
    type         = var.identity_type
    identity_ids = [data.azurerm_user_assigned_identity.identity.id]
  }

  tags = local.tags
}

resource "azurerm_kubernetes_cluster_node_pool" "nodepool" {
  name = var.nodes[terraform.workspace].nodepool1.name

  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  vm_size               = var.nodes[terraform.workspace].nodepool1.vm_size
  node_count            = var.nodes[terraform.workspace].nodepool1.node_count
  zones                 = terraform.workspace == "HML" ? null : ["1", "2", "3"]
  vnet_subnet_id        = module.subnet.subnet_id

  tags = local.tags

  depends_on = [ module.vnet, module.subnet ]

}
