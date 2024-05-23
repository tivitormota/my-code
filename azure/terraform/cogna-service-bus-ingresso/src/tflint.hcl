plugin "azurerm" {
  enabled = true
  version = "0.24.0"
  source  = "github.com/terraform-linters/tflint-ruleset-azurerm"
}

rule "terraform_required_version" {
  enabled = false
}

rule "terraform_module_pinned_source" {
  enabled = true
  style = "semver"
  default_branches = ["main"]
}