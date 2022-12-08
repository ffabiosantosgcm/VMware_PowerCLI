# PowerCLI Script para deletar snapshot - # Versão 1.1
# @ffabiosantosgcm
# https://www.linkedin.com/in/fabiosantosgomes/
# https://virtualizandoajublog.wordpress.com/
# vCenter 7.0

# Importe VMs de um arquivo .csv e remova todos os snapshot de cada uma das VMs.
Import-Csv D:\VMware_PowerCLI\Snapshots.csv | ForEach-Object{
    Get-VM $_.Name | Get-Snapshot | Remove-Snapshot -RemoveChildren -Confirm:$false

}