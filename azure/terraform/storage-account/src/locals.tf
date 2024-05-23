locals {
  tag_values = {
    "APPLICATION" : upper("vitrine avancada"),
    "COST-CENTER" : "400000031021320606200316",
    "ENVIRONMENT" : upper("${terraform.workspace}"),
    "JOURNEY" : upper("JORNADA INGRESSO"),
    "MODULE" : upper("STATIC SITE"),
    "REPO" : upper("TEAM PROJECT: funil - REPO: infra-vitrine-avancada"),
    "OWNER" : upper("funil")
  }
}
