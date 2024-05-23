variable "sub_id" {
  type        = map(any)
  description = "(Required) Subscription id to deployment"
  default = {
    HML = "ca143150-8071-4529-97f6-7a3cf512e61b"
    PRD = "c2679671-4c32-4129-8310-1a49f35393a1"
  }
}

variable "rg_name" {
  type        = map(any)
  description = "(Required) Resource group name"
  default = {
    HML = "rg-ingresso-funil-hml"
    PRD = "rg-ingresso-funil-prd"
  }
}

variable "storage_name" {
  type        = string
  description = "(Required) Storage Account name"
  default     = "vitrineavancada"
}

variable "storage_tier" {
  type        = string
  description = "(Required) Storage Account tier"
  default     = "Standard"
}

variable "storage_acccess" {
  type        = string
  description = "(Required) Storage Account tier"
  default     = "Hot"
}

variable "storage_tls_version" {
  type        = string
  description = "(Optional) The minimum supported TLS version for the storage account. Possible values are TLS1_0, TLS1_1, and TLS1_2. Defaults to TLS1_2 for new storage accounts."
  default     = "TLS1_2"
}

variable "storage_kind" {
  type        = string
  description = "(Optional) Defines the Kind of account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2. Defaults to StorageV2."
  default     = "StorageV2"
}

variable "storage_replication" {
  type        = string
  description = "(Required) Storage Account replication"
  default     = "LRS"
}
