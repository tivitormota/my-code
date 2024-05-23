## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.51, < 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.103.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_resource_group"></a> [resource\_group](#module\_resource\_group) | git::git@ssh.dev.azure.com:v3/kdop/SRE/modules-terraform//modules/cloud-azure/resource-group | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_dns_zone.dns-zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_zone) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dns_zone"></a> [dns\_zone](#input\_dns\_zone) | name dns zone | `map` | <pre>{<br>  "zone01": {<br>    "name": "cadern.com.br",<br>    "rg_create": true,<br>    "rg_location": "brazilsouth",<br>    "rg_name": "rg-adm-lp-cadern-prd"<br>  }<br>}</pre> | no |
| <a name="input_location"></a> [location](#input\_location) | Resource location | `map(string)` | <pre>{<br>  "HML": "eastus",<br>  "PRD": "brazilsouth"<br>}</pre> | no |
| <a name="input_sub_id"></a> [sub\_id](#input\_sub\_id) | Subscription ID | `map(string)` | <pre>{<br>  "HML": "5c18d6bd-3eea-4a4c-b6b2-d0fe23aca128",<br>  "PRD": "ee713cba-114b-4386-b712-c8b9fc97051f"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dns_zone_id"></a> [dns\_zone\_id](#output\_dns\_zone\_id) | ID dns zone |
| <a name="output_dns_zone_name"></a> [dns\_zone\_name](#output\_dns\_zone\_name) | name dns zone |
| <a name="output_resource_group_location"></a> [resource\_group\_location](#output\_resource\_group\_location) | Location of the resource group |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | Name of the resource group |