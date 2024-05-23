locals {
  tag_values = {
    "APPLICATION" : upper("AZURE SERVICE BUS"),
    "COST-CENTER" : "400000031021320606200316",
    "ENVIRONMENT" : upper(terraform.workspace),
    "DATA-CREATION" : formatdate("YYYYMM", timestamp()),
    "JOURNEY" : upper("JORNADA INGRESSO"),
    "MODULE" : upper("SERVICE BUS"),
    "REPO" : upper("TEAM PROJECT: SRE - REPO: COGNA-SERVICE-BUS-INGRESSO"),
    "TERRAFORM" : "TRUE"
  }
}
