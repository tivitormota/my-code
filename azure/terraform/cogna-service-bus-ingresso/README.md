<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.76.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.76.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_queues"></a> [queues](#module\_queues) | git::git@ssh.dev.azure.com:v3/kdop/SRE/modules-terraform//modules/cloud-azure/service-bus/queues | n/a |
| <a name="module_sbus"></a> [sbus](#module\_sbus) | git::git@ssh.dev.azure.com:v3/kdop/SRE/modules-terraform//modules/cloud-azure/service-bus | n/a |
| <a name="module_topics"></a> [topics](#module\_topics) | git::git@ssh.dev.azure.com:v3/kdop/SRE/modules-terraform//modules/cloud-azure/service-bus/topics | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_servicebus_namespace_authorization_rule.rbac_sbus](https://registry.terraform.io/providers/hashicorp/azurerm/3.76.0/docs/resources/servicebus_namespace_authorization_rule) | resource |
| [azurerm_servicebus_queue_authorization_rule.rbac_queues](https://registry.terraform.io/providers/hashicorp/azurerm/3.76.0/docs/resources/servicebus_queue_authorization_rule) | resource |
| [azurerm_resource_group.rg_ingresso](https://registry.terraform.io/providers/hashicorp/azurerm/3.76.0/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_queue_name"></a> [queue\_name](#input\_queue\_name) | (Required) Sevice bus queue name | `map(any)` | <pre>{<br>  "HML": [<br>    "capture-cycle-term-updated"<br>  ],<br>  "PRD": []<br>}</pre> | no |
| <a name="input_rbac_sbus_name"></a> [rbac\_sbus\_name](#input\_rbac\_sbus\_name) | Rbac Service Bus Name | <pre>object({<br>    appSbusRule    = string<br>    ingressoQueues = string<br>  })</pre> | <pre>{<br>  "appSbusRule": "false",<br>  "ingressoQueues": "true"<br>}</pre> | no |
| <a name="input_rg_name"></a> [rg\_name](#input\_rg\_name) | (Required) Resource group name | `string` | `"rg-ingresso-shared"` | no |
| <a name="input_sub_id"></a> [sub\_id](#input\_sub\_id) | (Required) Subscription id to deployment | `map(any)` | <pre>{<br>  "HML": "ca143150-8071-4529-97f6-7a3cf512e61b",<br>  "PRD": "c2679671-4c32-4129-8310-1a49f35393a1"<br>}</pre> | no |
| <a name="input_topic_name"></a> [topic\_name](#input\_topic\_name) | (Required) Sevice bus topic name | `map(any)` | <pre>{<br>  "HML": [],<br>  "PRD": []<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sbus_endpoint"></a> [sbus\_endpoint](#output\_sbus\_endpoint) | service bus endpoint |
| <a name="output_sbus_id"></a> [sbus\_id](#output\_sbus\_id) | service bus id |
| <a name="output_sbus_name"></a> [sbus\_name](#output\_sbus\_name) | service bus name |
| <a name="output_sbus_queues"></a> [sbus\_queues](#output\_sbus\_queues) | service bus queues |
| <a name="output_sbus_queues_keys"></a> [sbus\_queues\_keys](#output\_sbus\_queues\_keys) | service bus queues key |
| <a name="output_sbus_sku"></a> [sbus\_sku](#output\_sbus\_sku) | service bus sku |
| <a name="output_sbus_topics"></a> [sbus\_topics](#output\_sbus\_topics) | service bus topics |
<!-- END_TF_DOCS -->