module "resource_group" {
  source = "git::git@ssh.dev.azure.com:v3/kdop/SRE/modules-terraform//modules/cloud-azure/resource-group"
  count = length(local.dynamic_list)

  rg_name     = element([for i in local.dynamic_list : i], count.index)
  rg_location = var.location[terraform.workspace]

  tags                = local.tags_values
}

resource "azurerm_dns_zone" "dns-zone" {
  count = length(var.dns_zone)

  name                = element([for i in var.dns_zone : i.name], count.index)
  resource_group_name = element([for i in var.dns_zone : "rg-${i.rg_name}"], count.index)

  tags                = local.tags_values

  depends_on = [ module.resource_group ]
}