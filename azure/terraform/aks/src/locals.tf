locals {
  tags = {
    APPLICATION : upper("aks")
    BU : upper("Cogna")
    CREATION-DATE : formatdate("YYYYMM", timestamp()),
    COST-CENTER : "400002502051320606200319"
    ENVIRONMENT : upper(terraform.workspace)
    JOURNEY : upper("Jornada Administrativo")
    MODULE : upper("azure")
    REPO : upper("team project: SRE - repo: cogna-aks-administrativo")
    TERRAFORM : upper("true")
    VP : upper("Tech")
  }
}
