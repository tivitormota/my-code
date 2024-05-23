variable "sub_id" {
  type        = map(any)
  description = "(Required) Subscription id to deployment"
  default = {
    HML = ""
    PRD = ""
  }
}

variable "location" {
  type = map(any)
  default = {
    HML = "eastus"
    PRD = "brazilsouth"
  }
}

variable "v_address" {
  type        = map(any)
  description = "vnet address"
  default = {
    HML = ["172.23.86.0/23"]
    PRD = ["172.23.32.0/23"]
  }
}

variable "s_address" {
  type        = map(any)
  description = "subnet address"
  default = {
    HML = "172.23.86.0/25"
    PRD = "172.23.32.0/24"
  }
}

variable "aks_version" {
  type    = string
  default = "1.29"
}

variable "aks_sku_tier" {
  type    = string
  default = "Standard"
}

variable "identity_type" {
  type        = string
  default     = "UserAssigned"
  description = "(Optional) The type of identity used for the managed cluster. Conflicts with `client_id` and `client_secret`. Possible values are `SystemAssigned` and `UserAssigned`. If `UserAssigned` is set, an `identity_ids` must be set as well."

  validation {
    condition     = var.identity_type == "SystemAssigned" || var.identity_type == "UserAssigned"
    error_message = "`identity_type`'s possible values are `SystemAssigned` and `UserAssigned`"
  }
}

variable "nodes" {
  type = map(any)
  default = {
    HML = {
      nodepool1 = {
        name       = "nodeapp"
        vm_size    = "Standard_B4ms"
        node_count = 1
      }
    }
    PRD = {
      nodepool1 = {
        name       = "nodeapp"
        vm_size    = "Standard_D4s_v5"
        node_count = 2
      }
    }
  }
}

variable "peering" {
  description = "peerings"
  default = {
    HML = {
      peering01 = {
        name = "peering-aks-administrativo-to-hub-transit-ecx-cogna"
        virtual_network_id = "/subscriptions/47088bc7-1b3c-4b78-8f38-097d958b1775/resourceGroups/RG-VNET-HUB-TRANSIT/providers/Microsoft.Network/virtualNetworks/VNET-HUB-TRANSIT-ECX-COGNA"
        virtual_network_access = true
        forwarded_traffic = true
        remote_gateways = true
        gateway_transit = false
      }

      peering02 = {
        name = "peering-aks-administrativo-to-vnet-atlas"
        virtual_network_id = "/subscriptions/9a32d9b1-a71b-4ead-bc48-6ff3d648084d/resourceGroups/rg-cloud-infra-basic-prd/providers/Microsoft.Network/virtualNetworks/vnet-atlas-prd"
        virtual_network_access = true
        forwarded_traffic = true
        remote_gateways = false
        gateway_transit = false
      }
    }

    PRD = {
      peering01 = {
        name = "peering-aks-administrativo-to-hub-transit-ecx-cogna-prd"
        virtual_network_id = "/subscriptions/47088bc7-1b3c-4b78-8f38-097d958b1775/resourceGroups/RG-VNET-HUB-TRANSIT/providers/Microsoft.Network/virtualNetworks/VNET-HUB-TRANSIT-ECX-COGNA"
        virtual_network_access = true
        forwarded_traffic = true
        remote_gateways = true
        gateway_transit = false
      }

      peering02 = {
        name = "peering-aks-administrativo-to-vnet-atlas-prd"
        virtual_network_id = "/subscriptions/9a32d9b1-a71b-4ead-bc48-6ff3d648084d/resourceGroups/rg-cloud-infra-basic-prd/providers/Microsoft.Network/virtualNetworks/vnet-atlas-prd"
        virtual_network_access = true
        forwarded_traffic = true
        remote_gateways = false
        gateway_transit = false
      }
    }
  }
}

variable "sub_vnet_peering" {
  type = list(string)
  description = "subscription vnet peering"
  default = [ 
    "47088bc7-1b3c-4b78-8f38-097d958b1775",
    "9a32d9b1-a71b-4ead-bc48-6ff3d648084d"
  ] 
}