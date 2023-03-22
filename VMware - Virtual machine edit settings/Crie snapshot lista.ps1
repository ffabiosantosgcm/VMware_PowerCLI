# PowerCLI Crie snapshot a partir de um arquivo csv - # Versão 1.1
# @ffabiosantosgcm
# https://www.linkedin.com/in/fabiosantosgomes/
# https://virtualizandoajublog.wordpress.com/
# vCenter 7.0

# Importe VMs de um arquivo .csv e crie snapshot de cada uma das VMs.

Import-Csv "D:\VMware_PowerCLI\Snapshots.csv" | ForEach-Object

{ # Crédito para o mestre "@LucD" da comunidade VMware
    Get-VM $_.Name | New-Snapshot -Name "Snapshot" -Quiesce:$true -Confirm:$false
}

#Ou

# Import-Csv "D:\VMware_PowerCLI\Snapshots.csv" | %{
#     Get-VM $_.Name | New-Snapshot -Name "Snapshot" -Memory:$true -Confirm:$false
# }