variable "sub_id" {
  type        = map(string)
  description = "Subscription ID"
  default = {
    HML = "5c18d6bd-3eea-4a4c-b6b2-d0fe23aca128" #Jornada-Administrativa-HML
    PRD = "ee713cba-114b-4386-b712-c8b9fc97051f" #Jornada-Administrativa-PRD
  }
}

variable "location" {
  type = map(string)
  description = "Resource location"
  default = {
    HML = "eastus"
    PRD = "brazilsouth"
  }
}

variable "dns_zone" {
  description = "name dns zone"
  default = {
    zone01 = {
      name        = "cadern.com.br"
      rg_name     = "adm-lp-cadern-prd"
      rg_location = "brazilsouth"
      rg_create   = true
    }
  }
}