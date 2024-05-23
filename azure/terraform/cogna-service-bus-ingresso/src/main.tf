module "sbus" {
  # checkov:skip=CKV_TF_1: ADD REASON    
  source = "git::git@ssh.dev.azure.com:v3/kdop/SRE/modules-terraform//modules/cloud-azure/service-bus"

  sbus_name     = lower("ingresso-${terraform.workspace}")
  sbus_location = "eastus"
  sbus_rg       = data.azurerm_resource_group.rg_ingresso.name
  sbus_tier     = terraform.workspace == "HML" ? "basic" : "standard"

  tags = local.tag_values
}

module "queues" {
  # checkov:skip=CKV_TF_1: ADD REASON    
  source = "git::git@ssh.dev.azure.com:v3/kdop/SRE/modules-terraform//modules/cloud-azure/service-bus/queues"
  count  = length(var.queue_name[terraform.workspace])

  queue_name         = lower(element(var.queue_name[terraform.workspace], count.index))
  queue_max_delivery = 2
  queue_nsid         = module.sbus.sbus_id

  depends_on = [module.sbus]
}

module "topics" {
  # checkov:skip=CKV_TF_1: ADD REASON  
  source = "git::git@ssh.dev.azure.com:v3/kdop/SRE/modules-terraform//modules/cloud-azure/service-bus/topics"
  count  = length(var.topic_name[terraform.workspace])

  topic_name = lower(element(var.topic_name[terraform.workspace], count.index))
  topic_nsid = module.sbus.sbus_id

  depends_on = [module.sbus]
}

resource "azurerm_servicebus_queue_authorization_rule" "rbac_queues" {
  count = length(var.queue_name[terraform.workspace])

  name     = "appQueueRule"
  queue_id = element("${module.queues[*].queue_id}", count.index)

  listen = true
  send   = true
  manage = false

  depends_on = [module.queues]
}

resource "azurerm_servicebus_namespace_authorization_rule" "rbac_sbus" {
  for_each = var.rbac_sbus_name

  name         = each.key
  namespace_id = module.sbus.sbus_id

  listen = true
  send   = true
  manage = each.value
}
