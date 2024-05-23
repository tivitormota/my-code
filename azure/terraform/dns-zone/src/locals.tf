locals {
  tags_values = {
    APPLICATION : upper("dnszone")
    BU : upper("Cogna")
    CREATION-DATE : formatdate("YYYYMM", timestamp())
    COST-CENTER : "400002502051320606200319"
    ENVIRONMENT : upper(terraform.workspace)
    JOURNEY : upper("Administrativa")
    MODULE : upper("cadern")
    TERRAFORM : upper("true")
    VP : upper("Tech")
    IAC_REPO : "TEAM PROJECT: SRE - REPO: COGNA-DNS-ZONE"
  }

  dynamic_list  = toset([for each in var.dns_zone : each.rg_name if each.rg_create == true])
}