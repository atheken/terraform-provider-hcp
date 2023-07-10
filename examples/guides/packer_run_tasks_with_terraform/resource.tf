resource "hcp_packer_run_task" "registry" {
  regenerate_hmac = false
}

resource "tfe_organization_run_task" "hcp_packer" {
  name        = "HCP_Packer"
  description = "Ensure usage of compliant images from HCP Packer."
  enabled     = true

  url      = hcp_packer_run_task.registry.endpoint_url
  hmac_key = hcp_packer_run_task.registry.hmac_key
}