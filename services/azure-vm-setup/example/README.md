<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.106.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_azure_vm_setup"></a> [azure\_vm\_setup](#module\_azure\_vm\_setup) | ../../azure-vm-setup | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_network_security_rule.port_8000_rule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_network_security_rule.ssh_rule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_password"></a> [admin\_password](#input\_admin\_password) | Password for the virtual machine | `string` | n/a | yes |
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | Username for the virtual machine | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vm_ssh_connection_string"></a> [vm\_ssh\_connection\_string](#output\_vm\_ssh\_connection\_string) | SSH connection string to the Azure virtual machine |
<!-- END_TF_DOCS -->